package com.gs.controller;

import com.gs.bean.Option;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.OptionService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.util.Calendar;

/**
 * Created by Administrator on 2018/1/2.
 */

@Controller
@RequestMapping("/option")

public class OptionController {

    @Autowired
    private OptionService optionService;

    //shiro权限注解
    @RequiresPermissions("option:page")
    @RequestMapping("page")
    public String page(){
        return "option/option";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, Option option){
        return optionService.listPagerCriteria(page,rows,option);
    }

    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Option option){
        ControllerStatusVO statusVO = null;
        try{
            option.setDate(new Timestamp(Calendar.getInstance().getTime().getTime()));
            optionService.save(option);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.OPTION_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.OPTION_SAVE_SUCCESS);
        return statusVO;
    }


    @RequestMapping("remove")
    @ResponseBody
    public ControllerStatusVO delete(@RequestParam(value="ids") String ids) throws Exception{
        ControllerStatusVO statusVO = null;
        String[] idStr = ids.split(",");
        for (String id : idStr) {
            optionService.removeById(Long.parseLong(id));
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.OPTION_DELETE_SUCCESS);
        return statusVO;
    }
}
