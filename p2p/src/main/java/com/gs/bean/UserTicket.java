package com.gs.bean;

import java.util.Date;

//领劵表
public class UserTicket {
    private Long ukid;

    private Long uid;//用户id

    private Long kid;//劵id

    private Date tktime;//领劵时间

    private Integer status; //状态

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public UserTicket(Long ukid, Long uid, Long kid, Date tktime, Integer status) {
        this.ukid = ukid;
        this.uid = uid;
        this.kid = kid;
        this.tktime = tktime;
        this.status = status;
    }

    public UserTicket() {
        super();
    }

    public Long getUkid() {
        return ukid;
    }

    public void setUkid(Long ukid) {
        this.ukid = ukid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getKid() {
        return kid;
    }

    public void setKid(Long kid) {
        this.kid = kid;
    }

    public Date getTktime() {
        return tktime;
    }

    public void setTktime(Date tktime) {
        this.tktime = tktime;
    }
}