package com.gs.service.impl;

import com.gs.bean.Notice;
import com.gs.dao.noticeDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.noticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/1/7.
 */
@Service
public class noticeServiceImpl extends AbstractBaseService implements noticeService {

    private noticeDAO noticeDAo;

    @Autowired
    public void setNoticeDAo(noticeDAO noticeDAo) {
        super.setBaseDAO(noticeDAo);
        this.noticeDAo = noticeDAo;
    }

    @Override
    public List<Notice> noticeIndex(Date date) {
        return noticeDAo.noticeIndex(date);
    }
}
