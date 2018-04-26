package com.gs.vo;

/**
 * Created by ：余鹏
 * time：2018/1/10.
 */
public class SwayVo {
    private Long sid;

    private String way;//方式

    private String fw;//算法

    private Byte state;//还款方式状态（0不可用，1可用）

    private String stateToStr;

    public String getStateToStr() {
        if (state == 0) {
            stateToStr = "可用";
        } else if (state == 1) {
            stateToStr = "不可用";
        }
        return stateToStr;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public String getFw() {
        return fw;
    }

    public void setFw(String fw) {
        this.fw = fw;
    }

    public void setStateToStr(String stateToStr) {
        this.stateToStr = stateToStr;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

}
