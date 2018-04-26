package com.gs.bean;

//用户角色表
public class RoleUser {
    private Long ruid;

    private Long rid;//角色id

    private Long huid;//后台用户id

    public RoleUser(Long ruid, Long rid, Long huid) {
        this.ruid = ruid;
        this.rid = rid;
        this.huid = huid;
    }

    public RoleUser() {
        super();
    }

    public Long getRuid() {
        return ruid;
    }

    public void setRuid(Long ruid) {
        this.ruid = ruid;
    }

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public Long getHuid() {
        return huid;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }
}