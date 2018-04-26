package com.gs.controller;

import com.gs.bean.Friend;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.FriendService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2018/1/9.
 */
@RequestMapping("/friend")
@Controller
public class FriendController {

    @Autowired
    private FriendService friendService;

    @RequestMapping("page")
    private String ShowFriendPage() {
        return "backpage/friend";
    }

    @RequestMapping("filesUpload")
    public String saveFileImage(HttpServletRequest request, MultipartFile file, Friend friend) {
        // 判断文件是否为空
        try {    //使用原始文件名称
            friend.setFpic(uploadImages(request, file));
            friendService.save(friend);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "backpage/friend";
    }

    @RequestMapping("save")
    private String FriendSave() {
        return "";
    }


    @RequestMapping("delete")
    @ResponseBody
    private ControllerStatusVO FriendDelete(Long fid) {
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if (fid != null) {
            friendService.removeById(fid);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.RECOMMEND_DELETE_SUCCESS);
        }
        return statusVO;
    }

    @RequestMapping("update")
    private String FriendUpdate(HttpServletRequest request, MultipartFile file,Friend friend) {
        if (friend != null) {
            friend.setFpic(uploadImages(request, file));
            friendService.update(friend);
        }
        return "backpage/friend";
    }

    @RequestMapping("select")
    @ResponseBody
    private Pager FriendSelect(Integer page, Integer rows, Friend friend) {
        Pager pager = new Pager();
        if (page != null && rows != null) {
            try {
                return pager = friendService.listPagerCriteria(page, rows, friend);
            } catch (Exception e) {

                e.printStackTrace();
            }
        }
        return pager;
    }

    @RequestMapping("selectlist")
    @ResponseBody
    private List<Friend> FriendSelectShowPage() {
        return friendService.listFriendShow();
    }

    public static String uploadImages(HttpServletRequest request, MultipartFile file) {
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {    //使用原始文件名称
                String fileName = file.getOriginalFilename();
                //重新格式化文件名称
                // 新的图片名称  UUID.randomUUID()随机数
                String newFilename = UUID.randomUUID() + fileName.substring(fileName.lastIndexOf("."));
                String path = request.getSession().getServletContext().getRealPath("upload");
                File dir = new File(path, newFilename);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                file.transferTo(dir);
                return newFilename;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "";
    }
}