package com.gs.controller;

import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.service.BorrowDetailService;
import com.gs.vo.SearshBorrowVo;
import com.gs.vo.investBorrowVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/1/2.
 */
@Controller
@RequestMapping("/detail")
public class BorrowDetailController {

    @Autowired
    private BorrowDetailService borrowDetailService;

    @RequestMapping("page")
    public String ShowPage() {
        return "user/invest_list";
    }

    @RequestMapping("invest")
    @ResponseBody
    public Pager InvestListPage(SearshBorrowVo param) {

        Pager pager = new Pager();
        try{
            pager = borrowDetailService.listPagerCriteria(param.getCurPage(),8,param);
            //pager.get
        }catch(Exception e){
            e.printStackTrace();
        }

        return pager;
    }
}
