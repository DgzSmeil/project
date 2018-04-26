package com.gs.service.impl;

import com.gs.bean.RoleUser;
import com.gs.common.Pager;
import com.gs.dao.RoleUserDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.RoleService;
import com.gs.service.RoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
@Service
public class RoleUserServiceImpl extends AbstractBaseService implements RoleUserService{
    

    private RoleUserDAO roleUserDAO;

    @Autowired
    public void setRoleUserDAO(RoleUserDAO roleUserDAO) {
        super.setBaseDAO(roleUserDAO);
        this.roleUserDAO = roleUserDAO;
    }
}
