package com.gs.bean;

import java.math.BigDecimal;
import java.util.Date;

//优惠券表
public class Ticket {
    private Integer kid;

    private Integer type;//优惠券类型，如现金劵，代金券，体验金

    private BigDecimal tkmoney;//优惠券金额

    private Date tktime;//有效时间

    public Ticket(Integer kid, Integer type, BigDecimal tkmoney, Date tktime) {
        this.kid = kid;
        this.type = type;
        this.tkmoney = tkmoney;
        this.tktime = tktime;
    }

    public Ticket() {
        super();
    }

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getTkmoney() {
        return tkmoney;
    }

    public void setTkmoney(BigDecimal tkmoney) {
        this.tkmoney = tkmoney;
    }

    public Date getTktime() {
        return tktime;
    }

    public void setTktime(Date tktime) {
        this.tktime = tktime;
    }
}