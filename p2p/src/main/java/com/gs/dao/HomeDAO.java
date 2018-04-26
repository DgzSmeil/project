package com.gs.dao;

import com.gs.bean.Home;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HomeDAO extends BaseDAO {
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object object);
    @Override
    Long countCriteria(@Param("query") Object object);
    Home homeppt();
}
