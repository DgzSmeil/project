package com.gs.service.impl;

import com.gs.bean.LogMoney;
import com.gs.bean.Skb;
import com.gs.bean.Tzb;
import com.gs.bean.UserMoney;
import com.gs.common.*;
import com.gs.dao.BorrowDetailDAO;
import com.gs.dao.LogMoneyDAO;
import com.gs.dao.SkbDAO;
import com.gs.dao.UserMoneyDAO;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.TzbQuery;
import com.gs.service.AbstractBaseService;
import com.gs.service.SkbService;
import com.gs.vo.BorrowDetailVO;
import com.gs.vo.ControllerStatusVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 创建类名：TzbServiceImpl
 * 创建时间：2017/12/21 16:15
 *
 * @author 温宁宁
 * @version 1.0
 */
@Service
public class SkbServiceImpl extends AbstractBaseService implements SkbService {

    private SkbDAO skbDAO;

    private BorrowDetailDAO borrowDetailDAO;

    private UserMoneyDAO userMoneyDAO;

    private LogMoneyDAO logMoneyDAO;

    @Autowired
    public void setSkbDAO(SkbDAO skbDAO) {
        super.setBaseDAO(skbDAO);
        this.skbDAO = skbDAO;
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

    @Override
    public List<Object> list(Object object) {
        return skbDAO.list(object);
    }

    @Transactional()
    @Override
    public ControllerStatusVO add(Object object) {
        TzbQuery tzb = (TzbQuery)object;
        List<Skb> skbs = (List)skbDAO.list(tzb);
        if (skbs.size() != 0){
            return ControllerStatusVO.status(ControllerStatusEnum.TZB_SAVE_FAIL);
        }
        BorrowDetailVO borrowDetailVO = (BorrowDetailVO)borrowDetailDAO.getById(tzb.getBaid());
        //还款期数
        Integer term = borrowDetailVO.getTerm();
        //年化收益
        Float nprofit = borrowDetailVO.getNprofit().floatValue();
        //月利率
        Float monthNpro = nprofit / 12;
        BigDecimal syMoney = BigDecimal.valueOf(0);
        //一次还清和先息后本
        if(borrowDetailVO.getWay().equals("一次性还本付息") || borrowDetailVO.getWay().equals("先息后本")) {
            syMoney = tzb.getMoney().multiply(BigDecimal.valueOf(monthNpro/100)).multiply(new BigDecimal(term))
                    .setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(Calendar.getInstance().getTime());
        //一次还清的收款清单
        if(borrowDetailVO.getWay().equals("一次性还本付息")) {
            Skb skb = new Skb();
            skb.setUid(tzb.getUid());
            skb.setBaid(tzb.getBaid());
            skb.setYbx(tzb.getMoney().add(syMoney));
            skb.setYlx(syMoney);
            skb.setYbj(tzb.getMoney());
            skb.setTnum(1);
            calendar.add(Calendar.MONTH, term);
            skb.setHkdate(calendar.getTime());
            skb.setTzmoney(tzb.getMoney());
            skb.setJuid(borrowDetailVO.getUid());
            skb.setState((byte)1);
            skbDAO.save(skb);

        }else {
            List<Skb> skbList = new ArrayList<>();
            for(int i = 1; i <= term; i++) {
                Skb skb = new Skb();
                skb.setUid(tzb.getUid());
                skb.setBaid(tzb.getBaid());
                skb.setTnum(term);
                calendar.add(Calendar.MONTH, 1);
                skb.setHkdate(calendar.getTime());
                //每月利息金额
                BigDecimal bigMonthNpro = BigDecimal.valueOf(monthNpro);
                //先息后本还款表
                if( borrowDetailVO.getWay().equals("先息后本")) {
                    skb.setYlx(tzb.getMoney().multiply(bigMonthNpro));
                    skb.setYbj(BigDecimal.valueOf(0));
                    //最后一个月还本金加利息
                    if(i == term) {
                        skb.setYbj(tzb.getMoney());
                    }
                }
                // 等额本金还款算法
                else if( borrowDetailVO.getWay().equals("等额本金")) {
                    LoanByMonth loanByMonth = new ACMLoanCalculator().calLoan(tzb.getMoney(), term, nprofit, LoanUtil.RATE_TYPE_YEAR)
                            .getAllLoans().get(i-1);
                    skb.setYbj(loanByMonth.getPayPrincipal());
                    skb.setYlx(loanByMonth.getInterest());

                }
                // 等额本息还款算法
                else if(borrowDetailVO.getWay().equals("等额本息")) {
                    LoanByMonth loanByMonth = new ACPIMLoanCalculator().calLoan(tzb.getMoney(), term, nprofit, LoanUtil.RATE_TYPE_YEAR)
                            .getAllLoans().get(i-1);
                    skb.setYlx(loanByMonth.getInterest());
                    skb.setYbj(loanByMonth.getPayPrincipal());
                }
                skb.setYbx(skb.getYlx().add(skb.getYbj()));
                skb.setJuid(borrowDetailVO.getUid());
                skb.setTzmoney(tzb.getMoney());
                skb.setState((byte)1);
                skb.setDjq(i);
                skbList.add(skb);
            }
            skbDAO.saveList(skbList);
        }
        return ControllerStatusVO.status(ControllerStatusEnum.TZB_SAVE_FAIL);
    }

    @Override
    @Transactional
    public ControllerStatusVO update_skb(Object object) {
        Skb skb = (Skb) object;
        BigDecimal money = skb.getYbx().add(skb.getYlx()).add(skb.getYbj());
        UserMoney userMoney =(UserMoney) userMoneyDAO.getByUserId(skb.getUid());
        userMoney.setUid(skb.getUid());
        userMoney.setZmoney(userMoney.getZmoney().add(money));
        userMoney.setKymoney(userMoney.getKymoney().add(money));
        userMoney.setDsmoney(userMoney.getDsmoney().subtract(money));
        userMoney.setSymoney(userMoney.getSymoney().add(money));
        userMoneyDAO.update(userMoney);
        skb.setSkid(skb.getSkid());
        skb.setRnum(skb.getRnum()+1);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(Calendar.getInstance().getTime());
        skb.setRbx(skb.getYbx());
        skb.setRlx(skb.getYlx());
        skb.setRbj(skb.getYbj());
        skb.setState((byte)3);
        skbDAO.update(skb);
        LogMoney logMoney = new LogMoney();
        logMoney.setUid(skb.getUid());
        logMoney.setOut(new BigDecimal(0));
        logMoney.setIn(money);
        logMoney.setType((byte)6);
        logMoney.setDate(calendar.getTime());
        logMoneyDAO.save(logMoney);
        return ControllerStatusVO.status(ControllerStatusEnum.SKB_UPDATE_SUCCESS);
    }

    @Override
    public BigDecimal SumByDate(Long uid, Date sumaDate) {
        return skbDAO.SumByDate(uid,sumaDate);
    }
}
