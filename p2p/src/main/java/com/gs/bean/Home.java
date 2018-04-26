package com.gs.bean;

//首页信息表
public class Home {
    private Long hid;

    private String pic1;//轮播图1

    private String pic2;//轮播图2

    private String pic3;//轮播图3

    private String ewm;//二维码

    private String phone;//手机号码

    private String l1;//链接1

    private String l2;//链接2

    private String l3;//链接3

    private String l4;//链接4

    public Home(Long hid, String pic1, String pic2, String pic3, String ewm, String phone, String l1, String l2, String l3, String l4) {
        this.hid = hid;
        this.pic1 = pic1;
        this.pic2 = pic2;
        this.pic3 = pic3;
        this.ewm = ewm;
        this.phone = phone;
        this.l1 = l1;
        this.l2 = l2;
        this.l3 = l3;
        this.l4 = l4;
    }

    public Home() {
        super();
    }

    public Long getHid() {
        return hid;
    }

    public void setHid(Long hid) {
        this.hid = hid;
    }

    public String getPic1() {
        return pic1;
    }

    public void setPic1(String pic1) {
        this.pic1 = pic1 == null ? null : pic1.trim();
    }

    public String getPic2() {
        return pic2;
    }

    public void setPic2(String pic2) {
        this.pic2 = pic2 == null ? null : pic2.trim();
    }

    public String getPic3() {
        return pic3;
    }

    public void setPic3(String pic3) {
        this.pic3 = pic3 == null ? null : pic3.trim();
    }

    public String getEwm() {
        return ewm;
    }

    public void setEwm(String ewm) {
        this.ewm = ewm == null ? null : ewm.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getL1() {
        return l1;
    }

    public void setL1(String l1) {
        this.l1 = l1 == null ? null : l1.trim();
    }

    public String getL2() {
        return l2;
    }

    public void setL2(String l2) {
        this.l2 = l2 == null ? null : l2.trim();
    }

    public String getL3() {
        return l3;
    }

    public void setL3(String l3) {
        this.l3 = l3 == null ? null : l3.trim();
    }

    public String getL4() {
        return l4;
    }

    public void setL4(String l4) {
        this.l4 = l4 == null ? null : l4.trim();
    }
}