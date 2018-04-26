package com.gs.controller;

import com.gs.bean.HUser;
import com.gs.common.Combobox;
import com.gs.common.Constants;
import com.gs.common.EncryptUtils;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.HUserQuery;
import com.gs.query.UserQuery;
import com.gs.service.HUserService;
import com.gs.service.RoleUserService;
import com.gs.service.UserService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/22
 */
@Controller
@RequestMapping("/huser")
public class HUserController {

    @Autowired
    private HUserService hUserService;
    @Autowired
    private RoleUserService roleUserService;

    @Autowired
    private UserService userService;

    @RequestMapping("/login_page")
    public String login_page(){
        return "user/backlogin";
    }

    @RequestMapping("/userlist_page")
    public String userPageList(){
        return "backpage/userList";
    }

    @RequestMapping("/huserlist_page")
    public String huserPageList(HttpSession session, HUser hUser, HttpServletRequest request){
        HUser hUser1 = (HUser) session.getAttribute(Constants.HUSER_IN_SESSION);
        hUser = (HUser) hUserService.getById(hUser1.getHuid());
        request.setAttribute("hUser", hUser);
        return "backpage/huserList";
    }

    /**
     * 后台登录
     * @param session
     * @param request
     * @param phone
     * @param pwd
     * @param code
     * @return
     */
    @RequestMapping("/backlogin")
    @ResponseBody
    public ControllerStatusVO login(HttpSession session, HttpServletRequest request, String phone, String pwd, String code) {
        Object obj = session.getAttribute(Constants.CODE_IN_SESSION);
        ControllerStatusVO statusVO = null;
        if (obj != null) {
            String checkCode = (String) obj;
            if (checkCode.equalsIgnoreCase(code)) {
                Object userObj = session.getAttribute(Constants.HUSER_IN_SESSION);
                if (userObj == null) {
                    HUser hUser = hUserService.getByPhonePwd(phone, EncryptUtils.md5(pwd));
                    if (hUser != null) {
                        session.setAttribute(Constants.HUSER_IN_SESSION, hUser);
                        try{
                            Subject subject = SecurityUtils.getSubject();
                            subject.login(new UsernamePasswordToken(phone,EncryptUtils.md5(pwd)));
                            Session sessionShiro = subject.getSession();
                            sessionShiro.setAttribute("hUser",hUser);
                            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_SUCCESS);
                        }catch (AuthenticationException e){
                            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HUSER_LOGIN_UNAUTH) ;
                        }
                        return statusVO;
                    } else {
                        statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_FAIL);
                    }
                } else {
                    statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_ALREADY_LOGIN);
                }
            } else {
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_ERROR_CODE);
            }
        }
        return statusVO;
    }

    @RequestMapping("home")
    public String home(HttpSession session, HUser hUser, HttpServletRequest request) {
        HUser hUser1 = (HUser) session.getAttribute(Constants.HUSER_IN_SESSION);
        hUser = (HUser) hUserService.getById(hUser1.getHuid());
        request.setAttribute("hUser", hUser);
        return "backpage/index";
    }

    @RequestMapping("down")
    public String loginout() {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
        }
        return "user/backlogin";
    }

    @RequestMapping("all")
    @ResponseBody
    public List<Combobox> listAll(){
        List<Object> objectList = hUserService.listAll();
        List<Combobox> comboboxList = new ArrayList<>();
        for(Object obj : objectList){
            HUser hUser = (HUser) obj;
            comboboxList.add(new Combobox(hUser.getHuid()+"",hUser.getHuname(),false));
        }
        return comboboxList;
    }

    @RequestMapping("user_pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, UserQuery userQuery){
        return userService.listPagerCriteria(page, rows, userQuery);
    }

    //普通管理员查询
    @RequestMapping("page")
    public String Page(){
        return "huser/huser";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, HUserQuery hUserQuery){
        return hUserService.listPagerCriteria(page,rows,hUserQuery);
    }

    //后台员工查询
    @RequestMapping("page1")
    public String Page1(){
        return "huser/huser1";
    }

    @RequestMapping("pager_criteria1")
    @ResponseBody
    public Pager pagerCriteria1(int page, int rows,HUserQuery hUserQuery){
        return hUserService.listPagerCriteriaE(page,rows,hUserQuery);
    }

    @RequiresPermissions("roleUser:save")
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(HUserQuery hUserQuery){
        ControllerStatusVO statusVO = null;
        try{
            hUserQuery.setPwd(EncryptUtils.md5("123456"));
            hUserService.save(hUserQuery);
            roleUserService.save(hUserQuery);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HUSER_SAVE_SUCCESS);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HUSER_SAVE_FAIL);
        }
        return statusVO;
    }

    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(HUserQuery hUserQuery){
        ControllerStatusVO statusVO = null;
        try{
            hUserService.update(hUserQuery);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HUSER_UPDATE_SUCCESS);
        }catch(RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HUSER_UPDATE_FAIL);
        }
        return statusVO;
    }

    @RequiresPermissions("roleUser:remove")
    @RequestMapping("remove/{huid}")
    @ResponseBody
    public ControllerStatusVO removeById(@PathVariable("huid") Long huid){
        ControllerStatusVO statusVO = null;
        try{
            roleUserService.removeById(huid);
            hUserService.removeById(huid);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HUSER_DEL_SUCCESS);
        }catch(RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HUSER_DEL_FAIL);
        }
        return statusVO;
    }

    @RequestMapping("updatepwd")
    @ResponseBody
    public ControllerStatusVO updatepwd(HttpSession session,String oldpwd,String newpwd){
        ControllerStatusVO statusVO = null;
        try{
            HUser hUser = (HUser)session.getAttribute(Constants.HUSER_IN_SESSION);
            if(EncryptUtils.md5(oldpwd) == hUser.getPwd() || EncryptUtils.md5(oldpwd).equals(hUser.getPwd())){
                hUser.setPwd(EncryptUtils.md5(newpwd));
                hUserService.update(hUser);
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.HUSER_UPDATEPWD_SUCCESS);
            }else{
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.HUSER_UPDATEPWD);
            }
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HUSER_UPDATEPWD_FAIL);
        }
        return statusVO;
    }
}