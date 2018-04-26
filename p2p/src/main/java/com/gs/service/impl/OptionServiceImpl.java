package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.OptionDAO;
import com.gs.service.OptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/1/2.
 */
@Service

public class OptionServiceImpl implements OptionService {

    @Autowired
    private OptionDAO optionDAO;

    @Override
    public void save(Object obj) {

    }

    @Override
    public void remove(Object obj) {

    }

    @Override
    public void removeById(Long id) {

    }

    @Override
    public void update(Object obj) {

    }

    @Override
    public Object getById(Long id) {
        return null;
    }

    @Override
    public List<Object> listAll() {
        return null;
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        return null;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(optionDAO.listPagerCriteria(pager,obj));
        pager.setTotal(optionDAO.countCriteria(obj));
        return pager;
    }
}
