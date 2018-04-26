package com.gs.dao;

import com.gs.common.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
public interface BaseDAO {

    void save(Object obj);
    void remove(Object obj);
    void removeById(Long id);
    void update(Object obj);

    Object getById(Long id);
    List<Object> listAll();
    List<Object> listPager(Pager pager);
    Long count();

    List<Object> listPagerCriteria(Pager pager, Object obj);
    Long countCriteria(Object obj);


}
