package com.gs.dao;

import com.gs.common.Pager;
import com.gs.vo.RoleJurVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
@Repository
public interface RoleDAO extends BaseDAO {
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("role") Object obj);

    @Override
    Long countCriteria(@Param("role") Object obj);

    //插入角色时批量插入角色权限
    public void insertBatch(@Param("roleJurVO") RoleJurVO roleJurVO);

    //根据电话查询所有的juese
    List<String> listRoles(String phone);
}
