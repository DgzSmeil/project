package com.gs.service.impl;

import com.gs.dao.YDataDAO;
import com.gs.service.YDataService;
import com.gs.vo.YDataVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2018/1/18.
 */

@Service

public class YDataServiceImpl implements YDataService {

    @Autowired
    private YDataDAO yDataDAO;

    @Override
    public YDataVO getByMaxDate() {
        return yDataDAO.getByMaxDate();
    }
    @Override
    public List<YDataVO> selectIdAndDate() {
        return yDataDAO.selectIdAndDate();
    }
    @Override
    public BigDecimal countTzbMoney() {
        return yDataDAO.countTzbMoney();
    }
    @Override
    public BigDecimal countMtzbMoney() {
        return yDataDAO.countMtzbMoney();
    }
    @Override
    public Integer getTUserCount() {
        return yDataDAO.getTUserCount();
    }
    @Override
    public Integer getMUserCount() {
        return yDataDAO.getMUserCount();
    }
    @Override
    public Integer getTtzCount() {
        return yDataDAO.getTtzCount();
    }
    @Override
    public Integer getMtzCount() {
        return yDataDAO.getMtzCount();
    }
    @Override
    public Integer getTdkCount() {
        return yDataDAO.getTdkCount();
    }
    @Override
    public Integer getMdkCount() {
        return yDataDAO.getMdkCount();
    }
    @Override
    public Integer getTdkbCount() {
        return yDataDAO.getTdkbCount();
    }
    @Override
    public Integer getMdkbCount() {
        return yDataDAO.getMdkbCount();
    }




}
