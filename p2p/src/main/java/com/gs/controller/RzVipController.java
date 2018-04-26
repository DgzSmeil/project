package com.gs.controller;

import com.gs.bean.*;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.UserQuery;
import com.gs.service.LetterService;
import com.gs.service.RzVipCheckService;
import com.gs.service.RzVipService;
import com.gs.service.UserService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Controller
@RequestMapping("/rzvip")
public class RzVipController {

    @Autowired
    private RzVipService rzVipService;

    @Autowired
    private UserService userService;

    @Autowired
    private RzVipCheckService rzVipCheckService;

    @Autowired
    private LetterService letterService;

    @RequestMapping("/save")
    @ResponseBody
    public ControllerStatusVO save(HttpSession session, User user, RzVip rzVip) {
        ControllerStatusVO statusVO = null;
        User user1 = (User) session.getAttribute(Constants.USER_IN_SESSION);
        try {
            user.setUid(user1.getUid());
            rzVip.setUid(user1.getUid());
            rzVip.setIspass((byte) 3);
            int sex = Integer.valueOf(user.getIdno().substring(16, 17))%2;//通过身份证号倒数第二位判断性别
            if (sex == 0) {
                user.setSex((byte)2);//女
            } else if (sex == 1) {
                user.setSex((byte)1);//男
            }
            userService.update(user);
            rzVipService.update(rzVip);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_SAVE_SUCCESS);
        } catch (Exception e){
            e.printStackTrace();
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_SAVE_FAIL);
        }
        return statusVO;
    }

    @RequestMapping("/checkrzVip")
    public String userPageList(){
        return "backpage/rzVip";
    }

    @RequestMapping("/pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, UserQuery userQuery){
        return rzVipService.listPagerCriteria(page, rows, userQuery);
    }

    //认证VIP
    @RequestMapping("/shenhe")
    @ResponseBody
    public ControllerStatusVO shenhe(HttpSession session, RzVipCheck rzVipCheck, UserVO userVO) {
        ControllerStatusVO statusVO = null;
        HUser hUser = (HUser) session.getAttribute(Constants.HUSER_IN_SESSION);
        Letter letter = new Letter();
        try {
            rzVipCheck.setHuid(hUser.getHuid());
            rzVipCheck.setDate(Calendar.getInstance().getTime());
            userVO.setUid(rzVipCheck.getUid());
            User user = (User) userService.getById(rzVipCheck.getUid());
            letter.setPhone(user.getPhone());
            if (rzVipCheck.getIsok() == 2) {
                userVO.setIspass((byte) 2);//通过
                letter.setTitle("身份认证成功");
                letter.setContent("恭喜你！身份认证审核通过，您可使用该身份进行投资借款");
            } else if (rzVipCheck.getIsok() == 4) {
                userVO.setIspass((byte) 4);//不通过
                letter.setTitle("身份认证失败");
                letter.setContent(rzVipCheck.getExcute());
            }
            letter.setHid(1L);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String dates = format.format(Calendar.getInstance().getTime());
            letter.setDate(dates);
            letter.setState((byte)0);
            letterService.save(letter);
            rzVipService.update(userVO);
            rzVipCheckService.save(rzVipCheck);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_ADUIT_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_ADUIT_FAIL);
        }
        return statusVO;
    }

}