package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.BorrowDetailDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BorrowDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 创建类名：BorrowDetailServiceImpl
 * 创建时间：2017/12/21 16:02
 *
 * @author 温宁宁
 * @version 1.0
 */
@Service
public class BorrowDetailServiceImpl extends AbstractBaseService implements BorrowDetailService {

    private BorrowDetailDAO borrowDetailDAO;

    @Autowired
    public void setBorrowDetailDAO(BorrowDetailDAO borrowDetailDAO) {
        super.setBaseDAO(borrowDetailDAO);
        this.borrowDetailDAO = borrowDetailDAO;
    }

    @Override
    public void updatePic(Object obj) {
        borrowDetailDAO.updatePic(obj);
    }

    @Override
    public void updateBybaid(Object obj) {
        borrowDetailDAO.updateBybaid(obj);
    }
}
