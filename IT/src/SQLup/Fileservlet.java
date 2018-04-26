package SQLup;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.oreilly.servlet.MultipartRequest;
@SuppressWarnings("serial")
public class Fileservlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Result result = new Result();
		result.avatarUrls = new ArrayList();
		result.success = false;
		result.msg = "Failure!";
		String path = getServletContext().getRealPath("/")+"upfile"; 
		File file = new File(path);
		if (!file.exists()) {
			file.mkdir();
		}
		int fileupsize = 10*1024*1024;
		int filecount=0;
		String fileName=null;
		Filename filename = new Filename();
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request,path,fileupsize,"utf-8",filename);
		} catch (Exception e) {
			request.setAttribute("msg", "上传失败！文件大小只能是3M以下！");
			request.getRequestDispatcher("T12doc/fileup.jsp").forward(request, response);
			return;
		}
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		Enumeration filesname = mr.getFileNames(); 
        while (filesname.hasMoreElements()) { 
            String name = (String) filesname.nextElement();  
            fileName = mr.getFilesystemName(name); 
            String contentType = mr.getContentType(name);
            if (fileName != null) {  
                filecount++;  
            }  
            System.out.println("文件名：" + fileName);  
            System.out.println("文件类型： " + contentType);   
        } 
        if (result.sourceUrl != null) {
			result.sourceUrl += fileName;
		}
		result.success = true;
		result.msg = "Success!";
		out.println(JSON.toJSONString(result));
	}

}

