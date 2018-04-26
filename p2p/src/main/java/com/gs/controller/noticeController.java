package com.gs.controller;

import com.gs.bean.Notice;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.noticeService;
import com.gs.vo.ControllerStatusVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2018/1/7.
 */
@Controller
@RequestMapping("/notice")
public class noticeController {

    @Autowired
    private noticeService noticeService;

    //shiro权限注解
    @RequiresPermissions("notice:page")
    @RequestMapping("page")
    public String showNoticePage() {
        return "backpage/notice";
    }

    @RequestMapping("select")
    @ResponseBody
    public Pager NoticeSelectPage(Integer page, Integer rows,Notice notice,Integer curPage) {
        Pager pager = new Pager();
        if(rows != null && page != null) {
                return pager = noticeService.listPagerCriteria(page,rows,notice);
        }else if(curPage != null){
            try{
                return pager = noticeService.listPagerCriteria(curPage,8,null);
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        return pager;
    }

    @RequiresPermissions("notice:save")
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO NoticeSavePage(Notice notice) {
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(notice != null) {
            try{
                noticeService.save(notice);
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS);
            }catch (Exception e){
                e.printStackTrace();
            }

        }
        return statusVO;
    }

    @RequestMapping("delete")
    @ResponseBody
    public ControllerStatusVO NoticeDeletePage(Long nid) {
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(nid != null) {
            noticeService.removeById(nid);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.RECOMMEND_DELETE_SUCCESS);
        }
        return statusVO;
    }

    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO NoticeUpdatePage(Notice notice) {
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(notice != null) {
            try{
                noticeService.update(notice);
                return  statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_SUCCESS);
        }catch (Exception e){
                e.printStackTrace();
            }
        }
        return statusVO;
    }

    @RequestMapping("appdenpage")
    public String NoticeAppdenToPage() {
        return "newmedia/noticepage";
    }

    @RequestMapping("indexno")
    @ResponseBody
    public List<Notice> showIndexPage() {
        List<Notice> noticeList = new ArrayList<>();
        noticeList =  noticeService.noticeIndex(Calendar.getInstance().getTime());
        return noticeList;
    }

    @RequestMapping("show")
    public String ShowNoticepage() {
        return "html/ptgg";
    }

    @RequestMapping("nopage")
    public String NoticePage(Long nid, HttpServletRequest request) {
        Notice notice = new Notice();
        if(nid != null){
            notice = (Notice) noticeService.getById(nid);
            request.setAttribute("title",notice.getTitle());
            request.setAttribute("time",notice.getDate());
            request.setAttribute("content",notice.getContent());
        }
        return "newmedia/noticepage";
    }


}
