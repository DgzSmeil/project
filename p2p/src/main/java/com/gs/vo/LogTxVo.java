package com.gs.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Administrator on 2017/12/21.
 */
public class LogTxVo {

   private Long id;
   private String rname;
   private String phone;
   private BigDecimal money;//提现金额
    private BigDecimal proce;
    private String cardno;
   private Date date;
   private Byte state;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getProce() {
        return proce;
    }

    public void setProce(BigDecimal proce) {
        this.proce = proce;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}
