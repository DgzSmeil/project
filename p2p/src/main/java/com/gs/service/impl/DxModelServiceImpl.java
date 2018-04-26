package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.BaseDAO;
import com.gs.dao.DxModelDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.DxModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class DxModelServiceImpl extends AbstractBaseService implements DxModelService {
    private DxModelDAO dxModelDAO;

    @Autowired
    public void setDxModelDAO(DxModelDAO dxModelDAO) {
        super.setBaseDAO(dxModelDAO);
        this.dxModelDAO = dxModelDAO;
    }

    @Override
    public void save(Object obj) {
        super.save(obj);
    }

    @Override
    public void remove(Object obj) {
        super.remove(obj);
    }

    @Override
    public void removeById(Long id) {
        super.removeById(id);
    }

    @Override
    public void update(Object obj) {
        super.update(obj);
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(dxModelDAO.listPager(pager));
        pager.setTotal((long) dxModelDAO.countByPager());
        return pager;
    }

    @Override
    public int countByPager() {
        return dxModelDAO.countByPager();
    }

    public Integer isRegPhone(String phone) {
        return dxModelDAO.isRegPhone(phone);
    }


}
