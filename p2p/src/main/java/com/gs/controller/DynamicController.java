package com.gs.controller;

import com.gs.bean.Dynamic;
import com.gs.common.FileUpload;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.DynamicService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/dynamic")
public class DynamicController {

    @Autowired
    private DynamicService dynamicService;

    //shiro权限注解
    @RequiresPermissions("dynamic:page")
    @RequestMapping("page")
    public String page() {
        return "dynamic/dynamic";
    }
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, Dynamic dynamic){
        return dynamicService.listPagerCriteria(page, rows, dynamic);
    }
    @RequestMapping("editor")
    public String editor(Long dyid) {
        if (dyid != 0){//存在，修改
            dynamicService.getById(dyid);
            return "dynamic/page";
        }
        return "dynamic/page";
    }

    @RequiresPermissions("dynamic:save")
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(HttpServletRequest request, Dynamic dynamic, MultipartFile file){
        ControllerStatusVO statusVO = null;
        try {
            String pic = FileUpload.uploadFile(request,file);
            dynamic.setPic(pic);
            dynamic.setDate(Calendar.getInstance().getTime());
            dynamicService.save(dynamic);
        } catch (Exception e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_FAIL) ;
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS) ;
        return statusVO;
    }

    @RequiresPermissions("dynamic:update")
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Dynamic dynamic,HttpServletRequest request,MultipartFile file1){
        ControllerStatusVO statusVO = null;
        try {
            String pic = FileUpload.uploadFile(request,file1);
            dynamic.setPic(pic);
            System.out.println("updatetime"+Calendar.getInstance().getTime());
            dynamicService.update(dynamic);
        } catch (Exception e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_FAIL) ;
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_SUCCESS) ;
        return statusVO;
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Dynamic> listAll() {
        List<Dynamic> mediaList = new ArrayList<>();
        mediaList = dynamicService.dynamicPage(Calendar.getInstance().getTime());
        return mediaList;
    }
    @RequestMapping("nopage")
    public String Dynamicpage(Long dyid, HttpServletRequest request) {
        Dynamic dynamic = new Dynamic();
        if(dyid != null){
            dynamic = (Dynamic) dynamicService.getById(dyid);
            request.setAttribute("title",dynamic.getTitle());
            request.setAttribute("content",dynamic.getContent());
            request.setAttribute("pic",dynamic.getPic());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time = sdf.format(dynamic.getDate());
            request.setAttribute("time",time);
        }
        return "newmedia/dynamicpage";
    }

    @RequestMapping("select")
    @ResponseBody
    public Pager DynamicSelectPage(Integer page, Integer rows,Dynamic dynamic,Integer curPage) {
        Pager pager = new Pager();
        if(rows != null && page != null) {
            try{
            return pager = dynamicService.listPagerCriteria(page,rows,dynamic);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(curPage != null){
                return pager = dynamicService.listPagerCriteria(curPage,8,null);
        }
        return pager;
    }
}
