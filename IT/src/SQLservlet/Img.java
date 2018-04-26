package SQLservlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SQLBase.SQLSentenceimp;
import SQLBean.ManagerBean;
import SQLBean.StudentBean;
import SQLBean.TeacherBean;
import SQLup.Filename;

import com.oreilly.servlet.MultipartRequest;

public class Img extends HttpServlet {
	
	SQLSentenceimp sql = new SQLSentenceimp();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String order = request.getParameter("order");
		HttpSession session = request.getSession();
		if(order.equals("refushface")){
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			String str =sql.img("studentface","student","studentid",studentBean.getStudentid()+""); 
			out.print(str);
		}else if (order.equals("check")) {
			String registerName = request.getParameter("registerName");
			out.print("输入正确");
			System.out.println(registerName);
		}else if(order.equals("checkface")) {
			System.out.println("用户名："+request.getParameter("mobile"));
			System.out.println("img:"+request.getParameter("img"));
			MultipartRequest mr = null;
			String path = getServletContext().getRealPath("/")+"upfile"; 
			File file = new File(path);
			if (!file.exists()) {
				file.mkdir();
			}
			int fileupsize = 3*1024*1024;
			int filecount=0;
			String fileName=null;
			Filename filename = new Filename();
			System.out.println(filename);
			try {
				mr = new MultipartRequest(request,path,fileupsize,"utf-8",filename);
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
			}catch (Exception e) {
				System.out.println("出错了！");
				e.printStackTrace();
			}
		}else if(order.equals("refushteacherface")){
			TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherBean2");
			String str =sql.img("teacherpictureurl","teacher","teacherid",teacherBean.getTeacherid()+""); 
			out.print(str);
//			System.out.println(str);
		}else if (order.equals("refushmanager")) {
			ManagerBean managerBean = (ManagerBean)session.getAttribute("managerbean");
			String str =sql.img("managerurl","manager","manager_id",managerBean.getManager_id()+""); 
			out.print(str);
		}
	}
}
