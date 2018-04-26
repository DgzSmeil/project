package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.ShBorrowDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.ShBorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 创建类名：ShBorrowServiceImpl
 * 创建时间：2017/12/21 16:09
 *
 * @author 温宁宁
 * @version 1.0
 */
@Service
public class ShBorrowServiceImpl extends AbstractBaseService implements ShBorrowService {


    private ShBorrowDAO shBorrowDAO;
    @Autowired
    public void setShBorrowDAO(ShBorrowDAO shBorrowDAO) {
        super.setBaseDAO(shBorrowDAO);
        this.shBorrowDAO = shBorrowDAO;
    }
}
