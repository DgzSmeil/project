package com.gs.dao;

import com.gs.bean.HUser;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20
 */
@Repository
public interface HUserDAO extends BaseDAO {

    HUser getByPhonePwd(@Param("phone") String phone, @Param("pwd") String pwd);

    //普通管理员查询
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);
    @Override
    Long countCriteria(@Param("query") Object obj);

    //员工查询
    List<Object> listPagerCriteriaE(@Param("pager") Pager pager, @Param("query") Object obj);
    Long countCriteriaE(@Param("query") Object obj);

}
