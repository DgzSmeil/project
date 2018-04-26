package com.gs.service.impl;

import com.gs.bean.BankCard;
import com.gs.common.Pager;
import com.gs.dao.BankCardDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BankCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
@Service
public class BankCardServiceImpl extends AbstractBaseService implements BankCardService {

    private BankCardDAO bankCardDAO;

    @Autowired
    public void setBankCardDAO(BankCardDAO bankCardDAO) {
        super.setBaseDAO(bankCardDAO);
        this.bankCardDAO = bankCardDAO;
    }

    @Override
    public List<BankCard> getBylistAll(Long id) {
        return bankCardDAO.getBylistAll(id);
    }

    @Override
    public Long countCriteria(Object obj) {
        return bankCardDAO.countCriteria(obj);
    }

    @Override
    public Long countBank(Long id) {
        return bankCardDAO.countBank(id);
    }
}
