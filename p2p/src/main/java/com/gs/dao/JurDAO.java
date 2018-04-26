package com.gs.dao;

import com.gs.bean.Jur;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
@Repository
public interface JurDAO extends BaseDAO{
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("jur") Object obj);

    @Override
    Long countCriteria(@Param("jur") Object obj);

    //批量插入权限
    public void insertInfoBatch(List<Jur> jurList);
    public void importExcelInfo(@Param("in") InputStream in, @Param("file") MultipartFile file, @Param("huid") Integer huid);

    //根据电话查询所有的权限
    List<String> listJurs(String phone);

    //根据角色id查询所有的权限jid
    List<Long> listJur(Long rid);
}
