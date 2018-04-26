package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.TicketDAO;
import com.gs.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
@Service

public class TicketServiceImpl implements TicketService {

    @Autowired
    private TicketDAO ticketDAO;

    @Override
    public void save(Object obj) {
        ticketDAO.save(obj);
    }

    @Override
    public void remove(Object obj) {

    }

    @Override
    public void removeById(Long id) {

    }

    @Override
    public void update(Object obj) {
        ticketDAO.update(obj);
    }

    @Override
    public Object getById(Long id) {
        return null;
    }

    @Override
    public List<Object> listAll() {
        return null;
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        return null;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(ticketDAO.listPagerCriteria(pager,obj));
        pager.setTotal(ticketDAO.countCriteria(obj));
        return pager;
    }
}
