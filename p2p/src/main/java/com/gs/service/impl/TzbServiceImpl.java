package com.gs.service.impl;

import com.gs.bean.*;
import com.gs.common.ACMLoanCalculator;
import com.gs.common.ACPIMLoanCalculator;
import com.gs.common.LoanByMonth;
import com.gs.common.LoanUtil;
import com.gs.dao.*;
import com.gs.enums.ControllerStatusEnum;
import com.gs.enums.HKStatesEnum;
import com.gs.service.AbstractBaseService;
import com.gs.service.TzbService;
import com.gs.vo.BorrowDetailVO;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.UserTicketVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * 创建类名：TzbServiceImpl
 * 创建时间：2017/12/21 16:15
 *
 * @author 温宁宁
 * @version 1.0
 */
@Service
public class TzbServiceImpl extends AbstractBaseService implements TzbService {

    private TzbDAO tzbDAO;

    private UserMoneyDAO userMoneyDAO;

    private LogMoneyDAO logMoneyDAO;

    private BorrowDetailDAO borrowDetailDAO;

    private BorrowApplyDAO borrowApplyDAO;

    private HkbDAO hkbDAO;

    private UserTicketDAO userTicketDAO;

    @Autowired
    public void setTzbDAO(TzbDAO tzbDAO) {
        super.setBaseDAO(tzbDAO);
        this.tzbDAO = tzbDAO;
    }
    @Autowired
    public void setUserMoneyDAO(UserMoneyDAO userMoneyDAO) {
        this.userMoneyDAO = userMoneyDAO;
    }
    @Autowired
    public void setLogMoneyDAO(LogMoneyDAO logMoneyDAO) {
        this.logMoneyDAO = logMoneyDAO;
    }
    @Autowired
    public void setBorrowDetailDAO(BorrowDetailDAO borrowDetailDAO) {
        this.borrowDetailDAO = borrowDetailDAO;
    }
    @Autowired
    public void setBorrowApplyDAO(BorrowApplyDAO borrowApplyDAO) {
        this.borrowApplyDAO = borrowApplyDAO;
    }
    @Autowired
    public void setHkbDAO(HkbDAO hkbDAO) {
        this.hkbDAO = hkbDAO;
    }
    @Autowired
    public void setUserTicketDAO(UserTicketDAO userTicketDAO) {
        this.userTicketDAO = userTicketDAO;
    }


    @Override
    public Object getTzb(Long uid, Long baid) {
        return tzbDAO.getTzb(uid,baid);
    }

