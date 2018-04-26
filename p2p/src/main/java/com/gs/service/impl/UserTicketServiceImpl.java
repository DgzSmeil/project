package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.UserTicketDAO;
import com.gs.service.UserTicketService;
import com.gs.vo.UserTicketVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/27.
 */

@Service

public class UserTicketServiceImpl implements UserTicketService {

    @Autowired
    private UserTicketDAO userTicketDAO;

    @Override
    public void save(Object obj) {
        userTicketDAO.save(obj);
    }

    @Override
    public void remove(Object obj) {
        userTicketDAO.remove(obj);;
    }

    @Override
    public void removeById(Long id) {
        userTicketDAO.removeById(id);
    }

    @Override
    public void update(Object obj) {
        userTicketDAO.update(obj);
    }

    @Override
    public Object getById(Long id) {
        return userTicketDAO.getById(id);
    }

    @Override
    public List<Object> listAll() {
        return userTicketDAO.listAll();
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        return null;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(userTicketDAO.listPagerCriteria(pager,obj));
        pager.setTotal(userTicketDAO.countCriteria(obj));
        return pager;
    }

    @Override
    public Long getCount(Long uid, Long type) {
        return userTicketDAO.getCount(uid,type);
    }

    @Override
    public List<UserTicketVO> getTicket(Long uid, Long status) {
        return userTicketDAO.getTicket(uid,status);
    }
}
