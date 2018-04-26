package com.gs.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Administrator on 2018/1/2.
 */
public class investBorrowVo {
    private Long baid;
    private String bzname;//标种名称
    private String cpname;//产品名称
    private String way;//方式
    private Date time;//审核时间
    private Date deadline;//截止时间
    private BigDecimal money;//申请金额
    private BigDecimal nprofit;//年化收益
    private Byte state;//审核状态（1表示为审核，2表示已审核）
    private BigDecimal ytmoney;//已投金额
    private Integer term;//借款期限

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getNprofit() {
        return nprofit;
    }

    public void setNprofit(BigDecimal nprofit) {
        this.nprofit = nprofit;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public BigDecimal getYtmoney() {
        return ytmoney;
    }

    public void setYtmoney(BigDecimal ytmoney) {
        this.ytmoney = ytmoney;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }


}