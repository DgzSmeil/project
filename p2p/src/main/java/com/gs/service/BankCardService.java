package com.gs.service;

import com.gs.bean.BankCard;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
public interface BankCardService extends BaseService {
    List<BankCard> getBylistAll(Long id);
    Long countCriteria(Object obj);
    Long countBank(Long id);

}
