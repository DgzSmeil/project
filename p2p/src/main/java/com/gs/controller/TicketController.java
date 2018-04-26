package com.gs.controller;

import com.gs.bean.Ticket;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.TicketService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2017/12/25.
 */
@Controller
@RequestMapping("/ticket")

public class TicketController {

    @Autowired
    private TicketService ticketService;

    @RequestMapping("myTicket")
    public String myTicket(){
        return "ticket/myTicket";
    }

    //shiro权限注解
    @RequiresPermissions("ticket:page")
    @RequestMapping("page")
    public String page(){
        return "ticket/ticket";
    }


    @RequestMapping("page_list")
    public String pageList(){
        return "ticket/ticketList";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, Ticket ticket){
        return ticketService.listPagerCriteria(page,rows,ticket);
    }

    //shiro权限注解
    @RequiresPermissions("ticket:save")
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Ticket ticket){
        ControllerStatusVO statusVO = null;
        try{
            ticketService.save(ticket);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.TICKET_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.TICKET_SAVE_SUCCESS);
        return statusVO;
    }

    //shiro权限注解
    @RequiresPermissions("ticket:update")
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Ticket ticket){
        ControllerStatusVO statusVO = null;
        try{
            ticketService.update(ticket);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.TICKET_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.TICKET_UPDATE_SUCCESS);
        return statusVO;
    }





}
