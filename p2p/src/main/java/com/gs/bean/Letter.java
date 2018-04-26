package com.gs.bean;

import java.util.Date;

//站内信表
public class Letter {
    private Long lid;

    private Long uid;

    private String Phone;

    private Long hid;

    private String title;//标题

    private String content;//内容

    private String date;//日期

    private Byte state;//状态，0激活，1冻结

    private String startTime;
    private String endTime;

    public Letter(Long lid, Long uid, String phone, Long hid, String title, String content, String date, Byte state) {
        this.lid = lid;
        this.uid = uid;
        Phone = phone;
        this.hid = hid;
        this.title = title;
        this.content = content;
        this.date = date;
        this.state = state;
    }

    public Letter() {
        super();
    }

    public Long getLid() {
        return lid;
    }

    public void setLid(Long lid) {
        this.lid = lid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public Long getHid() {
        return hid;
    }

    public void setHid(Long hid) {
        this.hid = hid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}