package com.gs.bean;

//后台用户表
public class HUser {
    private Long huid;

    private String rname;//真实姓名

    private Byte sex;//性别（0男，1女）

    private String phone;//手机号码

    private String pwd;//密码

    private String huname;//用户名称

    private String email;//电子邮箱

    private Long int1;

    private String str1;

    public HUser(Long huid, String rname, Byte sex, String phone, String pwd, String huname, String email, Long int1, String str1) {
        this.huid = huid;
        this.rname = rname;
        this.sex = sex;
        this.phone = phone;
        this.pwd = pwd;
        this.huname = huname;
        this.email = email;
        this.int1 = int1;
        this.str1 = str1;
    }

    public HUser() {
        super();
    }

    public Long getHuid() {
        return huid;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getHuname() {
        return huname;
    }

    public void setHuname(String huname) {
        this.huname = huname == null ? null : huname.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Long getInt1() {
        return int1;
    }

    public void setInt1(Long int1) {
        this.int1 = int1;
    }

    public String getStr1() {
        return str1;
    }

    public void setStr1(String str1) {
        this.str1 = str1 == null ? null : str1.trim();
    }
}