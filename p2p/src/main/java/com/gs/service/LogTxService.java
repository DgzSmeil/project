package com.gs.service;

import com.gs.bean.LogTx;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
public interface LogTxService extends BaseService {
    Pager listByPager(int pageNo, int pageSize,Long uid);
    void updateById (Byte state,Long id);

}
