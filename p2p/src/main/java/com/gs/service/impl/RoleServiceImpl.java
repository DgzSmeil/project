package com.gs.service.impl;

import com.gs.bean.Role;
import com.gs.common.Pager;
import com.gs.dao.RoleDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.RoleService;
import com.gs.vo.RoleJurVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
@Service
public class RoleServiceImpl extends AbstractBaseService implements RoleService{

    private RoleDAO roleDAO;

    @Autowired
    public void setRoleDAO(RoleDAO roleDAO) {
        super.setBaseDAO(roleDAO);
        this.roleDAO = roleDAO;
    }

    @Override
    public void insertBatch(RoleJurVO roleJurVO) {
        roleDAO.insertBatch(roleJurVO);
    }

    @Override
    public List<String> listRoles(String phone) {
        return roleDAO.listRoles(phone);
    }
}
