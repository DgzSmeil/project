package com.gs.service;

import com.gs.common.Pager;
import com.gs.vo.ControllerStatusVO;

import java.util.List;

/**
 * TzbService接口，实现CRUD
 * 创建时间：2017/12/21 16:14
 *
 * @author 温宁宁
 * @version 1.0
 */
public interface HkbService extends BaseService {
    void saveList(List hkbList);
    Pager list(int pageNo, int pageSize, Object obj);
    List<Object> listByBaid(Object object);
    ControllerStatusVO update_hkb(Object object);
}
