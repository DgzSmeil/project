package com.gs.controller;

import com.gs.bean.Sway;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.SwayService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by ：余鹏
 * time：2018/1/2.
 */
@Controller
@RequestMapping("/sway")
public class SwayController {

    @Autowired
    SwayService swayService;

    @RequestMapping("pager")
    @ResponseBody
    public Pager Pager(int page, int rows) {
        return swayService.listPager(page, rows);
    }

    //shiro权限注解
    @RequiresPermissions("sway:sway")
    @RequestMapping("sway")
    public String sway() {
        return "swayType/sway";
    }

    //shiro权限注解
    @RequiresPermissions("sway:save")
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Sway sway){
        ControllerStatusVO statusVO = null;
        try {
            swayService.save(sway);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_SAVE_SUCCESS);
        return statusVO;
    }

    //shiro权限注解
    @RequiresPermissions("sway:update")
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Sway sway){
        ControllerStatusVO statusVO = null;
        try {
            swayService.update(sway);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_UPDATE_SUCCESS);
        return statusVO;
    }

    //shiro权限注解
    @RequiresPermissions("sway:delete")
    @RequestMapping("delete")
    @ResponseBody
    public ControllerStatusVO delete(Long id){
        ControllerStatusVO statusVO = null;
        try {
            swayService.removeById(id);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_DELETE_SUCCESS);
        return statusVO;
    }

}
