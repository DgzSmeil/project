package com.gs.service;

import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

/**
 * UserMoneyService接口，实现CRUD
 * 创建时间：2017/12/21 11:19
 *
 * @author 温宁宁
 * @version 1.0
 */
public interface UserMoneyService extends BaseService {
    Object getByUserId(Long id);
    void updateById(Long id,BigDecimal money);
    void updateByIdMaoll(Long id, BigDecimal money);
}
