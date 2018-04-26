package com.gs.service;

import java.util.List;

/**
 * BorrowApplyService接口，实现CRUD
 * 创建时间：2017/12/26 15:12
 *
 * @author 温宁宁
 * @version 1.0
 */
public interface BorrowApplyService extends BaseService {
    void updateState(Object obj);
    void updateState2(Object obj);
    void updateLiubiao();
    List<Object> listByBzid(Long bzid);
    List<Object> listByUid(Long uid);
}
