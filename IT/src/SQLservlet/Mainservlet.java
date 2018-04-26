package SQLservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SQLBase.SQLSentenceimp;
import SQLBean.CourseBean;
import SQLBean.TeacherBean;

public class Mainservlet extends HttpServlet {

	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String order = request.getParameter("order");
		if(order.equals("main")){
			List<CourseBean> courselist = sql.courselist();
			request.setAttribute("courselist", courselist);
			List<TeacherBean> teacherlist = sql.teacherlist();
			request.setAttribute("teacherlist", teacherlist);
			request.getRequestDispatcher("yunduo/main.jsp").forward(request, response);
		}else if(order.equals("face")){
			List<CourseBean> courselist = sql.courselist();
			request.setAttribute("courselist", courselist);
			List<TeacherBean> teacherlist = sql.teacherlist();
			request.setAttribute("teacherlist", teacherlist);
			request.getRequestDispatcher("datainfo/face.jsp").forward(request, response);
		}
	}

}
