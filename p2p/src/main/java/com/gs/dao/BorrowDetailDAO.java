package com.gs.dao;

import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * BorrowDetailDAO接口，实现CRUD
 * 创建时间：2017/12/21 16:01
 *
 * @author 温宁宁
 * @version 1.0
 */
@Repository
public interface BorrowDetailDAO extends BaseDAO{
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("obj") Object obj);
    @Override
    Long countCriteria(@Param("obj") Object obj);
    void updatePic(Object obj);
    void updateBybaid(Object obj);
}
