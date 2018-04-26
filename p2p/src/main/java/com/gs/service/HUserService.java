package com.gs.service;

import com.gs.bean.HUser;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21
 */
public interface HUserService extends BaseService {

    HUser getByPhonePwd(String phone, String pwd);

    //员工查询
    Pager listPagerCriteriaE(int pageNo,int pageSize,Object obj);


}
