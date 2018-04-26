package com.gs.dao;

import com.gs.bean.BankCard;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
@Repository
public interface BankCardDAO extends BaseDAO {
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("obj") Object obj);
    @Override
    Long countCriteria(@Param("obj") Object obj);
    List<BankCard> getBylistAll(Long id);
    Long countBank(Long id);
}
