package SQLup;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
public class Videoservlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = getServletContext().getRealPath("/")+"upvideo"; 
		File file = new File(path);
		if (!file.exists()) {
			file.mkdir();
		}
		int fileupsize = 1024*1024*1024;
		int filecount=0;
		String fileName=null;
		Filename filename = new Filename();
		MultipartRequest mr = new MultipartRequest(request,path,fileupsize,"utf-8",filename);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		Enumeration filesname = mr.getFileNames();   
        while (filesname.hasMoreElements()) {  
            String name = (String) filesname.nextElement();  
            System.out.println(name);  
            fileName = mr.getFilesystemName(name); 
            String contentType = mr.getContentType(name);
            if (fileName != null) {  
                filecount++;  
            }  
            System.out.println("文件名：" + fileName);  
            System.out.println("文件类型： " + contentType); 
            out.println("<embed width='1300' height='580' border='1' src='upvideo/"+fileName+"''>"); 
        } 
       
	}

}


