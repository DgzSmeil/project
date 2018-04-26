package com.gs.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 创建类名：HkbVO
 * 创建时间：2018/1/10 8:35
 *
 * @author 温宁宁
 * @version 1.0
 */
public class HkbVO {
    private Long hkid;
    private Long baid;
    private String cpname;
    private String bzname;
    private Date ytime;//应还时间
    private Date rtime;//实际还款时间
    private BigDecimal ybx;//应还本息
    private BigDecimal rbx;//已还本息
    private BigDecimal ylx;//应还利息
    private BigDecimal yfx;//应还罚息
    private Integer yucount;//逾期次数
    private Long huid;//贷后负责人id
    private String hname;//贷后负责人姓名
    private Integer djq;//第几期
    private Byte state;//还款状态（1还款中，2已还款，3已逾期）
    private String rname;//借款人姓名

    private BigDecimal ytmoney;//已投资金额
    private BigDecimal nprofit;//年化收益

    public Long getHkid() {
        return hkid;
    }

    public void setHkid(Long hkid) {
        this.hkid = hkid;
    }

    public BigDecimal getRbx() {
        return rbx;
    }

    public void setRbx(BigDecimal rbx) {
        this.rbx = rbx;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname;
    }

    public Date getYtime() {
        return ytime;
    }

    public void setYtime(Date ytime) {
        this.ytime = ytime;
    }

    public Date getRtime() {
        return rtime;
    }

    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }

    public BigDecimal getYbx() {
        return ybx;
    }

    public void setYbx(BigDecimal ybx) {
        this.ybx = ybx;
    }

    public BigDecimal getYlx() {
        return ylx;
    }

    public void setYlx(BigDecimal ylx) {
        this.ylx = ylx;
    }

    public BigDecimal getYfx() {
        return yfx;
    }

    public void setYfx(BigDecimal yfx) {
        this.yfx = yfx;
    }

    public Integer getYucount() {
        return yucount;
    }

    public void setYucount(Integer yucount) {
        this.yucount = yucount;
    }

    public Long getHuid() {
        return huid;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }

    public Integer getDjq() {
        return djq;
    }

    public void setDjq(Integer djq) {
        this.djq = djq;
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

    public BigDecimal getNprofit() {
        return nprofit;
    }

    public void setNprofit(BigDecimal nprofit) {
        this.nprofit = nprofit;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }
}
