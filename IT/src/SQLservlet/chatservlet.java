package SQLservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SQLBase.AesUtils;
import SQLBase.SQLSentenceimp;
import SQLBean.StudentBean;

public class chatservlet extends HttpServlet {

	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application = getServletContext();
		String order = request.getParameter("order");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(order!=null){
			if(order.equals("chat")){
				List<StudentBean> studList = sql.studentlist();
				request.setAttribute("studList",studList);
				request.getRequestDispatcher("chatroom/main.jsp").forward(request, response);
 				
			}else if (order.equals("add")) {
				if(request.getParameter("msg1")!=null || !request.getParameter("msg").equals("")){
					if(application.getAttribute("msg1")==null){
						application.setAttribute("msg1", request.getParameter("msg1"));
					}else {
						String msg = application.getAttribute("msg1").toString();
						application.setAttribute("msg1", msg+request.getParameter("msg1"));
					}
					out.print(application.getAttribute("msg1"));
				}else {
					out.print(application.getAttribute("msg1"));
				}
			}else if (order.equals("check")) {
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				password = AesUtils.encryptStr(password, AesUtils.SECRETKEY);
				StudentBean studentbean = sql.checkstudentlogin(username);
				if(studentbean!=null){
					if(!studentbean.getStudentpassword().equals(password) && !studentbean.getStudentname().equals(username)){
						out.print("用户名或吗，密码错误！");
					}else {
						out.print("欢迎来到IT课堂交流QQ平台！");
					}
				}else {
					out.print("账户不存在！");
				}
			}
		}
	}
}
