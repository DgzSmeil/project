package com.gs.service.impl;

import com.gs.dao.LogCzzDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.LogCzzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
@Service
public class LogCzzServiceImpl extends AbstractBaseService implements LogCzzService{
    private LogCzzDAO logCzzDAO;
    @Autowired

    public void setLogCzzDAO(LogCzzDAO logCzzDAO) {
        super.setBaseDAO(logCzzDAO);
        this.logCzzDAO = logCzzDAO;
    }

    @Override
    public List<Object> listAllById(Long id) {
        return logCzzDAO.listAllById(id);
    }
}
