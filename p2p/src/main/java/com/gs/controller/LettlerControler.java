package com.gs.controller;

import com.gs.bean.HUser;
import com.gs.bean.Letter;
import com.gs.bean.Notice;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.LetterService;
import com.gs.service.noticeService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/1/11.
 */
@Controller
@RequestMapping("/letter")
public class LettlerControler {

    @Autowired
    private LetterService letterService;

    //shiro权限注解
    @RequiresPermissions("letter:save")
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO LetterSave(Letter letter, HttpSession session) {
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(letter != null) {
            HUser hUser = (HUser) session.getAttribute(Constants.HUSER_IN_SESSION);
            if(hUser != null) {
                if(letter.getPhone() != null && letter.getUid() == 1) {
                    letter.setUid(null);
                }
                try{
                    letter.setHid(hUser.getHuid());
                    letter.setState(Byte.valueOf("0"));
                    letterService.save(letter);
                    statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS);
                }catch (Exception e){
                    e.printStackTrace();
                }

            }

        }
        return statusVO;
    }

    @RequestMapping("delete")
    @ResponseBody
    public ControllerStatusVO LetterRemove(Long lid,String ids) {
        ControllerStatusVO statusVO = new ControllerStatusVO();
            if(lid != null || ids != null) {
                if(ids != null) {
                    String strArrray[] = ids.split(",");
                    for(int i=0; i<strArrray.length;i++) {
                        Long id = Long.valueOf(strArrray[i]);
                        letterService.removeById(id);
                    }
                }
                letterService.removeById(lid);
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.RECOMMEND_DELETE_SUCCESS);
            }
        return statusVO;
    }


    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO LetterUpdate(Letter letter,String ids,Byte state) {
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(letter != null || ids != null || state !=null) {
            if(letter.getPhone() != null && letter.getUid() == 1) {
                letter.setUid(null);
            }
            if(ids != null && state != null) {
                String strArray[]= ids.split(",");
                for (int i=0; i<strArray.length; i++){
                    letter.setLid(Long.valueOf(strArray[i]));
                    letter.setState(state);
                    letterService.update(letter);
                }
            }
            letterService.update(letter);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_SUCCESS);
        }
        return statusVO;
    }


    @RequestMapping("select")
    @ResponseBody
    public Pager LetterSelect(HttpSession session,Integer page, Integer rows, Letter letter, Integer curPage) {
        Pager pager = new Pager();
        if(rows != null && page != null) {
            return pager = letterService.listPagerCriteria(page,rows,letter);
        }else if(curPage != null){
            try{
                User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
                letter.setUid(0L);
                letter.setPhone(user.getPhone());
                return pager = letterService.listPagerCriteria(curPage,8,letter);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return pager;
    }

    @RequestMapping("partid")
    @ResponseBody
    public Letter letterPartidPage(Long lid) {
        if(lid != null) {
            Letter letter = (Letter) letterService.getById(lid);
            letter.setState(Byte.valueOf("1"));
            letterService.update(letter);
            return letter;
        }
        return null;
    }

    @RequiresPermissions("letter:page")
    @RequestMapping("page")
    public String LetterSelectShowPage() {
        return "backpage/letter";
    }

    @RequestMapping("pageparti")
    public String letterParti() {
        return "user/letterparti";
    }

    @RequestMapping("showpage")
    public String LetterShowPage() {
        return "user/letterpage";
    }
}
