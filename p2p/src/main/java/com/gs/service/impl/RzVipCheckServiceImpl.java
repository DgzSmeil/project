package com.gs.service.impl;

import com.gs.dao.RzVipCheckDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.RzVipCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class RzVipCheckServiceImpl extends AbstractBaseService implements RzVipCheckService {

    private RzVipCheckDAO rzVipCheckDAO;

    @Autowired
    public void setRzVipCheckDAO(RzVipCheckDAO rzVipCheckDAO) {
        super.setBaseDAO(rzVipCheckDAO);
        this.rzVipCheckDAO = rzVipCheckDAO;
    }

}
