package com.gs.service.impl;

import com.gs.bean.HUser;
import com.gs.common.Pager;
import com.gs.dao.HUserDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.HUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class HUserServiceImpl extends AbstractBaseService implements HUserService {

    private HUserDAO hUserDAO;

    @Autowired
    public void sethUserDAO(HUserDAO hUserDAO) {
        super.setBaseDAO(hUserDAO);
        this.hUserDAO = hUserDAO;
    }

    @Override
    public HUser getByPhonePwd(String phone, String pwd) {
        return hUserDAO.getByPhonePwd(phone, pwd);
    }

    //查询员工
    @Override
    public Pager listPagerCriteriaE(int pageNo,int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(hUserDAO.listPagerCriteriaE(pager, obj));
        pager.setTotal(hUserDAO.countCriteriaE(obj));
        return pager;
    }

}
