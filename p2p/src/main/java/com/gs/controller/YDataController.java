package com.gs.controller;

import com.gs.service.YDataService;
import com.gs.vo.YDataVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

/**
 * Created by Administrator on 2018/1/18.
 */

@Controller
@RequestMapping("/ydata")

public class YDataController {

    @Autowired
    private YDataService yDataService;

    @RequestMapping("ydata")
    @ResponseBody
    public YDataVO yDataPage(HttpSession session, HttpServletRequest request){
        YDataVO yDataVO = new YDataVO();
        BigDecimal tmoney = yDataService.countTzbMoney();
        BigDecimal mmoney = yDataService.countMtzbMoney();
        int tuser = yDataService.getTUserCount();
        int muser = yDataService.getMUserCount();
        int ttzno = yDataService.getTtzCount();
        int mtzno = yDataService.getMtzCount();
        int tdkno = yDataService.getTdkCount();
        int mdkno = yDataService.getMdkCount();
        int tdkbno = yDataService.getTdkbCount();
        int mdkbno = yDataService.getMdkbCount();

        yDataVO.setTmoney(tmoney);
        yDataVO.setMmoney(mmoney);
        yDataVO.setTuser(tuser);
        yDataVO.setMuser(muser);
        yDataVO.setTtzno(ttzno);
        yDataVO.setMtzno(mtzno);
        yDataVO.setTdkno(tdkno);
        yDataVO.setMdkno(mdkno);
        yDataVO.setTdkbno(tdkbno);
        yDataVO.setMdkbno(mdkbno);

        return yDataVO;
    }


}
