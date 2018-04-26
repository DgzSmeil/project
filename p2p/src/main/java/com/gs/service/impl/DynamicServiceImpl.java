package com.gs.service.impl;

import com.gs.bean.Dynamic;
import com.gs.dao.DynamicDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class DynamicServiceImpl extends AbstractBaseService implements DynamicService{

    private DynamicDAO dynamicDAO;

    @Autowired
    public void setDynamicDAO(DynamicDAO dynamicDAO){
        super.setBaseDAO(dynamicDAO);
        this.dynamicDAO = dynamicDAO;
    }

    @Override
    public List<Dynamic> dynamicPage(Date date) {
        return dynamicDAO.dynamicPage(date);
    }
}
