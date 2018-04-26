package com.gs.controller;

import com.gs.bean.User;
import com.gs.bean.UserTicket;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.TzbQuery;
import com.gs.query.UserTicketQuery;
import com.gs.service.UserTicketService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.UserTicketVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Calendar;

/**
 * Created by Administrator on 2018/1/2.
 */
@Controller
@RequestMapping("/uticket")

public class UserTicketController {

    @Autowired
    private UserTicketService userTicketService;

    //shiro权限注解
    @RequiresPermissions("uticket:page")
    @RequestMapping("page")
    public String page(){
        return "ticket/userTicket";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, UserTicketQuery userTicketQuery ){
        return userTicketService.listPagerCriteria(page,rows,userTicketQuery);
    }

    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(HttpSession session, UserTicket userTicket){
        ControllerStatusVO statusVO = null;
        try{
            User user = (User)session.getAttribute("user");
            userTicket.setUid(user.getUid());
            userTicket.setTktime(new Timestamp(Calendar.getInstance().getTime().getTime()));
            userTicketService.save(userTicket);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.UTICKET_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.UTICKET_SAVE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("get")
    @ResponseBody
    public UserTicketVO getById(HttpSession session){
        User user = (User)session.getAttribute("user");
        UserTicketVO userTicketVOList = (UserTicketVO)userTicketService.getById(user.getUid());
        return userTicketVOList;
    }

    @RequestMapping("remove")
    @ResponseBody
    public ControllerStatusVO delete(@RequestParam(value="ids") String ids) throws Exception{
        ControllerStatusVO statusVO = null;
        String[] idStr = ids.split(",");
        for (String id : idStr) {
            userTicketService.removeById(Long.parseLong(id));
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.UTICKET_DELETE_SUCCESS);
        return statusVO;
    }


    @RequestMapping("/select/{type}/{status}")
    @ResponseBody
    public Pager SelectPage(HttpSession session, UserTicketQuery userTicketQuery, @PathVariable("type") int type,@PathVariable("status") int status){
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        Pager pager = new Pager();
        try {
            userTicketQuery.setUid(user.getUid());
            userTicketQuery.setType(type);
            userTicketQuery.setStatus(status);
            pager = userTicketService.listPagerCriteria(userTicketQuery.getCurPage(),4,userTicketQuery);
        }catch (Exception e){
            e.printStackTrace();
        }
        return pager;
    }
}
