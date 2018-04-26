package com.gs.controller;

import com.gs.bean.Hkb;
import com.gs.bean.Skb;
import com.gs.bean.Tzb;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.SkbQuery;
import com.gs.query.TzbQuery;
import com.gs.service.HkbService;
import com.gs.service.SkbService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.SumDateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

/**
 * 创建类名：SkbController
 * 创建时间：2018/1/11 9:19
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/skb")
public class SkbController {
    @Autowired
    private SkbService skbService;

    //新增
    @RequestMapping("/add_skb")
    @ResponseBody
    public ControllerStatusVO addSkb(HttpSession session, TzbQuery tzb) {
        ControllerStatusVO statusVO = null;
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        tzb.setUid(user.getUid());
        statusVO = skbService.add(tzb);
        return statusVO;

    }
    //收款明细
    @RequestMapping("/list")
    @ResponseBody
    public Pager List(HttpSession session, SkbQuery skbQuery) {
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        skbQuery.setUid(user.getUid());
        Pager pager = skbService.listPagerCriteria(skbQuery.getCurPage(),8,skbQuery);
        return pager;

    }
    //查看收款详情
    @RequestMapping("/look_skb")
    @ResponseBody
    public Skb lookSkb(Skb skb) {
        Skb skb1 =new Skb();
        skb1 = (Skb) skbService.getById(skb.getSkid());
        return skb1;

    }
    //获取根据时间的待收本息
    @RequestMapping("/sumDate")
    @ResponseBody
    public SumDateVO sumDate(HttpSession session) {
        SumDateVO sumDateVO = new SumDateVO();
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(Calendar.getInstance().getTime());
        calendar.add(Calendar.MONTH, 1);
        BigDecimal money1 = skbService.SumByDate(user.getUid(),calendar.getTime());
        calendar.add(Calendar.MONTH,2);
        BigDecimal money2 = skbService.SumByDate(user.getUid(),calendar.getTime());
        calendar.add(Calendar.MONTH,9);
        BigDecimal money3 = skbService.SumByDate(user.getUid(),calendar.getTime());
        BigDecimal money4 = skbService.SumByDate(user.getUid(),null);
        sumDateVO.setMoney1(money1);
        sumDateVO.setMoney2(money2);
        sumDateVO.setMoney3(money3);
        sumDateVO.setMoney4(money4);
        return sumDateVO;

    }
    //收款
    @RequestMapping("/update_skb")
    @ResponseBody
    public ControllerStatusVO updateSkb(Skb skb) {
        skb = (Skb) skbService.getById(skb.getSkid());
        return skbService.update_skb(skb);

    }
}
