package com.gs.service;

import com.gs.bean.User;

/**
 * Created by Administrator on 2017/12/21
 */
public interface UserService extends BaseService {

    User getByPhonePwd(String phone, String upwd);

    User getByPhone(String phone);

    User getByUserCode(String tzm);

    User getByIdPassword(Long id);

    User getUserById(Long id);
}
