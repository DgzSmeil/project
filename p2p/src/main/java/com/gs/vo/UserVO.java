package com.gs.vo;

//前台用户表
public class UserVO {
    private Long uid;

    private String uname;//用户名

    private String upwd;

    private String phone;//手机号码

    private String tzm;//推荐码

    private String idtyep;

    private String idno;//证件号

    private String zpwd;

    private String email;//电子邮箱

    private String rname;//真实姓名

    private String face;//头像

    private String tid;

    private Byte sex;//性别1男，2女

    private Byte isvip;//是否为VIP用户，,1否，2是

    private Long rid;

    private String xl;//学历

    private Byte ism;//婚否（1未婚, 2已婚，）

    private String bschool;//毕业学校

    private String addr;//居住地址

    private String work;//先工作

    private Integer age;//年龄

    private byte ispass;//是否审核通过，1不通过，2通过

    private Long int1;

    private String str1;

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

    public String getTzm() {
        return tzm;
    }

    public void setTzm(String tzm) {
        this.tzm = tzm;
    }

    public String getIdno() {
        return idno;
    }

    public void setIdno(String idno) {
        this.idno = idno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face;
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

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public String getXl() {
        return xl;
    }

    public void setXl(String xl) {
        this.xl = xl;
    }

    public Byte getIsm() {
        return ism;
    }

    public void setIsm(Byte ism) {
        this.ism = ism;
    }

    public String getBschool() {
        return bschool;
    }

    public void setBschool(String bschool) {
        this.bschool = bschool;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public byte getIspass() {
        return ispass;
    }

    public void setIspass(byte ispass) {
        this.ispass = ispass;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getIdtyep() {
        return idtyep;
    }

    public void setIdtyep(String idtyep) {
        this.idtyep = idtyep;
    }

    public String getZpwd() {
        return zpwd;
    }

    public void setZpwd(String zpwd) {
        this.zpwd = zpwd;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
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
        this.str1 = str1;
    }
}