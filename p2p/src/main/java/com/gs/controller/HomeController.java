package com.gs.controller;

import com.gs.bean.Dynamic;
import com.gs.bean.Home;
import com.gs.common.FileUpload;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.DynamicService;
import com.gs.service.HomeService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private HomeService homeService;

    //shiro权限注解
    @RequiresPermissions("home:page")
    @RequestMapping("page")
    public String page() {
        return "home/home";
    }
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Integer page, Integer rows, Home home){
       return homeService.listPagerCriteria(page, rows, home);
    }

//    @RequiresPermissions("home:save")
//    @RequestMapping("save")
//    @ResponseBody
//    public ControllerStatusVO save(HttpServletRequest request, Home home,
//                                   @RequestParam MultipartFile file1,
//                                   @RequestParam MultipartFile file2,
//                                   @RequestParam MultipartFile file3,
//                                   @RequestParam MultipartFile file4){
//        ControllerStatusVO statusVO = null;
//        try {
//            if (file1 != null){
//                    String pic1img = FileUpload.uploadFile(request,file1);
//                    home.setPic1(pic1img);
//            }
//            if (file2 != null){
//                    String pic2img = FileUpload.uploadFile(request,file2);
//                    home.setPic2(pic2img);
//            }
//            if (file3 != null){
//                    String pic3img = FileUpload.uploadFile(request,file3);
//                    home.setPic3(pic3img);
//            }
//            if (file4 != null){
//                String ewm = FileUpload.uploadFile(request,file4);
//                home.setEwm(ewm);
//            }
//            homeService.save(home);
//        } catch (Exception e) {
//            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_FAIL) ;
//        }
//        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS) ;
//        return statusVO;
//    }
@RequiresPermissions("home:save")
@RequestMapping("save")
@ResponseBody
public ControllerStatusVO save(HttpServletRequest request, Home home, @RequestParam MultipartFile[] file){
    ControllerStatusVO statusVO = null;
    try {
        if (file != null){
            home.setPic1(FileUpload.uploadFile(request,file[0]));
            home.setPic2(FileUpload.uploadFile(request,file[1]));
            home.setPic3(FileUpload.uploadFile(request,file[2]));
            home.setEwm(FileUpload.uploadFile(request,file[3]));
        }
        homeService.save(home);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS) ;
    } catch (Exception e) {
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_FAIL) ;
    }
    return statusVO;
}

    @RequiresPermissions("home:update")
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(HttpServletRequest request, Home home, @RequestParam MultipartFile[] files){
        ControllerStatusVO statusVO = null;
        try {
            if (files != null){
                home.setPic1(FileUpload.uploadFile(request,files[0]));
                home.setPic2(FileUpload.uploadFile(request,files[1]));
                home.setPic3(FileUpload.uploadFile(request,files[2]));
                home.setEwm(FileUpload.uploadFile(request,files[3]));
            }
            homeService.update(home);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_SUCCESS) ;
        } catch (Exception e) {
            e.printStackTrace();
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_FAIL) ;
        }
        return statusVO;
    }
    @RequestMapping("homeppt")
    @ResponseBody
    public Home  homeppt(){
        return homeService.homeppt();
    }
    @RequestMapping("remove")
    @ResponseBody
    public ControllerStatusVO  remove(Long hid){
        ControllerStatusVO statusVO = null;
        if(hid != null){
            homeService.removeById(hid);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_DELETE_SUCCESS);
        }else{
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_DELETE_FAIL);
        }
        return statusVO;
    }





}
