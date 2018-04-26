package com.gs.bean;

import java.util.Date;
//公司动态表
public class Dynamic {
    private Long dyid;

    private String title;//标题

    private Date date;//时间

    private String content;//内容

    private String pic;//封面图片

    private String starttime;

    public Dynamic(Long dyid, String title, Date date, String content, String pic) {
        this.dyid = dyid;
        this.title = title;
        this.date = date;
        this.content = content;
        this.pic = pic;
    }

    public Dynamic() {
        super();
    }

    public Long getDyid() {
        return dyid;
    }

    public void setDyid(Long dyid) {
        this.dyid = dyid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }
}