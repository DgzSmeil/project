package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.service.TestService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 创建类名：TestServiceImpl
 * 创建时间：2017/12/19 9:20
 *
 * @author 温宁宁
 * @version 1.0
 */
@Service
public class TestServiceImpl implements TestService {
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
        return null;
    }
}
