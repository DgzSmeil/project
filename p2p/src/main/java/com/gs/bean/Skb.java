package com.gs.bean;

import java.math.BigDecimal;
import java.util.Date;

//还款表
public class Skb {
    private Long skid;

    private Long uid;//用户id

    private Long juid;//借款人id

    private BigDecimal ybx;//应收本息

    private BigDecimal rbx;//已收本息

    private BigDecimal ylx;//应收利息

    private BigDecimal rlx;//已收利息

    private BigDecimal ybj;//应收本金

    private BigDecimal rbj;//已收本金

    private Integer rnum;//已还期数

    private Integer tnum;//总期数

    private Date hkdate;//日期

    private Long baid;//借款人id

    private BigDecimal tzmoney;//投资金额

    private Byte state;//收款状态(1，可收款2，未还款，3已收款)

    private Integer djq;//第几期


    public Skb() {
        super();
    }

    public Long getSkid() {
        return skid;
    }

    public void setSkid(Long skid) {
        this.skid = skid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getJuid() {
        return juid;
    }

    public void setJuid(Long juid) {
        this.juid = juid;
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

    public Integer getRnum() {
        return rnum;
    }

    public void setRnum(Integer rnum) {
        this.rnum = rnum;
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

    public Integer getDjq() {
        return djq;
    }

    public void setDjq(Integer djq) {
        this.djq = djq;
    }
}