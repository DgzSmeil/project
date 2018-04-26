package com.gs.controller;

import com.gs.bean.DxModel;
import com.gs.common.Pager;
import com.gs.common.SendCode;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.DxModelService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 创建类名：IndexController
 * 创建时间：2017/12/19 9:11
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/dxModel")
public class DxModelController {

    @Autowired
    private DxModelService dxModelService;

    @RequestMapping("pager")
    @ResponseBody
    public Pager Pager(int page, int rows) {
        return dxModelService.listPager(page, rows);
    }

    @RequestMapping("SendDxModel")
    public String SendDxModel() {
        return "reAndLo";
    }

    //shiro权限注解
    @RequiresPermissions("dxModel:dxModel")
    @RequestMapping("dxModel")
    public String DxModel() {
        return "dxModelType/dxModel";
    }

    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(DxModel dxModel){
        ControllerStatusVO statusVO = null;
        try {
            dxModelService.update(dxModel);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.DxModel_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.DxModel_UPDATE_SUCCESS);
        return statusVO;
    }
    //shiro权限注解
    @RequiresPermissions("dxModel:delete")
    @RequestMapping("delete")
    @ResponseBody
    public ControllerStatusVO delete(Long id){
        ControllerStatusVO statusVO = null;
        try {
            dxModelService.removeById(id);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.DxModel_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.DxModel_DELETE_SUCCESS);
        return statusVO;
    }

    @RequestMapping(value = "/checkPhone",method = RequestMethod.POST)
    public String checkPhone(String phone){

        return "";
    }
}
