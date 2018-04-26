package com.gs.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.gs.common.Pager;

import java.util.List;

/**
 * 创建时间：2017/12/21.
 * @author 张芳芃
 */
@Repository
public interface RecommendDAO extends BaseDAO {

    int countTzm(@Param("tzm") String tzm);
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    Object recommendRanking();
}
