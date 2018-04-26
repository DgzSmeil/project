package com.gs.service.impl;

import com.gs.bean.Bz;
import com.gs.common.Pager;
import com.gs.dao.BaseDAO;
import com.gs.dao.BzDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class BzServiceImpl extends AbstractBaseService implements BzService {
    private  BzDAO bzDAO;

    @Autowired
    public void setBzDAO(BzDAO bzDAO) {
        super.setBaseDAO(bzDAO);
        this.bzDAO = bzDAO;
    }

    @Override
    public void save(Object obj) {
        super.save(obj);
    }

    @Override
    public void update(Object obj) {
        super.update(obj);
    }

    @Override
    public void removeById(Long id) {
        super.removeById(id);
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(bzDAO.listPager(pager));
        pager.setTotal((long) bzDAO.countByPager());
        return pager;
    }

    @Override
    public int countByPager() {
        return bzDAO.countByPager();
    }

    @Override
    public List<Object> listAll() {
        return super.listAll();
    }
}
