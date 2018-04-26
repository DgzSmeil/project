package com.gs.controller;

import com.gs.common.Pager;
import com.gs.query.JkbQuery;
import com.gs.service.UserMoneyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 创建类名：UserMoneyController
 * 创建时间：2018/1/16 8:46
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/userMoney")
public class UserMoneyController {
    @Autowired
    private UserMoneyService userMoneyService;

    //后台用户资金管理页面
    //shiro权限注解
    @RequiresPermissions("userMoney:page")
    @RequestMapping("/page")
    public String myTzb(){
        return "userMoney/userMoney";
    }
    //后台用户资金管理
    @RequestMapping("/list")
    @ResponseBody
    public Pager List(int page, int rows) {
        return userMoneyService.listPager(page,rows);
    }
}
