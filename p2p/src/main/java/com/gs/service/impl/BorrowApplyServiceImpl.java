package com.gs.service.impl;

import com.gs.dao.BorrowApplyDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BorrowApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 创建类名：BorrowApplyServiceImpl
 * 创建时间：2017/12/26 15:12
 *
 * @author 温宁宁
 * @version 1.0
 */
@Service
public class BorrowApplyServiceImpl extends AbstractBaseService implements BorrowApplyService {

    private BorrowApplyDAO borrowApplyDAO;

    @Autowired
    public void setBorrowApplyDAO(BorrowApplyDAO borrowApplyDAO) {
        super.setBaseDAO(borrowApplyDAO);
        this.borrowApplyDAO = borrowApplyDAO;
    }

    @Override
    public void updateState(Object obj) {
        borrowApplyDAO.updateState(obj);
    }

    @Override
    public void updateState2(Object obj) {
        borrowApplyDAO.updateState2(obj);
    }

    @Override
    public void updateLiubiao() {

    }

    @Override
    public List<Object> listByBzid(Long bzid) {
        return borrowApplyDAO.listByBzid(bzid);
    }

    @Override
    public List<Object> listByUid(Long uid) {
        return borrowApplyDAO.listByUid(uid);
    }
}
