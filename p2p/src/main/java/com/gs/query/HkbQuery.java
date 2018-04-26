package com.gs.query;

import java.util.Date;

/**
 * 创建类名：HkbQuery
 * 创建时间：2018/1/9 11:45
 *
 * @author 温宁宁
 * @version 1.0
 */
public class HkbQuery {
    private int curPage;
    private Long baid;
    private Long uid;
    private String startTime;
    private String endTime;
    private Byte state;
    private String borrowFlag;

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public String getBorrowFlag() {
        return borrowFlag;
    }

    public void setBorrowFlag(String borrowFlag) {
        this.borrowFlag = borrowFlag;
    }
}
