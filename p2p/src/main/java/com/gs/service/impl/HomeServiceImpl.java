package com.gs.service.impl;

import com.gs.bean.Home;
import com.gs.dao.HomeDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BaseService;
import com.gs.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeServiceImpl extends AbstractBaseService implements HomeService{

    private HomeDAO homeDAO;

    @Autowired
    public void setHomeDAO(HomeDAO homeDAO){
        super.setBaseDAO(homeDAO);
        this.homeDAO = homeDAO;
    }


    @Override
    public Home homeppt() {
        return homeDAO.homeppt();
    }
}
