package com.gs.dao;

import com.gs.common.Pager;
import com.gs.vo.ControllerStatusVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TzbDAO接口，实现CRUD
 * 创建时间：2017/12/21 16:14
 *
 * @author 温宁宁
 * @version 1.0
 */
@Repository
public interface HkbDAO extends BaseDAO {
    void saveList(List hkbList);
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    List<Object> list(@Param("pager") Pager pager, @Param("query") Object obj);
    Long count(@Param("query") Object obj);
    List<Object> listByBaid(@Param("query") Object object);
    ControllerStatusVO update_hkb(Object object);
}
