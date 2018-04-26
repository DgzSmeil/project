package com.gs.service.impl;

import com.gs.bean.LogTx;
import com.gs.common.Pager;
import com.gs.dao.LogTxDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BaseService;
import com.gs.service.LogTxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
@Service
public class LogTxServiceImpl extends AbstractBaseService implements LogTxService {


    private LogTxDAO logTxDAO;

    @Autowired
    public void setLogTxDAO(LogTxDAO logTxDAO) {
        super.setBaseDAO(logTxDAO);
        this.logTxDAO = logTxDAO;
    }

    @Override
    public Pager listByPager(int pageNo, int pageSize, Long uid) {
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(logTxDAO.listByPager(pager,uid));
        return pager;
    }

    @Override
    public void updateById(Byte state, Long id) {
        logTxDAO.updateById(state,id);
    }
}
