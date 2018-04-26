package com.gs.vo;

import java.math.BigDecimal;

/**
 * Created by Administrator on 2017/12/25.
 */
public class TxInItPage {
    private Long uid;

    private String uname;//用户名

    private String phone;//手机号码

    private BigDecimal kymoney;//可用余额

    public TxInItPage() {
    }

    public TxInItPage(Long uid, String uname, String phone, BigDecimal kymoney) {
        this.uid = uid;
        this.uname = uname;
        this.phone = phone;
        this.kymoney = kymoney;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public BigDecimal getKymoney() {
        return kymoney;
    }

    public void setKymoney(BigDecimal kymoney) {
        this.kymoney = kymoney;
    }
}
