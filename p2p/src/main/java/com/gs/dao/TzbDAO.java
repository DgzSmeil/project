package com.gs.dao;

import com.gs.bean.Tzb;
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
public interface TzbDAO extends BaseDAO {
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);
    @Override
    Long countCriteria(@Param("query") Object obj);
    Object getTzb(@Param("uid") Long uid,@Param("baid") Long baid);
    ControllerStatusVO add(Object obj,Object obj2);
    List<Object> list(@Param("query") Object object);

}
