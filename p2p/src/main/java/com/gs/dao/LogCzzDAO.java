package com.gs.dao;

import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
@Repository
public interface LogCzzDAO extends BaseDAO{
    List<Object> listAllById(Long id);
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("obj") Object obj);
    @Override
    Long countCriteria(@Param("obj") Object obj);
}
