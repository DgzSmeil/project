package com.gs.dao;

import com.gs.bean.User;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20
 */
@Repository
public interface UserDAO extends BaseDAO {

    User getByPhonePwd(@Param("phone") String phone, @Param("upwd") String upwd);

    User getByPhone(@Param("phone") String phone);

    User getByUserCode(@Param("tzm") String tzm);

    User getByIdPassword(@Param("id") Long id);

    User getUserById(@Param("id") Long id);

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);
}
