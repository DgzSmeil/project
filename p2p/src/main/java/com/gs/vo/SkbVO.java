package com.gs.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 创建类名：SkbVO
 * 创建时间：2018/1/11 14:38
 *
 * @author 温宁宁
 * @version 1.0
 */
public class SkbVO {
    private Long skid;

    private BigDecimal ybx;//应收本息

    private BigDecimal rbx;//已收本息

    private BigDecimal ylx;//应收利息

    private BigDecimal rlx;//已收利息

    private BigDecimal ybj;//应收本金

    private BigDecimal rbj;//已收本金

    private Integer tnum;//总期数

    private Date hkdate;//日期

    private Long baid;//借款id

    private BigDecimal tzmoney;//投资金额

    private Byte state;//收款状态(1，未还款2，可收款，3已收款)

    private String cpname;//标名

    private BigDecimal nprofit;//年利率

    private String way;//借款类型

    public Long getSkid() {
        return skid;
    }

    public void setSkid(Long skid) {
        this.skid = skid;
    }

    public BigDecimal getYbx() {
        return ybx;
    }

    public void setYbx(BigDecimal ybx) {
        this.ybx = ybx;
    }

    public BigDecimal getRbx() {
        return rbx;
    }

    public void setRbx(BigDecimal rbx) {
        this.rbx = rbx;
    }

    public BigDecimal getYlx() {
        return ylx;
    }

    public void setYlx(BigDecimal ylx) {
        this.ylx = ylx;
    }

    public BigDecimal getRlx() {
        return rlx;
    }

    public void setRlx(BigDecimal rlx) {
        this.rlx = rlx;
    }

    public BigDecimal getYbj() {
        return ybj;
    }

    public void setYbj(BigDecimal ybj) {
        this.ybj = ybj;
    }

    public BigDecimal getRbj() {
        return rbj;
    }

    public void setRbj(BigDecimal rbj) {
        this.rbj = rbj;
    }

    public Integer getTnum() {
        return tnum;
    }

    public void setTnum(Integer tnum) {
        this.tnum = tnum;
    }

    public Date getHkdate() {
        return hkdate;
    }

    public void setHkdate(Date hkdate) {
        this.hkdate = hkdate;
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public BigDecimal getTzmoney() {
        return tzmoney;
    }

    public void setTzmoney(BigDecimal tzmoney) {
        this.tzmoney = tzmoney;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public BigDecimal getNprofit() {
        return nprofit;
    }

    public void setNprofit(BigDecimal nprofit) {
        this.nprofit = nprofit;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }
}