    @Transactional
    @Override
    public ControllerStatusVO add(Object obj,Object obj2) {
        ControllerStatusVO statusVO = null;
        Tzb tzb = (Tzb)obj;
        BigDecimal money = tzb.getMoney();
        BigDecimal money2 = BigDecimal.valueOf(0);
        UserTicket userTicket = (UserTicket) obj2;
        if (userTicket.getUkid() != 0){
            UserTicketVO userTicket1 = (UserTicketVO) userTicketDAO.getByukid(userTicket.getUkid());
            if (userTicket1.getType() == 1){
                if(tzb.getMoney().compareTo(new BigDecimal(1000))<0){
                    return ControllerStatusVO.status(ControllerStatusEnum.TZB_SAVE_NO);
                }
            }else{
                userTicket.setKid(userTicket1.getUkid());
                userTicket.setStatus(2);
                userTicketDAO.update(userTicket);
                money2 = userTicket1.getTkmoney();
            }
        }
        //判断是否已经投过这个标
        Tzb tzb1 = (Tzb) tzbDAO.getTzb(tzb.getUid(),tzb.getBaid());
        if (tzb1 == null){
            tzbDAO.save(tzb);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.TZB_SAVE_SUCCESS);
        }else{
            tzb1.setMoney(tzb1.getMoney().add(money));
            tzbDAO.update(tzb1);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.TZB_SAVE_OR);
        }
        //修改自己的资产
        UserMoney userMoney = (UserMoney) userMoneyDAO.getByUserId(tzb.getUid());
        //判断该标是否满标，如未满标则修改已投金额
        BorrowDetailVO borrowDetailVO = (BorrowDetailVO)borrowDetailDAO.getById(tzb.getBaid());
        BorrowDetail borrowDetail = new BorrowDetail();
        borrowDetail.setYtmoney(borrowDetailVO.getYtmoney().add(money));
        borrowDetail.setBaid(borrowDetailVO.getBaid());
        borrowDetailDAO.updateBybaid(borrowDetail);
        //还款期数
        Integer term = borrowDetailVO.getTerm();

        //年化收益
        Float nprofit = borrowDetailVO.getNprofit().floatValue();
        //月利率
        Float monthNpro = nprofit / 12;
        BigDecimal syMoney = BigDecimal.valueOf(0);
        //一次还清和先息后本
        if(borrowDetailVO.getWay().equals("一次性还本付息") || borrowDetailVO.getWay().equals("先息后本")) {
            //投资金额乘以年利率
            syMoney = tzb.getMoney().multiply(BigDecimal.valueOf(monthNpro/100)).multiply(new BigDecimal(term))
                    .setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        //等额本息
        if(borrowDetailVO.getWay().equals("等额本息")) {
            syMoney = new ACPIMLoanCalculator().calLoan(money, term,nprofit,LoanUtil.RATE_TYPE_YEAR).getTotalInterest();
        }
        // 等额本金
        if(borrowDetailVO.getWay().equals("等额本金")) {
            syMoney = new ACMLoanCalculator().calLoan(money, term, nprofit, LoanUtil.RATE_TYPE_YEAR).getTotalInterest();
        }
        userMoney.setUid(tzb.getUid());
        userMoney.setKymoney(userMoney.getKymoney().subtract(money));
        userMoney.setZmoney(userMoney.getZmoney().subtract(money));
        System.out.println("总资产"+userMoney.getZmoney());
        System.out.println("余额"+userMoney.getKymoney());
        userMoney.setTzmoney(userMoney.getTzmoney().add(money));
        userMoney.setDsmoney(userMoney.getDsmoney().add(money.add(syMoney)));
        userMoneyDAO.update(userMoney);
        //修改借款人的冻结金额
        UserMoney juserMoney = (UserMoney) userMoneyDAO.getByUserId(tzb.getJuid());
        juserMoney.setZmoney(juserMoney.getZmoney().add(money));
        juserMoney.setUid(tzb.getJuid());
        if(borrowDetail.getYtmoney().compareTo(borrowDetailVO.getMoney())==0){
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(Calendar.getInstance().getTime());
            BorrowApply borrowApply = new BorrowApply();
            borrowApply.setBaid(borrowDetailVO.getBaid());
            borrowApply.setState((byte)4);
            borrowApply.setMbtime(calendar.getTime());
            borrowApplyDAO.updateState(borrowApply);
            //满标时将借款人的冻结金额变成可用余额
            juserMoney.setDjmoney(juserMoney.getDjmoney().add(money).subtract(borrowDetailVO.getMoney()));
            juserMoney.setKymoney(juserMoney.getKymoney().add(borrowDetailVO.getMoney()));
            Long huid = borrowDetailVO.getHuid();
            //一次还清的还款清单
            if(borrowDetailVO.getWay().equals("一次性还本付息")) {
                Hkb hkb = new Hkb();
                hkb.setBzname(borrowDetailVO.getBzname());
                hkb.setCpname(borrowDetailVO.getCpname());
                hkb.setRname(borrowDetailVO.getRname());
                hkb.setUid(tzb.getJuid());
                hkb.setState((byte)HKStatesEnum.UNREPAY.getCode());
                hkb.setYbj(borrowDetailVO.getMoney());
                hkb.setYlx(syMoney);
                hkb.setYbx(borrowDetailVO.getMoney().add(syMoney));
                hkb.setTnum(1);
                calendar.add(Calendar.MONTH, term);
                hkb.setYtime(calendar.getTime());
                hkb.setHuid(huid);
                hkb.setBaid(tzb.getBaid());
                hkbDAO.save(hkb);

            }else {
                List<Hkb> hkbList = new ArrayList<>();
                for(int i = 1; i <= term; i++) {
                    Hkb hkb = new Hkb();
                    hkb.setBzname(borrowDetailVO.getBzname());
                    hkb.setCpname(borrowDetailVO.getCpname());
                    hkb.setRname(borrowDetailVO.getRname());
                    hkb.setUid(tzb.getJuid());
                    hkb.setState((byte)HKStatesEnum.UNREPAY.getCode());
                    hkb.setHuid(huid);
                    hkb.setTnum(term);
                    hkb.setDjq(i);
                    calendar.add(Calendar.MONTH, 1);
                    hkb.setYtime(calendar.getTime());
                    //每月利息金额
                    BigDecimal bigMonthNpro = BigDecimal.valueOf(monthNpro);
                    //先息后本还款表
                    if( borrowDetailVO.getWay().equals("先息后本")) {
                        //每月利息等于总借款乘以月利率
                        hkb.setYlx(borrowDetailVO.getMoney().multiply(bigMonthNpro));
                        hkb.setYbj(BigDecimal.valueOf(0));
                        //最后一个月还本金加利息
                        if(i == term) {
                            //应还本金
                            hkb.setYbj(borrowDetailVO.getMoney());
                        }
                    }
                    // 等额本金还款算法
                    else if( borrowDetailVO.getWay().equals("等额本金")) {
                        LoanByMonth loanByMonth = new ACMLoanCalculator().calLoan(borrowDetailVO.getMoney(), term, nprofit, LoanUtil.RATE_TYPE_YEAR)
                                .getAllLoans().get(i-1);
                        // 月还本金
                        hkb.setYbj(loanByMonth.getPayPrincipal());
                        // 月利息
                        hkb.setYlx(loanByMonth.getInterest());

                    }
                    // 等额本息还款算法
                    else if(borrowDetailVO.getWay().equals("等额本息")) {
                        LoanByMonth loanByMonth = new ACPIMLoanCalculator().calLoan(borrowDetailVO.getMoney(), term, nprofit, LoanUtil.RATE_TYPE_YEAR)
                                .getAllLoans().get(i-1);
                        //每月利息
                        hkb.setYlx(loanByMonth.getInterest());
                        //每月还款本金
                        hkb.setYbj(loanByMonth.getPayPrincipal());
                    }
                    hkb.setYbx(hkb.getYlx().add(hkb.getYbj()));
                    hkb.setBaid(tzb.getBaid());
                    hkbList.add(hkb);
                }
                hkbDAO.saveList(hkbList);
            }
        }else{
            juserMoney.setDjmoney(juserMoney.getDjmoney().add(money));
        }
        userMoneyDAO.update(juserMoney);
        //新增流水记录
        LogMoney logMoney = new LogMoney();
        logMoney.setType((byte)4);
        logMoney.setIn(new BigDecimal(0));
        logMoney.setOut(money);
        logMoney.setUid(tzb.getUid());
        logMoneyDAO.save(logMoney);
        return statusVO;
    }

    @Override
    public List<Object> list(Object object) {
        return tzbDAO.list(object);
    }

}
