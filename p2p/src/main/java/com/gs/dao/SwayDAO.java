package com.gs.dao;
import com.gs.bean.Sway;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ：余鹏
 * time：2017/12/25.
 */
@Repository
public interface SwayDAO extends BaseDAO {
    @Override
    List<Object> listPager(@Param("pager") Pager pager);

    @Override
    void removeById(@Param("id")Long id);

    int countByPager();
}

