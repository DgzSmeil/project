package com.gs.service;

import com.gs.common.Pager;

import java.util.List;

/**
 * Created by ：余鹏
 * time：2017/12/25.
 */
public interface DxModelService extends BaseService{

    int countByPager();

    Integer isRegPhone(String phone);
}
