package com.gs.controller;

import com.gs.bean.Media;
import com.gs.common.FileUpload;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.MediaService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/media")
public class MediaController {

    @Autowired
    private MediaService mediaService;

    //shiro权限注解
    @RequiresPermissions("media:page")
    @RequestMapping("page")
    public String page() {
        return "media/media";
    }
    /*@RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, Media media){
        return mediaService.listPagerCriteria(page, rows, media);
    }*/

    @RequiresPermissions("media:save")
    @RequestMapping(value="save")
    @ResponseBody
    public ControllerStatusVO save(HttpServletRequest request, Media media, MultipartFile file) {
        ControllerStatusVO statusVO = null;
        try {
            String fillimg = FileUpload.uploadFile(request,file);
            media.setPic(fillimg);
            media.setDate(Calendar.getInstance().getTime());
            mediaService.save(media);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS) ;
        } catch (Exception e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_FAIL) ;
        }
        return statusVO;
    }

    @RequiresPermissions("media:update")
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Media media,HttpServletRequest request,MultipartFile file1){
        ControllerStatusVO statusVO = null;
        try {
            String pic = FileUpload.uploadFile(request,file1);
            media.setPic(pic);
            mediaService.update(media);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_SUCCESS) ;
        } catch (Exception e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_FAIL) ;
        }
        return statusVO;
    }
    @RequestMapping("listall")
    @ResponseBody
    public List<Media> listAlls() {
        List<Media> mediaList = new ArrayList<>();
        try{
            mediaList = mediaService.mediaPage(Calendar.getInstance().getTime());
        }catch (Exception e){
            e.printStackTrace();
        }
        return mediaList;
    }
    @RequestMapping("nopage")
    public String Mediapage(Long mid, HttpServletRequest request) {
        Media media = new Media();
        if(mid != null){
            media = (Media) mediaService.getById(mid);
            request.setAttribute("mid",media.getMid());
            request.setAttribute("title",media.getTitle());
            request.setAttribute("content",media.getContent());
            request.setAttribute("pic",media.getPic());
            request.setAttribute("url",media.getUrl());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time = sdf.format(media.getDate());
            request.setAttribute("time",time);
        }
        return "newmedia/mediapage";
    }
    @RequestMapping("select")
    @ResponseBody
    public Pager MediaSelectPage(Integer page, Integer rows,Media media,Integer curPage) {
        Pager pager = new Pager();
        if(rows != null && page != null) {
            return pager = mediaService.listPagerCriteria(page,rows,media);
        }else if(curPage != null){
            try{
                return pager = mediaService.listPagerCriteria(curPage,8,null);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return pager;
    }




}
