package com.gs.controller;

import com.alibaba.fastjson.JSONObject;
import com.gs.bean.LogCzz;
import com.gs.bean.User;
import com.gs.common.BankAPIUtil;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.BankCardService;
import com.gs.service.LogCzzService;
import com.gs.service.UserMoneyService;
import com.gs.service.UserService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.LogCzzVo;
import com.gs.vo.SearchVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Calendar;

/**
 * Created by Administrator on 2017/12/25.
 */
@Controller
@RequestMapping("/logczz")
public class LogCzzController {
    @Autowired
    private LogCzzService logCzzService;
    @Autowired
    private UserMoneyService userMoneyService;
    @Autowired
    private BankCardService bankCardService;
    @Autowired
    private UserService userService;



    @RequestMapping("page")
    public ModelAndView showPage(HttpSession session) {
        ModelAndView mav = new ModelAndView("deposit/recharge");
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            if(bankCardService.countBank(user.getUid()) == 0) {
                ModelAndView mavs = new ModelAndView("deposit/bindingbank");
                return  mavs.addObject("msg",1);
            }
        }
        return mav;
    }

    @RequestMapping("add")
    @ResponseBody
    public JSONObject addLogCzz(HttpSession session , LogCzz logCzz) {
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(user != null) {
            user = (User) userService.getById(user.getUid());
            String param = "realName="+user.getRname()+"&bank="+logCzz.getBanktype()+"&bankCardNo="+logCzz.getBankcard()+"&phone="+user.getPhone()+"&money="+logCzz.getMoney();
            JSONObject jsonObject = BankAPIUtil.SendjsonObject("http://localhost:8888/bank/recharge",param);
               if(jsonObject.getString("code").equals("3000")) {
                   logCzz.setUid(user.getUid());
                   logCzz.setDate(Calendar.getInstance().getTime());
                   logCzz.setState(Byte.valueOf("1"));
                   logCzzService.save(logCzz);
                   userMoneyService.updateById(user.getUid(),logCzz.getMoney());
                   return jsonObject;
               }
               return jsonObject;

          }
        return null;
    }

    @RequestMapping("select")
    @ResponseBody
    public Pager selectLogCzzPage(HttpSession session, SearchVo param, Integer page, Integer rows) {
        Pager pager = new Pager();
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);

            try {
                if(page != null && rows != null) {
                    pager = logCzzService.listPagerCriteria(page,rows,param);
                    return pager;
                }else {
                    if(user != null) {
                        param.setUid(user.getUid());
                        pager = logCzzService.listPagerCriteria(param.getCurPage(), 8, param);
                        return pager;
                    }
                }
            }catch (Exception e){e.printStackTrace();}

        return pager;
    }

    //shiro权限注解
    @RequiresPermissions("logczz:backcz")
    @RequestMapping("backcz")
    public String ShowBackTxshPage() {
        return "/backpage/czList";
    }

}
