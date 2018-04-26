package com.gs.service;

import com.gs.bean.Media;

import java.util.Date;
import java.util.List;

public interface MediaService extends BaseService{
    List<Media> mediaPage(Date date);
}
