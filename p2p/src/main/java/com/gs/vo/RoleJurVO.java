package com.gs.vo;

import com.gs.bean.Jur;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/28.
 */

public class RoleJurVO {
    private Long rid;
    private String rname;
    private String content;

    private List<Long> jids;

    public RoleJurVO() {

    }
    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Long> getJids() {
        return jids;
    }

    public void setJids(List<Long> jids) {
        this.jids = jids;
    }
}
