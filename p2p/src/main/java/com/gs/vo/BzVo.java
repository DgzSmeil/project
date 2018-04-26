package com.gs.vo;

/**
 * Created by ：余鹏
 * time：2018/1/10.
 */
public class BzVo {
    private Long bzid;

    private String bzname;//标种名称

    private Byte state;

    private String stateToStr;

    public String getStateToStr() {
        if (state == 0) {
            stateToStr = "可用";
        } else if (state == 1) {
            stateToStr = "不可用";
        }
        return stateToStr;
    }

    public Long getBzid() {
        return bzid;
    }

    public void setBzid(Long bzid) {
        this.bzid = bzid;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname == null ? null : bzname.trim();
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

}
