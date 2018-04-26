package com.gs.bean;

import java.util.Date;

//提现审核表
public class TxCheck {
    private Long id;

    private Long txid;//提现人id

    private Long huid;//审核人id

    private Byte isok;//审核是否通过，0通过，1未通过

    private String excute;//审核理由

    private Date date;//审核时间

    private Byte state;

    public TxCheck(Long id, Long txid, Long huid, Byte isok, String excute, Date date) {
        this.id = id;
        this.txid = txid;
        this.huid = huid;
        this.isok = isok;
        this.excute = excute;
        this.date = date;
    }

    public TxCheck() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTxid() {
        return txid;
    }

    public void setTxid(Long txid) {
        this.txid = txid;
    }

    public Long getHuid() {
        return huid;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }

    public Byte getIsok() {
        return isok;
    }

    public void setIsok(Byte isok) {
        this.isok = isok;
    }

    public String getExcute() {
        return excute;
    }

    public void setExcute(String excute) {
        this.excute = excute == null ? null : excute.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}