package com.gs.service.impl;

import com.gs.bean.Media;
import com.gs.dao.MediaDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BaseService;
import com.gs.service.MediaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;

@Service
public class MediaServiceImpl extends AbstractBaseService implements MediaService{

    private MediaDAO mediaDAO;

    @Autowired
    public void setMediaDAO(MediaDAO mediaDAO){
        super.setBaseDAO(mediaDAO);
        this.mediaDAO = mediaDAO;
    }


    @Override
    public List<Media> mediaPage(Date date) {
        return mediaDAO.mediaPage(date);
    }
}
