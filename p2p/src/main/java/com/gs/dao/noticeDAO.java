package com.gs.dao;

import com.gs.bean.Notice;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/1/7.
 */
@Repository
public interface noticeDAO extends BaseDAO{
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("obj") Object obj);
    @Override
    Long countCriteria(@Param("obj") Object obj);

    List<Notice> noticeIndex(Date date);
}
