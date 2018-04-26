package com.gs.dao;

import com.gs.common.Pager;
import com.gs.vo.UserTicketVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
@Repository

public interface UserTicketDAO extends BaseDAO {

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    //获取用户不同的优惠券的数量
    Long getCount(@Param("uid") Long uid, @Param("type") Long type);

    //获取投标时可使用的优惠券
    List<UserTicketVO> getTicket(@Param("uid") Long uid, @Param("status") Long status);

    Object getByukid(@Param("ukid") Long ukid);
}
