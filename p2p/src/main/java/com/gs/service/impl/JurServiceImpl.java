package com.gs.service.impl;

import com.gs.bean.Jur;
import com.gs.common.ExcelUtil;
import com.gs.dao.JurDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.JurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
@Service
public class JurServiceImpl extends AbstractBaseService implements JurService {

    private JurDAO jurDAO;

    @Autowired
    public void setJurDAO(JurDAO jurDAO) {
        super.setBaseDAO(jurDAO);
        this.jurDAO = jurDAO;
    }

    @Override
    public void insertInfoBatch(List<Jur> jurList) {
        jurDAO.insertInfoBatch(jurList);
    }

    @Override
    public void importExcelInfo(InputStream in, MultipartFile file, Integer huid) throws Exception {
        List<List<Object>> listob = ExcelUtil.getBankListByExcel(in, file.getOriginalFilename());
        List<Jur> jurList = new ArrayList<Jur>();
        //遍历listob数据，把数据放到List中
        for (int i = 0; i < listob.size(); i++) {
            List<Object> ob = listob.get(i);
            Jur jur = new Jur();
           //通过遍历实现每一列封装成一个model中，在把所有的model用List集合装载\
            jur.setJurl(String.valueOf(ob.get(1)));
            jur.setContent(String.valueOf(ob.get(2)));
            jurList.add(jur);
        }
        //批量插入
        jurDAO.insertInfoBatch(jurList);
    }

    @Override
    public List<String> listJurs(String phone) {
        return jurDAO.listJurs(phone);
    }

    @Override
    public List<Long> listJur(Long rid) {
        return jurDAO.listJur(rid);
    }

}

