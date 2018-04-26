package com.gs.service.impl;

import com.gs.bean.Sway;
import com.gs.common.Pager;
import com.gs.dao.BaseDAO;
import com.gs.dao.SwayDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.SwayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class SwayServiceImpl extends AbstractBaseService implements SwayService {
    private SwayDAO swayDAO;

    @Autowired
    public void setSwayDAO(SwayDAO swayDAO) {
        super.setBaseDAO(swayDAO);
        this.swayDAO = swayDAO;
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
        pager.setRows(swayDAO.listPager(pager));
        pager.setTotal((long) swayDAO.countByPager());
        return pager;
    }

    @Override
    public int countByPager() {
        return swayDAO.countByPager();
    }

}
