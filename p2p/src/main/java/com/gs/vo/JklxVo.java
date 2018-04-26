package com.gs.vo;

/**
 * Created by ：余鹏
 * time：2018/1/10.
 */
public class JklxVo {
    private Long lxid;

    private String lxname;//借款名称，如（先本后息，先息后本，等额本息，等额本金）

    private Byte state;//状态（0可用，1不可用）

    private String stateToStr;

    public String getStateToStr() {
        if (state == 0) {
            stateToStr = "可用";
        } else if (state == 1) {
            stateToStr = "不可用";
        }
        return stateToStr;
    }

    public Long getLxid() {
        return lxid;
    }

    public void setLxid(Long lxid) {
        this.lxid = lxid;
    }

    public String getLxname() {
        return lxname;
    }

    public void setLxname(String lxname) {
        this.lxname = lxname;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

}
