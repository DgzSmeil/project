package com.gs.query;

public class UserQuery {
    private Long uid;

    private String uname;//用户名

    private String phone;//手机号码

    private String rname;//真实姓名

    private Byte isvip;//是否为VIP用户，,1否，2是

    private Byte ispass;//是否审核通过

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

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Byte getIsvip() {
        return isvip;
    }

    public void setIsvip(Byte isvip) {
        this.isvip = isvip;
    }

    public Byte getIspass() {
        return ispass;
    }

    public void setIspass(Byte ispass) {
        this.ispass = ispass;
    }
}