package com.gs.bean;

//角色权限表
public class RoleJur {
    private Long rjid;

    private Long rid;//角色id

    private Long jid;//权限id

    public RoleJur(Long rjid, Long rid, Long jid) {
        this.rjid = rjid;
        this.rid = rid;
        this.jid = jid;
    }

    public RoleJur() {
        super();
    }

    public Long getRjid() {
        return rjid;
    }

    public void setRjid(Long rjid) {
        this.rjid = rjid;
    }

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public Long getJid() {
        return jid;
    }

    public void setJid(Long jid) {
        this.jid = jid;
    }
}