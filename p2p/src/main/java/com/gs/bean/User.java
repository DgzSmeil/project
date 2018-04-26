package com.gs.bean;

//前台用户表
public class User {
    private Long uid;

    private String uname;//用户名

    private String upwd;//密码

    private String phone;//手机号码

    private String tzm;//推荐码

    private String zpwd;//支付密码

    private String idtype;//证件类型

    private String idno;//证件号

    private String email;//电子邮箱

    private String rname;//真实姓名

    private Long tid;//推荐人id

    private String face;//头像

    private Byte sex;//性别1男，2女

    private Byte isvip;//是否为VIP用户，,1否，2是

    private String date;

    private Long int1;

    private String str1;

    public User(Long uid, String uname, String upwd, String phone, String tzm, String zpwd, String idtype, String idno, String email, String rname, Long tid, String face, Byte sex, Byte isvip, Long int1, String str1) {
        this.uid = uid;
        this.uname = uname;
        this.upwd = upwd;
        this.phone = phone;
        this.tzm = tzm;
        this.zpwd = zpwd;
        this.idtype = idtype;
        this.idno = idno;
        this.email = email;
        this.rname = rname;
        this.tid = tid;
        this.face = face;
        this.sex = sex;
        this.isvip = isvip;
        this.int1 = int1;
        this.str1 = str1;
    }

    public User() {
        super();
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
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd == null ? null : upwd.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getTzm() {
        return tzm;
    }

    public void setTzm(String tzm) {
        this.tzm = tzm == null ? null : tzm.trim();
    }

    public String getZpwd() {
        return zpwd;
    }

    public void setZpwd(String zpwd) {
        this.zpwd = zpwd == null ? null : zpwd.trim();
    }

    public String getIdtype() {
        return idtype;
    }

    public void setIdtype(String idtype) {
        this.idtype = idtype == null ? null : idtype.trim();
    }

    public String getIdno() {
        return idno;
    }

    public void setIdno(String idno) {
        this.idno = idno == null ? null : idno.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public Long getTid() {
        return tid;
    }

    public void setTid(Long tid) {
        this.tid = tid;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face == null ? null : face.trim();
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Byte getIsvip() {
        return isvip;
    }

    public void setIsvip(Byte isvip) {
        this.isvip = isvip;
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