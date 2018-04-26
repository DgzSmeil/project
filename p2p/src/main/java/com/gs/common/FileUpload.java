package com.gs.common;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class FileUpload {
    /**
     * 文件上传
     * */
    public static String uploadFile(HttpServletRequest request, MultipartFile file) throws Exception{

        //拿到文件名称
        String exfileName = file.getOriginalFilename();
        if(exfileName.length() == 0) {
            return null;
        }
        //截取文件名称。取从.号开始到后面的所有名称
        String suffix =exfileName.substring(exfileName.indexOf("."));

        //利用时间对文件名进行重名
        SimpleDateFormat df  = new SimpleDateFormat("yyyMMddHHmmssSSS");

        //新文件名
        String newFilename = df.format(new Date());

        //拿到全局路径
        String contextPath = request.getServletContext().getRealPath("/static/upload/picimg/");
        System.out.println("contextpath: "+contextPath);
        //把路径中的包括\\全部换成/
        contextPath = contextPath.replace("\\","/");

        File dir = new File(contextPath,newFilename+suffix);
        if(!dir.exists()){
            dir.mkdirs();
        }
        //MultipartFile自带的解析方法
        file.transferTo(dir);

        //上传文件路径
        String path = newFilename+suffix;

        return path;
    }


}
