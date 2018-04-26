package com.gs.service.impl;

import com.gs.bean.Jklx;
import com.gs.common.Pager;
import com.gs.dao.BaseDAO;
import com.gs.dao.JklxDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class JklxServiceImpl extends AbstractBaseService implements JklxService {
    private JklxDAO jklxDAO;

    @Autowired
    public void setJklxDAO(JklxDAO jklxDAO) {
        super.setBaseDAO(jklxDAO);
        this.jklxDAO = jklxDAO;
    }

    @Override
    public void save(Object obj) {
        super.save(obj);
    }

    @Override
    public void removeById(Long id) {
        super.removeById(id);
    }

    @Override
    public void update(Object obj) {
        super.update(obj);
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(jklxDAO.listPager(pager));
        pager.setTotal((long) jklxDAO.countByPager());
        return pager;
    }

    @Override
    public int countByPager() {
        return jklxDAO.countByPager();
    }

}
