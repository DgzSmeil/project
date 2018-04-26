package com.gs.service;


import com.gs.vo.ControllerStatusVO;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * TzbService接口，实现CRUD
 * 创建时间：2017/12/21 16:14
 *
 * @author 温宁宁
 * @version 1.0
 */
public interface SkbService extends BaseService {
    List<Object> list(Object object);
    ControllerStatusVO add(Object object);
    ControllerStatusVO update_skb(Object object);
    BigDecimal SumByDate(Long uid, Date sumaDate);
}
