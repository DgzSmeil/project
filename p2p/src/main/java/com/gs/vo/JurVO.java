package com.gs.vo;

import java.util.List;

/**
 * Created by Administrator on 2017/12/28.
 */
public class JurVO {
    private Long rid;
    private Long jid;

    private List<JurVO> jurVOList;

    public JurVO() {

    }
    public JurVO(Long rid,Long jid) {
        this.rid = rid;
        this.jid = jid;
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

    public List<JurVO> getJurVOList() {
        return jurVOList;
    }

    public void setJurVOList(List<JurVO> jurVOList) {
        this.jurVOList = jurVOList;
    }
}
