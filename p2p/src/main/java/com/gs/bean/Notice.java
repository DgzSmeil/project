package com.gs.bean;

import java.util.Date;

//最新公告表
public class Notice {
    private Long nid;

    private String content;//内容

    private String title;//标题

    private String date;//公告时间

    private String startTime;
    private String endTime;

    public Notice(Long nid, String content, String title, String date) {
        this.nid = nid;
        this.content = content;
        this.title = title;
        this.date = date;
    }

    public Notice() {
        super();
    }

    public Long getNid() {
        return nid;
    }

    public void setNid(Long nid) {
        this.nid = nid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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