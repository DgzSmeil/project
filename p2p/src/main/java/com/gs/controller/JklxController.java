package com.gs.controller;

import com.gs.bean.Jklx;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.JklxService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by ：余鹏
 * time：2018/1/2.
 */
@Controller
@RequestMapping("/jklx")
public class JklxController {
    @Autowired
    private JklxService jklxService;

    @RequestMapping("pager")
    @ResponseBody
    public Pager Pager(int page, int rows) {
        return jklxService.listPager(page, rows);
    }

    //shiro权限注解
    @RequiresPermissions("jklx:jklx")
    @RequestMapping("jklx")
    public String jklx() {
        return "jklxType/jklx";
    }


    @RequiresPermissions("jklx:save")
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Jklx jklx){
        ControllerStatusVO statusVO = null;
        try {
            jklxService.save(jklx);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_SAVE_SUCCESS);
        return statusVO;
    }


    @RequiresPermissions("jklx:update")
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Jklx jklx){
        ControllerStatusVO statusVO = null;
        try {
            jklxService.update(jklx);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_UPDATE_SUCCESS);
        return statusVO;
    }

    @RequiresPermissions("jklx:delete")
    @RequestMapping("delete")
    @ResponseBody
    public ControllerStatusVO delete(Long id){
        ControllerStatusVO statusVO = null;
        try {
            jklxService.removeById(id);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_DELETE_SUCCESS);
        return statusVO;
    }

}
