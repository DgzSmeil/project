package com.gs.bean;

//权限表
public class Jur {
    private Long jid;

    private String jurl;//权限URL

    private String content;//权限描述

    public Jur(Long jid, String jurl, String content) {
        this.jid = jid;
        this.jurl = jurl;
        this.content = content;
    }

    public Jur() {
        super();
    }

    public Long getJid() {
        return jid;
    }

    public void setJid(Long jid) {
        this.jid = jid;
    }

    public String getJurl() {
        return jurl;
    }

    public void setJurl(String jurl) {
        this.jurl = jurl == null ? null : jurl.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}