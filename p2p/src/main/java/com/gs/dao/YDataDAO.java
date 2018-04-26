package com.gs.dao;

import com.gs.vo.YDataVO;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2018/1/18.
 */

@Repository

public interface YDataDAO extends BaseDAO {

    YDataVO getByMaxDate();             //查询日期最大的记录
    List<YDataVO> selectIdAndDate();   //查询Id和日期

    BigDecimal countTzbMoney();    //总投资金额
    BigDecimal countMtzbMoney();    //月投资金额

    Integer getTUserCount();  //总用户数
    Integer getMUserCount();  //月用户数

    Integer getTtzCount();    //总投资人数
    Integer getMtzCount();    //月投资人数

    Integer getTdkCount();    //总贷款人数
    Integer getMdkCount();    //月贷款人数

    Integer getTdkbCount();   //总贷款笔数
    Integer getMdkbCount();   //月贷款笔数


}
