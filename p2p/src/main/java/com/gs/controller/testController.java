package com.gs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 创建类名：testController
 * 创建时间：2017/12/19 16:39
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/test")
public class testController {

    @RequestMapping("tests")
    public String test(){
        return "backpage/index";
    }

    @RequestMapping("testca")
    public String testca(){
        return "backpage/txList";
    }

}
