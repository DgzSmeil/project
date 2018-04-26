package com.gs.controller;

import com.gs.bean.*;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.TzbQuery;
import com.gs.service.*;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

/**
 * 创建类名：TzbController
 * 创建时间：2017/12/26 14:38
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/tzb")
public class TzbController {

    @Autowired
    private TzbService tzbService;
    @Autowired
    private LetterService letterService;

    @RequestMapping("/myTzb")
    public String myTzb(){
        return "tzb/tzb";
    }
    //进入我的借款管理
    @RequestMapping("/select")
    @ResponseBody
    public Pager SelectPage(HttpSession session, TzbQuery tzbQuery){
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        Pager pager = new Pager();
        try {
            tzbQuery.setUid(user.getUid());
            pager =  tzbService.listPagerCriteria(tzbQuery.getCurPage(),8,tzbQuery);
        }catch (Exception e){
            e.printStackTrace();
        }

        return pager;
    }
    @RequestMapping("/select_haveorno")
    @ResponseBody
    public ControllerStatusVO Select(HttpSession session, TzbQuery tzbQuery){
        ControllerStatusVO statusVO = null;
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        tzbQuery.setUid(user.getUid());
        tzbQuery.setState((byte)4);
        List<Tzb> tzbs = (List) tzbService.list(tzbQuery);
        if (tzbs.size() != 0){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.TZB_SAVE_SUCCESS);
        }else{
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.TZB_SAVE_FAIL);
        }

        return statusVO;
    }
    @RequestMapping("/list")
    @ResponseBody
    public Pager List(HttpSession session, TzbQuery tzbQuery){
        Pager pager = new Pager();
        try {
            pager =  tzbService.listPagerCriteria(tzbQuery.getCurPage(),8,tzbQuery);
        }catch (Exception e){
            e.printStackTrace();
        }

        return pager;
    }
    //投资
    @RequestMapping("/tz_save")
    @ResponseBody
    public ControllerStatusVO tzSave(HttpSession session,Tzb tzb,UserTicket userTicket) {
        ControllerStatusVO statusVO = null;
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null){
            tzb.setUid(user.getUid());
            //判断是否为自己的标
            if(tzb.getJuid().equals(user.getUid())) {
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.TZB_SAVE_FAIL);
                return statusVO;
            }
            Letter letter = new Letter();
            letter.setHid(1L);
            letter.setState(Byte.valueOf("0"));
            letter.setPhone(user.getPhone());
            letter.setContent("恭喜您！您投资的产品名为"+tzb.getCpname()+",此次投资金额为："+tzb.getMoney()+"元，请等待收益！");
            letter.setTitle("投资成功！");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = format.format(Calendar.getInstance().getTime());
            letter.setDate(date);
            letterService.save(letter);
            return tzbService.add(tzb,userTicket);
        }

        return ControllerStatusVO.status(ControllerStatusEnum.TZB_SAVE_ERROR);

    }
    //后台投资列表
    //shiro权限注解
    @RequiresPermissions("tzb:htzb")
    @RequestMapping("/htzb")
    public String HTzb(){
        return "tzb/htzb";
    }

    @RequestMapping("/hlist")
    @ResponseBody
    public Pager HList(int page, int rows, TzbQuery tzbQuery){
        Pager pager = new Pager();
        pager =  tzbService.listPagerCriteria(page,rows,tzbQuery);
        return pager;
    }
}
