package com.gs.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.gs.bean.BankCard;
import com.gs.bean.User;
import com.gs.common.BankAPIUtil;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.BankCardService;
import com.gs.service.UserService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
@Controller
@RequestMapping("/bank")
public class BankCardController {

    @Autowired
    private BankCardService bankCardService;

    @Autowired
    private UserService userService;


    @RequestMapping("page")
    public String showPage() {
        return "deposit/bank";
    }
    @RequestMapping("bindingpage")
    public String bindingShowPage() {
        return "deposit/bindingbank";
    }

    @RequestMapping("add")
    @ResponseBody
    public JSONObject SaveBankCard(HttpSession session , BankCard bankCard) {
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            String param = "realName="+bankCard.getRname()+"&bank="+bankCard.getType()+"&bankCardNo="+bankCard.getCardno()+"&phone="+user.getPhone();
            JSONObject jsonObject = BankAPIUtil.SendjsonObject("http://localhost:8888/bank/bind",param);
            if(bankCardService.countCriteria(bankCard) == 0 && jsonObject.getString("code").equals("1000")){
               bankCard.setState(Byte.valueOf("0"));
               bankCard.setDate(Calendar.getInstance().getTime());
               bankCardService.save(bankCard);
               return jsonObject;
           }
            return jsonObject;
        }
        return null;
    }

    @RequestMapping("delete")
    public String DeleteBankCard(Long id) {
        if(id != null) {
            bankCardService.removeById(id);
        }
        return "";
    }

    @RequestMapping("select")
    @ResponseBody
    public List<BankCard> SelectBankCard(HttpSession session,Integer page, Integer rows) {
        List<BankCard> bankCards = new ArrayList<>();
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            bankCards = bankCardService.getBylistAll(user.getUid());
        }
        return bankCards;
    }

    @RequestMapping("selectpage")
    @ResponseBody
    public Pager SelectBankCardPage(Integer page, Integer rows,BankCard bankCard) {
        Pager pager = new Pager();
        if(rows != null && page != null) {
            try{
                pager = bankCardService.listPagerCriteria(page,rows,bankCard);

            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return pager;
    }

    //shiroÈ¨ÏÞ×¢½â
    @RequiresPermissions("bank:huserpage")
    @RequestMapping("huserpage")
    public String UsershowPage() {
        return "backpage/bank";
    }

    @RequestMapping("delbyid")
    @ResponseBody
    public JSONObject deleteByBankCard(HttpSession session,BankCard bankCard) {
        if(bankCard != null) {
            User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
            if(user != null) {
                try{
                    bankCard = (BankCard) bankCardService.getById(bankCard.getBcid());
                    String param = "realName="+bankCard.getRname()+"&bank="+bankCard.getType()+"&bankCardNo="+bankCard.getCardno()+"&phone="+user.getPhone();
                    JSONObject jsonObject = BankAPIUtil.SendjsonObject("http://localhost:8888/bank/unbind",param);
                    bankCardService.remove(bankCard);
                    return jsonObject;
                }catch (Exception e){
                    e.printStackTrace();
                }

            }
        }
            return null;
    }


    @RequestMapping("getbyid")
    @ResponseBody
    public BankCard getByBankCard(Long bcid) {
        BankCard bankCard = new BankCard();
        if(bcid != null) {
            bankCard = (BankCard)bankCardService.getById(bcid);
        }
        return bankCard;
    }

}
