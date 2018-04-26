package com.gs.controller;

import com.gs.bean.Jur;
import com.gs.bean.Role;
import com.gs.common.Combobox;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.RoleJurService;
import com.gs.service.RoleService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.JurVO;
import com.gs.vo.RoleJurVO;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/27.
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @Autowired
    private RoleJurService roleJurService;


    @RequiresPermissions("role:save")
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO insertBatch(RoleJurVO roleJurVO){

        ControllerStatusVO statusVO = null;
        try{
            roleService.save(roleJurVO);
            List<JurVO> jurVOList = new ArrayList<>();
            for(int i=0;i<roleJurVO.getJids().size();i++){
                jurVOList.add(new JurVO(roleJurVO.getRid(),roleJurVO.getJids().get(i)));
            }
            roleJurService.saveBatch(jurVOList);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.ROLE_SAVE_SUCCESS);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.ROLE_SAVE_FAIL);
        }
        return statusVO;
    }

    @RequiresPermissions("role:page")
    @RequestMapping("page")
    public String Page(){
        return "role/role";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page,int rows,Role role){
        return roleService.listPagerCriteria(page,rows,role);
    }

    @RequiresPermissions("role:update")
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(RoleJurVO roleJurVO){
        ControllerStatusVO statusVO = null;
        try{
            roleService.update(roleJurVO);
            roleJurService.removeById(roleJurVO.getRid());
            List<JurVO> jurVOList = new ArrayList<>();
            for(int i=0;i<roleJurVO.getJids().size();i++){
                jurVOList.add(new JurVO(roleJurVO.getRid(),roleJurVO.getJids().get(i)));
            }
            roleJurService.saveBatch(jurVOList);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.ROLE_UPDATE_SUCCESS);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.ROLE_UPDATE_FAIL);
        }
        return statusVO;
    }

    @RequestMapping("all")
    @ResponseBody
    public List<Combobox> listAll(){
        List<Object> objectList = roleService.listAll();
        List<Combobox> comboboxList = new ArrayList<>();
        for(Object obj:objectList){
            Role role = (Role) obj;
            comboboxList.add(new Combobox(role.getRid()+"",role.getRname(),false));
        }
        return comboboxList;
    }
}
