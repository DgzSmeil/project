package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.RoleJurDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.RoleJurService;
import com.gs.vo.JurVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
@Service
public class RoleJurServiceImpl extends AbstractBaseService implements RoleJurService {

    private RoleJurDAO roleJurDAO;

    @Autowired
    public void setRoleJurDAO(RoleJurDAO roleJurDAO) {
        super.setBaseDAO(roleJurDAO);
        this.roleJurDAO = roleJurDAO;
    }

    @Override
    public void saveBatch(List<JurVO> jurVOList) {
        roleJurDAO.saveBatch(jurVOList);
    }
}
