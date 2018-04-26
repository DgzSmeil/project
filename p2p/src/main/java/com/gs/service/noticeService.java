package com.gs.service;

import com.gs.bean.Notice;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/1/7.
 */
public interface noticeService extends BaseService {
    List<Notice> noticeIndex(Date date);
}
