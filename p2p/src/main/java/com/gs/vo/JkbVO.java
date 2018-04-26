package com.gs.vo;

import com.gs.bean.UserMoney;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 创建类名：JkbVO
 * 创建时间：2017/12/28 15:27
 *
 * @author 温宁宁
 * @version 1.0
 */
public class JkbVO {
    private Long baid;

    private String rname;//真实姓名

    private BigDecimal money;//申请金额

    private Long bzid;//标种id

    private String bzname;//标种名称

    private Long lxid;//类型id

    private String lxname;//类型名称

    private Long sid;//还款方式id

    private String way;//还款方式

    private Date time;//审核时间

    private Byte state;//审核状态（1表示为审核，2表示已审核）

    private String excuse;//审核理由

    private Integer term;//借款期限

    private Date deadline;//截止时间

    private Long bdid;

    private String fpic;//法人身份证照片

    private String ypic;//营业执照副本照片

    private String qpic;//企业银行账号

    private String tpic;//其他资料

    private String mpurpose;//资金用途

    private String hksource;//还款来源

    private String suggest;//借款人介绍

    private String xmdescrip;//项目描述

    private String guarantee;//保障措施

    private BigDecimal nprofit;//年化收益

    private String cpname;//产品名称

    private Date sqtime;//申请时间

    private BigDecimal ytmoney;//已投金额

    private Long uid;//借款人id

    private Date mbtime;

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
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

    public Long getLxid() {
        return lxid;
    }

    public void setLxid(Long lxid) {
        this.lxid = lxid;
    }

    public String getLxname() {
        return lxname;
    }

    public void setLxname(String lxname) {
        this.lxname = lxname;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
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

    public Long getBdid() {
        return bdid;
    }

    public void setBdid(Long bdid) {
        this.bdid = bdid;
    }

    public String getFpic() {
        return fpic;
    }

    public void setFpic(String fpic) {
        this.fpic = fpic;
    }

    public String getYpic() {
        return ypic;
    }

    public void setYpic(String ypic) {
        this.ypic = ypic;
    }

    public String getQpic() {
        return qpic;
    }

    public void setQpic(String qpic) {
        this.qpic = qpic;
    }

    public String getTpic() {
        return tpic;
    }

    public void setTpic(String tpic) {
        this.tpic = tpic;
    }

    public String getMpurpose() {
        return mpurpose;
    }

    public void setMpurpose(String mpurpose) {
        this.mpurpose = mpurpose;
    }

    public String getHksource() {
        return hksource;
    }

    public void setHksource(String hksource) {
        this.hksource = hksource;
    }

    public String getSuggest() {
        return suggest;
    }

    public void setSuggest(String suggest) {
        this.suggest = suggest;
    }

    public String getXmdescrip() {
        return xmdescrip;
    }

    public void setXmdescrip(String xmdescrip) {
        this.xmdescrip = xmdescrip;
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee;
    }

    public BigDecimal getNprofit() {
        return nprofit;
    }

    public void setNprofit(BigDecimal nprofit) {
        this.nprofit = nprofit;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public Date getSqtime() {
        return sqtime;
    }

    public void setSqtime(Date sqtime) {
        this.sqtime = sqtime;
    }

    public String getExcuse() {
        return excuse;
    }

    public void setExcuse(String excuse) {
        this.excuse = excuse;
    }

    public BigDecimal getYtmoney() {
        return ytmoney;
    }

    public void setYtmoney(BigDecimal ytmoney) {
        this.ytmoney = ytmoney;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Date getMbtime() {
        return mbtime;
    }

    public void setMbtime(Date mbtime) {
        this.mbtime = mbtime;
    }
}
