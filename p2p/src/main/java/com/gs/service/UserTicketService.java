package com.gs.service;

import com.gs.vo.UserTicketVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/12/27.
 */
public interface UserTicketService extends BaseService {

    Long getCount(Long uid, Long type);

    List<UserTicketVO> getTicket(Long uid, Long status);
}
