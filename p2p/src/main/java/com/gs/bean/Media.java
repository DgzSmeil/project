package com.gs.bean;

import java.util.Date;

//媒体报道表
public class Media {
    private Long mid;

    private String title;//标题

    private String content;//内容

    private String pic;//封面图片

    private Date date;//时间

    private String url;//报道的URL地址

    private String starttime;

    public Media(Long mid, String title, String content, String pic, Date date, String url) {
        this.mid = mid;
        this.title = title;
        this.content = content;
        this.pic = pic;
        this.date = date;
        this.url = url;
    }

    public Media() {
        super();
    }

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
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

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }
}