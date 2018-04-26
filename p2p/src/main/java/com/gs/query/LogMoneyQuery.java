package com.gs.query;

import java.util.Date;

/**
 * 创建类名：LogMoneyQuery
 * 创建时间：2017/12/25 16:13
 *
 * @author 温宁宁
 * @version 1.0
 */
public class LogMoneyQuery {
    private Long uid;
    private Byte type;
    private String startTime;
    private String endTime;
    private int curPage;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
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

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }
}
