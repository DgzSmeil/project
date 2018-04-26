package com.gs.controller;

import com.alibaba.fastjson.JSONObject;
import com.gs.bean.*;
import com.gs.common.BankAPIUtil;
import com.gs.common.Constants;
import com.gs.common.EncryptUtils;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.*;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.SearchVo;
import com.gs.vo.TxInItPage;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.Calendar;

/**
 * Created by Administrator on 2017/12/21.
 */
@Controller
@RequestMapping("/logtx")
public class LogTxController {

    @Autowired
    private LogTxService logTxService;
    @Autowired
    private UserMoneyService userMoneyService;
    @Autowired
    private TxCheckService txCheckService;
    @Autowired
    private UserService userService;

    @Autowired
    private BankCardService bankCardService;


    @RequestMapping("page")
    @ResponseBody
    public ModelAndView showPage(HttpSession session) {
        ModelAndView mav = new ModelAndView("deposit/deposit");
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        Long uid  = user.getUid();
        if(user != null) {
            user = (User) userService.getById(user.getUid());
            if(bankCardService.countBank(user.getUid()) != 0) {
                UserMoney userMoney = (UserMoney) userMoneyService.getByUserId(uid);
                TxInItPage inItPage = new TxInItPage(user.getUid(),user.getRname(),user.getPhone(),userMoney.getKymoney());
                return  mav.addObject("inItPage",inItPage);
            }else{
                ModelAndView mavs = new ModelAndView("deposit/bindingbank");
                return  mavs.addObject("msg",1);
            }

        }
        return null;
    }
    @RequestMapping("add")
    @ResponseBody
    public ControllerStatusVO addLogTx(HttpSession session, LogTx logTx) {
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(user != null) {
            user = (User) userService.getById(user.getUid());
            try{
                if(user.getZpwd().equals(logTx.getPassword())) {
                    String param = "realName="+user.getRname()+"&bank="+logTx.getBanktype()+"&bankCardNo="+logTx.getBankcard()+"&phone="+user.getPhone()+"&money="+logTx.getMoney();
                    JSONObject jsonObject = BankAPIUtil.SendjsonObject("http://localhost:8888/bank/mention",param);
                    if(jsonObject.getString("code").equals("4000")) {
                        logTx.setUid(user.getUid());
                        logTx.setDate(Calendar.getInstance().getTime());
                        logTx.setState(Byte.valueOf("1"));
                        logTxService.save(logTx);
                        userMoneyService.updateByIdMaoll(user.getUid(),logTx.getMoney());
                        statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_DEPOSIT_SUCCESS);
                    }
                }else{
                    statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_PASS_FAIL);
                }
            }catch (Exception e){
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_DEPOSIT_FAIL);
            }
        }

        return statusVO;
    }

    @RequestMapping("select")
    @ResponseBody
    public Pager SelectLogTxPage(HttpSession session, SearchVo param,Integer page, Integer rows) {
        Pager pager = new Pager();
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);

            try {
                if(page != null && rows != null) {
                    pager = logTxService.listPagerCriteria(page,rows,param);
                    return pager;
                }else {
                    if(user != null) {
                        param.setUid(user.getUid());
                        pager = logTxService.listPagerCriteria(param.getCurPage(), 8, param);
                        return pager;
                    }
                }
            }catch (Exception e){e.printStackTrace();}


        return pager;
    }

    @RequestMapping("cancl")
    @ResponseBody
    public ControllerStatusVO CanclLogTx(HttpSession session , Long id, BigDecimal money ) {
        ControllerStatusVO statusVO = new ControllerStatusVO();
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            try{
                logTxService.updateById(Byte.valueOf("3"),id);
                userMoneyService.updateById(user.getUid(),money);
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_CANCL_SUCCESS);
            }catch(Exception e) {
                e.printStackTrace();
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_CANCL_FAIL);
            }
        }

        return statusVO;
    }

    //shiro权限注解
    @RequiresPermissions("logtx:backtxsh")
    @RequestMapping("backtxsh")
    public String ShowBackTxshPage() {
        return "/backpage/txList";
    }

    @RequestMapping("aduits")
    @ResponseBody
    public ControllerStatusVO auditTxSuccess(TxCheck txCheck) {
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(txCheck != null) {
            logTxService.updateById(txCheck.getState(),txCheck.getTxid());
            txCheck.setDate(Calendar.getInstance().getTime());
            if(txCheck.getState().equals(Byte.valueOf("2"))) {
                txCheck.setIsok(Byte.valueOf("2"));
            }else if(txCheck.getState().equals(5)) {
                txCheck.setIsok(Byte.valueOf("5"));
            }
            txCheckService.save(txCheck);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_ADUIT_SUCCESS);
        }else {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_ADUIT_FAIL);
        }
        return statusVO;
    }

}
