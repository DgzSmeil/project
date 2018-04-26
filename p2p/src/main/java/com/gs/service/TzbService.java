package com.gs.service;

import com.gs.vo.ControllerStatusVO;

import java.util.List;

/**
 * TzbService接口，实现CRUD
 * 创建时间：2017/12/21 16:14
 *
 * @author 温宁宁
 * @version 1.0
 */
public interface TzbService extends BaseService {
    Object getTzb(Long uid,Long baid);
    ControllerStatusVO add(Object obj,Object obj2);
    List<Object> list(Object object);
}
