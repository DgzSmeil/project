package com.gs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 创建类名：HtmlController
 * 创建时间：2018/1/6 9:53
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/html")
public class HtmlController {
    //进入信息披露
    @RequestMapping("/safety")
    public String safety() {
        return "/safety";
    }
    //进入帮助中心
    @RequestMapping("/help")
    public String help() {
        return "/help";
    }
    //信息披露
    @RequestMapping("/about")
    public String about() {
        return "/about";
    }
    //产品介绍
    @RequestMapping("/product")
    public String product() {
        return "/html/product";
    }
    //常见问题
    @RequestMapping("/common")
    public String common() {
        return "/html/common";
    }
    //合同资料
    @RequestMapping("/contract")
    public String contract() {
        return "/html/contract";
    }
    //名词解释
    @RequestMapping("/nonu")
    public String nonu() {
        return "/html/nonu";
    }
    //从业机构信息
    @RequestMapping("/xxpl")
    public String xxpl() {
        return "/html/xxpl";
    }
    //平台运营信息
    @RequestMapping("/ptyy")
    public String ptyy() {
        return "/html/ptyy";
    }
    //借款项目信息
    @RequestMapping("/jkxm")
    public String jkxm() {
        return "/html/jkxm";
    }
    //股东背景
    @RequestMapping("/gdbj")
    public String gdbj() {
        return "/html/gdbj";
    }
    //公司简介
    @RequestMapping("/gsjj")
    public String gsjj() {
        return "/html/gsjj";
    }
    //平台资质
    @RequestMapping("/ptzz")
    public String ptzz() {
        return "/html/ptzz";
    }
    //顾问团队
    @RequestMapping("/gwtd")
    public String gwtd() {
        return "/html/gwtd";
    }
    //公司动态
    @RequestMapping("/gsdt")
    public String gsdt() {
        return "/html/gsdt";
    }
    //平台公告
    @RequestMapping("/ptgg")
    public String ptgg() {
        return "/html/ptgg";
    }
    //招贤纳士
    @RequestMapping("/zxns")
    public String zxns() {
        return "/html/zxns";
    }
    //联系我们
    @RequestMapping("/lxwm")
    public String lxwm() {
        return "/html/lxwm";
    }
}
