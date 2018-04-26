package com.gs.service;

import com.gs.vo.JurVO;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
public interface RoleJurService extends BaseService {
    //批量插入角色权限
    public void saveBatch(List<JurVO> jurVOList);
}
