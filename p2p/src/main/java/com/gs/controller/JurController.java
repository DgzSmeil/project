package com.gs.controller;

import com.gs.bean.HUser;
import com.gs.bean.Jur;
import com.gs.common.Combobox;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.JurService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
@Repository
@RequestMapping("/jur")
public class JurController {

    @Autowired
    private JurService jurService;

    @RequiresPermissions("jur:import")
    @RequestMapping("/import")
    @ResponseBody
    public ControllerStatusVO impotr(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        HUser hUser = (HUser)session.getAttribute(Constants.HUSER_IN_SESSION);
        int huserid = Integer.parseInt(String.valueOf(hUser.getHuid()));
        ControllerStatusVO statusVO = null;
        //获取上传的文件
        MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
//        MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
//        MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);
        MultipartFile file = multipart.getFile("file");
        String month = request.getParameter("month");
        InputStream in = file.getInputStream();
        try{
            //数据导入
            jurService.importExcelInfo(in,file,huserid);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JUR_SAVE_SUCCESS);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JUR_SAVE_FAIL);
        }
        in.close();
        return statusVO;
    }

    @RequiresPermissions("jur:page")
    @RequestMapping("page")
    public String Page(){
        return "jur/jur";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, Jur jur){
        return jurService.listPagerCriteria(page,rows,jur);
    }

    @RequiresPermissions("jur:update")
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Jur jur){
        ControllerStatusVO statusVO = null;
        try{
            jurService.update(jur);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JUR_UPDATE_SUCCESS);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JUR_UPDATE_FAIL);
        }
        return statusVO;
    }


    @RequestMapping("all")
    @ResponseBody
    public List<Jur> listAll(){
        List<Jur> jurList = (List)jurService.listAll();
        return jurList;
    }

    @RequestMapping("listAll/{rid}")
    @ResponseBody
    public List<Long> listById(@PathVariable("rid") Long rid){
        List<Long> jurList = jurService.listJur(rid);
        return jurList;
    }

    @RequiresPermissions("jur:remove")
    @RequestMapping("remove/{jid}")
    @ResponseBody
    public ControllerStatusVO removeById(@PathVariable("jid") Long jid){
        ControllerStatusVO statusVO = null;
        try{
            jurService.removeById(jid);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JUR_DEL_SUCCESS);
        }catch(RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JUR_DEL_FAIL);
        }
        return statusVO;
    }
}
