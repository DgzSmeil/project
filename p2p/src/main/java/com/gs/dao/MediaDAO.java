package com.gs.dao;

import com.gs.bean.Media;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface MediaDAO extends BaseDAO{
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object object);
    @Override
    Long countCriteria(@Param("query") Object object);

    List<Media> mediaPage(Date date);
}
