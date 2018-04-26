package com.gs.controller;

import com.gs.bean.Hkb;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.HkbQuery;
import com.gs.query.TzbQuery;
import com.gs.service.HkbService;
import com.gs.vo.ControllerStatusVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 创建类名：HkbController
 * 创建时间：2018/1/9 11:40
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/hkb")
public class HkbController {
    @Autowired
    private HkbService hkbService;

    @RequestMapping("/search")
    @ResponseBody
    public Pager search(HttpSession session, HkbQuery hkbQuery){
        Pager pager = new Pager();
        pager =  hkbService.listPagerCriteria(hkbQuery.getCurPage(),20,hkbQuery);
        return pager;
    }
    @RequestMapping("/hkb_list")
    @ResponseBody
    public Pager List(HttpSession session, HkbQuery hkbQuery){
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        if (hkbQuery.getState() == null){
            if (!hkbQuery.getBorrowFlag().equals("")){
                hkbQuery.setState((byte)1);
            }
        }
        hkbQuery.setUid(user.getUid());
        Pager pager = new Pager();
        pager =  hkbService.list(hkbQuery.getCurPage(),8,hkbQuery);
        return pager;
    }
    //查看还款详情
    @RequestMapping("/look_hkb")
    @ResponseBody
    public Hkb lookSkb(Hkb hkb) {
        Hkb hkb1 = new Hkb();
        hkb1 = (Hkb) hkbService.getById(hkb.getHkid());
        return hkb1;

    }
    //查看还款详情
    @RequestMapping("/update_hkb")
    @ResponseBody
    public ControllerStatusVO UpdateSkb(Hkb hkb) {
        return hkbService.update_hkb(hkb);
    }
    //后台还款列表
    @RequestMapping("/hhkb/{baid}")
    public String Hhkb(HttpServletRequest request,@PathVariable("baid") Long baid){
        request.setAttribute("baid",baid);
        return "hkb/hhkb";
    }

    @RequestMapping("/hlist/{baid}")
    @ResponseBody
    public Pager HList(int page, int rows, HkbQuery hkbQuery,@PathVariable("baid") Long baid){
        Pager pager = new Pager();
        hkbQuery.setBaid(baid);
        pager =  hkbService.list(page,rows,hkbQuery);
        return pager;
    }
    //后台逾期还款列表
    @RequestMapping("/hhkb_state")
    public String HhkbState(){
        return "hkb/hhkb_state";
    }

    @RequestMapping("/hlist_state")
    @ResponseBody
    public Pager HListState(int page, int rows, HkbQuery hkbQuery){
        Pager pager = new Pager();
        hkbQuery.setState((byte)3);
        pager =  hkbService.list(page,rows,hkbQuery);
        return pager;
    }
    //进入设置自动还款页面
    @RequestMapping("/tzb_zdhk")
    @ResponseBody
    public Hkb tzbZdhk(HttpSession session,HkbQuery hkbQuery) {
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        hkbQuery.setUid(user.getUid());
        List<Hkb> hkbs = (List) hkbService.listByBaid(hkbQuery);
        Hkb hkb = hkbs.get(0);
        return hkb;
    }

    //进入设置自动还款页面
    @RequestMapping("/zdhk")
    @ResponseBody
    public ControllerStatusVO Zdhk(HttpSession session,Hkb hkb) {
        ControllerStatusVO statusVO = null;
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        hkb.setUid(user.getUid());
        hkbService.update(hkb);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.DxModel_UPDATE_SUCCESS);
        return statusVO;
    }
}
