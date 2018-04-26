package com.gs.bean;

//合作伙伴表
public class Friend {
    private Long fid;

    private String rname;

    private String date;

    private String furl;//链接

    private String fpic;//图片

    private String startTime;
    private String endTime;

    public Friend() {
        super();
    }

    public Friend(Long fid, String rname, String date, String furl, String fpic) {
        this.fid = fid;
        this.rname = rname;
        this.date = date;
        this.furl = furl;
        this.fpic = fpic;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    public String getFurl() {
        return furl;
    }

    public void setFurl(String furl) {
        this.furl = furl == null ? null : furl.trim();
    }

    public String getFpic() {
        return fpic;
    }

    public void setFpic(String fpic) {
        this.fpic = fpic == null ? null : fpic.trim();
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