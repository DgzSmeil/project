package com.gs.service.impl;

import com.gs.bean.User;
import com.gs.dao.UserDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class UserServiceImpl extends AbstractBaseService implements UserService {
    private UserDAO userDAO;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        super.setBaseDAO(userDAO);
        this.userDAO = userDAO;
    }

    @Override
    public User getByPhonePwd(String phone, String upwd) {
        return userDAO.getByPhonePwd(phone, upwd);
    }

    @Override
    public User getByPhone(String uname) {
        return userDAO.getByPhone(uname);
    }

    @Override
    public User getByUserCode(String tzm) {
        return userDAO.getByUserCode(tzm);
    }

    @Override
    public User getByIdPassword(Long id) {
        return userDAO.getByIdPassword(id);
    }

    @Override
    public User getUserById(Long id) {
        return userDAO.getUserById(id);
    }

}
