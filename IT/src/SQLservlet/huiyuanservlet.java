package SQLservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SQLBase.SQLSentenceimp;
import SQLBean.MoneyBean;
import SQLBean.StudentBean;
import SQLBean.VIPBean;

public class huiyuanservlet extends HttpServlet {

	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String order = request.getParameter("order");
		if(order!=null){
			if(order.equals("list")){
				List<VIPBean> list = sql.viplist(2, 0);
				List<VIPBean> list1 = sql.viplist(1,0);
				List<VIPBean> list2 = sql.viplist(1,1);
				request.setAttribute("list1", list1);
				request.setAttribute("list2", list2);
				request.setAttribute("list", list);
				HttpSession session = request.getSession();
				StudentBean student = (StudentBean)session.getAttribute("bean");
				StudentBean stu = sql.findstudent(student.getStudentname());
				int VIP = stu.getVIP();
				request.setAttribute("VIP", VIP);
				if(request.getParameter("n").equals("n")){
					request.getRequestDispatcher("datainfo/vip.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("datainfo/huiyuan.jsp").forward(request, response);
				}
			}else if (order.equals("fukuan")) {
				System.out.println("money="+request.getParameter("VIPmoney"));
				HttpSession session = request.getSession();
				StudentBean student = (StudentBean)session.getAttribute("bean");
				MoneyBean moneybean = sql.money(student.getStudentid()+"");
				request.setAttribute("moneybean", moneybean);
				request.setAttribute("summoney", request.getParameter("VIPmoney"));
				session.setAttribute("summoney", request.getParameter("VIPmoney"));
				request.getRequestDispatcher("datainfo/fukuan.jsp").forward(request, response);
			}
		}
	}

}
