package com.gs.dao;

import com.gs.vo.JurVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
@Repository
public interface RoleJurDAO extends BaseDAO {
    //批量插入角色权限
    public void saveBatch(List<JurVO> jurVOList);
}
