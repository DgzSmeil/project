package com.gs.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 创建类名：BorrowDetailVO
 * 创建时间：2018/1/8 19:01
 *
 * @author 温宁宁
 * @version 1.0
 */
public class BorrowDetailVO {
    private Long baid;
    private BigDecimal money;//借款金额
    private BigDecimal ytmoney;//已投金额
    private Byte state;//状态
    private Integer term;//期数
    private BigDecimal nprofit;//年化收益
    private Long sid;//还款方式id
    private String way;//还款方式
    private Long huid;//审核人id
    private Long bzid;//标种id
    private String bzname;//标种名称
    private String cpname;//产品名称
    private String rname;//真实姓名
    private Date mbtime;//满标时间
    private Long uid;//借款人id

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getYtmoney() {
        return ytmoney;
    }

    public void setYtmoney(BigDecimal ytmoney) {
        this.ytmoney = ytmoney;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public BigDecimal getNprofit() {
        return nprofit;
    }

    public void setNprofit(BigDecimal nprofit) {
        this.nprofit = nprofit;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public Long getHuid() {
        return huid;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }

    public Long getBzid() {
        return bzid;
    }

    public void setBzid(Long bzid) {
        this.bzid = bzid;
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

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Date getMbtime() {
        return mbtime;
    }

    public void setMbtime(Date mbtime) {
        this.mbtime = mbtime;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }
}
