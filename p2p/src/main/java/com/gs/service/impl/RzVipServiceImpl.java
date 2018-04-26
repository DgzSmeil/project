package com.gs.service.impl;

import com.gs.dao.RzVipDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.RzVipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class RzVipServiceImpl extends AbstractBaseService implements RzVipService {

    private RzVipDAO rzVipDAO;

    @Autowired
    public void setRzVipDAO(RzVipDAO rzVipDAO) {
        super.setBaseDAO(rzVipDAO);
        this.rzVipDAO = rzVipDAO;
    }

}
