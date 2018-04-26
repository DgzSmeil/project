package com.gs.service.impl;

import com.gs.bean.*;
import com.gs.common.Pager;
import com.gs.dao.*;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.SkbQuery;
import com.gs.service.AbstractBaseService;
import com.gs.service.HkbService;
import com.gs.service.TzbService;
import com.gs.vo.BorrowDetailVO;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.JkbVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.BigInteger;
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
public class HkbServiceImpl extends AbstractBaseService implements HkbService {

    private HkbDAO hkbDAO;

    private UserMoneyDAO userMoneyDAO;

    private LogMoneyDAO logMoneyDAO;

    private SkbDAO skbDAO;

    private BorrowApplyDAO borrowApplyDAO;

    @Autowired
    public void setHkbDAO(HkbDAO hkbDAO) {
        super.setBaseDAO(hkbDAO);
        this.hkbDAO = hkbDAO;
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
    public void setSkbDAO(SkbDAO skbDAO) {
        this.skbDAO = skbDAO;
    }
    @Autowired
    public void setBorrowApplyDAO(BorrowApplyDAO borrowApplyDAO) {
        this.borrowApplyDAO = borrowApplyDAO;
    }

    @Override
    public void saveList(List hkbList) {
        hkbDAO.saveList(hkbList);
    }

    @Override
    public Pager list(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(hkbDAO.list(pager, obj));
        pager.setTotal(hkbDAO.count(obj));
        return pager;
    }

    @Override
    public List<Object> listByBaid(Object object) {
        return hkbDAO.listByBaid(object);
    }

    @Override
    @Transactional
    public ControllerStatusVO update_hkb(Object object) {
        ControllerStatusVO statusVO = null;
        Hkb hkb1 = (Hkb) object;
        Hkb hkb = (Hkb) hkbDAO.getById(hkb1.getHkid());
        UserMoney userMoney =(UserMoney) userMoneyDAO.getByUserId(hkb.getUid());
        BigDecimal money = hkb.getYbx();
        if(userMoney.getKymoney().compareTo(money)<0){
            return ControllerStatusVO.status(ControllerStatusEnum.HKB_UPDATE_FAIL);
        }
        hkb.setHkid(hkb.getHkid());
        hkb.setRnum(hkb.getRnum()+1);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(Calendar.getInstance().getTime());
        hkb.setRtime(calendar.getTime());
        hkb.setRbx(hkb.getYbx());
        hkb.setRlx(hkb.getYlx());
        hkb.setRbj(hkb.getYbj());
        hkb.setState((byte)2);
        hkbDAO.update(hkb);
        JkbVO jkb = (JkbVO) borrowApplyDAO.getById(hkb.getBaid());
        if (jkb.getTerm() == hkb.getDjq()){
            BorrowApply borrowApply = new BorrowApply();
            borrowApply.setBaid(hkb.getBaid());
            borrowApply.setState((byte)5);
            borrowApplyDAO.updateState(borrowApply);
        }
        userMoney.setUid(hkb.getUid());
        userMoney.setZmoney(userMoney.getZmoney().subtract(money));
        userMoney.setKymoney(userMoney.getKymoney().subtract(money));
        userMoneyDAO.update(userMoney);
        LogMoney logMoney = new LogMoney();
        logMoney.setUid(hkb.getUid());
        logMoney.setOut(money);
        logMoney.setIn(new BigDecimal(0));
        logMoney.setType((byte)3);
        logMoneyDAO.save(logMoney);
        SkbQuery skbQuery = new SkbQuery();
        skbQuery.setDjq(hkb.getDjq());
        skbQuery.setBaid(hkb.getBaid());
        List<Skb> skbs = (List) skbDAO.list(skbQuery);
        for (int i = 0; i< skbs.size(); i++){
            Skb skb1 = skbs.get(i);
            skb1.setState((byte)1);
            skbDAO.update(skb1);
        }
        return ControllerStatusVO.status(ControllerStatusEnum.HKB_UPDATE_SUCCESS);
    }


}
