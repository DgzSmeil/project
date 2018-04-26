package com.gs.controller;

import com.gs.bean.Bz;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.BzService;
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
@RequestMapping("/bz")
public class BzController {

    @Autowired
    private BzService bzService;


    @RequestMapping("pager")
    @ResponseBody
    public Pager Pager(int page, int rows) {
        return bzService.listPager(page, rows);
    }

    //shiro权限注解
    @RequiresPermissions("bz:bz")
    @RequestMapping("bz")
    public String bz() {
        return "bzType/bz";
    }

    @RequiresPermissions("bz:save")
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Bz bz) {
        ControllerStatusVO statusVO = null;
        try {
            bzService.save(bz);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_SAVE_SUCCESS);
        return statusVO;
    }

    @RequiresPermissions("bz:update")
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Bz bz) {
        ControllerStatusVO statusVO = null;
        try {
            bzService.update(bz);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_UPDATE_SUCCESS);
        return statusVO;
    }

    @RequiresPermissions("bz:delete")
    @RequestMapping("delete")
    @ResponseBody
    public ControllerStatusVO delete(Long id) {
        ControllerStatusVO statusVO = null;
        try {
            bzService.removeById(id);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_DELETE_SUCCESS);
        return statusVO;
    }


}
