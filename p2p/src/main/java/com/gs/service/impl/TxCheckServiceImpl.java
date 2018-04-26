package com.gs.service.impl;

import com.gs.dao.TxCheckDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.TxCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/1/4.
 */
@Service
public class TxCheckServiceImpl extends AbstractBaseService implements TxCheckService {

    private TxCheckDAO txCheckDAO;

    @Autowired
    public void setTxCheckDAO(TxCheckDAO txCheckDAO) {
        super.setBaseDAO(txCheckDAO);
        this.txCheckDAO = txCheckDAO;
    }
}
