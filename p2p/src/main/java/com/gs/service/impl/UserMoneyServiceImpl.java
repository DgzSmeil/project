package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.UserMoneyDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * 创建类名：UserMoneyServiceImpl
 * 创建时间：2017/12/21 11:20
 *
 * @author 温宁宁
 * @version 1.0
 */
@Service
public class UserMoneyServiceImpl extends AbstractBaseService implements UserMoneyService{
    private UserMoneyDAO userMoneyDAO;

    @Autowired
    public void setUserMoneyDAO(UserMoneyDAO userMoneyDAO) {
        super.setBaseDAO(userMoneyDAO);
        this.userMoneyDAO = userMoneyDAO;
    }

    @Override
    public Object getByUserId(Long id) {
        return userMoneyDAO.getByUserId(id);
    }

    @Override
    public void updateById(Long id,BigDecimal money) {
        userMoneyDAO.updateById(id,money);
    }

    @Override
    public void updateByIdMaoll(Long id, BigDecimal money) {
        userMoneyDAO.updateByIdMaoll(id,money);
    }
}
