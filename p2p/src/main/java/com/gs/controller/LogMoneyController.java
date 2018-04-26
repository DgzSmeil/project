package com.gs.controller;

import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.query.LogMoneyQuery;
import com.gs.service.LogMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 创建类名：LogMoneyController
 * 创建时间：2017/12/25 8:37
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/log_money")
public class LogMoneyController {

    @Autowired
    private LogMoneyService logMoneyService;


    @RequestMapping("/mylog_money")
    public String mylog_money(){

        return "logmoney/log_money";
    }
    @RequestMapping("/search")
    @ResponseBody
    public Pager search(HttpSession session,LogMoneyQuery logMoneyQuery){
        Pager pager = new Pager();
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        logMoneyQuery.setUid(user.getUid());
        pager =  logMoneyService.listPagerCriteria(logMoneyQuery.getCurPage(),8,logMoneyQuery);

        return pager;
    }


}
