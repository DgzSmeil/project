package com.gs.service.impl;

import com.gs.dao.LetterDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.LetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/1/11.
 */
@Service
public class LetterServiceImpl extends AbstractBaseService implements LetterService {
    private LetterDAO letterDAO;

    @Autowired
    public void setLetterDAO(LetterDAO letterDAO) {
        super.setBaseDAO(letterDAO);
        this.letterDAO = letterDAO;
    }
}
