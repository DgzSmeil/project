package com.gs.controller;

import com.gs.common.Pager;
import com.gs.service.BorrowApplyService;
import com.gs.service.BorrowDetailService;
import com.gs.vo.SearshBorrowVo;
import com.gs.vo.investBorrowVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 创建类名：IndexController
 * 创建时间：2017/12/19 9:11
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired
    private BorrowApplyService borrowApplyService;

    @RequestMapping("")
    public String index(HttpSession session, HttpServletRequest request){
        List<investBorrowVo> pager = (List)borrowApplyService.listByBzid((long) 1);
        List<investBorrowVo> pager2 = (List)borrowApplyService.listByBzid((long) 2);
        List<investBorrowVo> pager3 = (List)borrowApplyService.listByBzid((long) 3);
        request.setAttribute("pager",pager);
        request.setAttribute("pager2",pager2);
        request.setAttribute("pager3",pager3);
        return "index";
    }

}
