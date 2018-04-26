package com.gs.bean;

//角色表
public class Role {
    private Long rid;

    private String rname;//角色名称

    private String content;//角色描述

    public Role(Long rid, String rname, String content) {
        this.rid = rid;
        this.rname = rname;
        this.content = content;
    }

    public Role() {
        super();
    }

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}