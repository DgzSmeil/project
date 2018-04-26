package com.gs.controller;

import com.gs.bean.Role;
import com.gs.bean.RoleUser;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.RoleUserQuery;
import com.gs.service.RoleUserService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.RoleUserVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/29.
 */
@Controller
@RequestMapping("/roleUser")
public class RoleUserController {
    @Autowired
    private RoleUserService roleUserService;


    @RequiresPermissions("roleUser:page")
    @RequestMapping("page")
    public String Page(){
        return "roleuser/roleuser";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, RoleUserQuery roleUserQuery) {
        return roleUserService.listPagerCriteria(page, rows, roleUserQuery);
    }

    @RequiresPermissions("roleUser:update")
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(RoleUser roleUser){
        ControllerStatusVO statusVO = null;
        try{
            roleUserService.update(roleUser);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.ROLE_USER_UPDATE_SUCCESS);
        }catch(RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.ROLE_USER_UPDATE_FAIL);
        }
        return statusVO;
    }

}
