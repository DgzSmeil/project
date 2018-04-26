package SQLservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SQLBase.SQLSentenceimp;
import SQLBean.MoneyBean;
import SQLBean.MoneyRecordBean;
import SQLBean.PagingBean;
import SQLBean.StudentBean;

public class Moneyservlet extends HttpServlet {

	SQLSentenceimp sql = new SQLSentenceimp();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		if (request.getParameter("order") != null) {
			String order = request.getParameter("order");
			if (order.equals("delete")) {
				sql.moneydel(request.getParameter("recordid"));
				String name = request.getParameter("username");
				paginglist(request, response);
				request.getRequestDispatcher(
						"data/moneyselect.jsp?username=" + name).forward(
						request, response);
			} else if (order.equals("add")) {
				StudentBean studentBean = (StudentBean) session
						.getAttribute("bean");
				String userid = studentBean.getStudentid() + "";
				String money = request.getParameter("money");
				MoneyBean bean = sql.money(userid);
				if (bean.getUserid() != Integer.parseInt(userid)) {
					sql.insertmoney(money + "", Integer.parseInt(userid),
							"23913B3D8C1251FB57ACBD565F07FDDC");
				} else {
					sql.updatemoney(money + "", Integer.parseInt(userid));
				}
				System.out.println(money);
				MoneyRecordBean moneybean1 = new MoneyRecordBean();
				moneybean1.setUserid(Integer.parseInt(userid));
				moneybean1.setPay_money(Float.parseFloat(money));
				moneybean1.setStatus(0);
				moneybean1.setRemark("普通充值");
				sql.moneyadd(moneybean1);
				request.setAttribute("msg", "恭喜你充值成功！");
				MoneyBean moneybean = sql.money(userid);
				request.setAttribute("moneybean", moneybean);
				request.setAttribute("userid", moneybean.getUserid());
				request.getRequestDispatcher("datainfo/main.jsp").forward(
						request, response);
			} else if (order.equals("list")) {
				paginglist(request, response);
				request.getRequestDispatcher("data/moneyselect.jsp").forward(
						request, response);
			} else if (order.equals("teachermoney")) {

			} else if (order.equals("findmymoney")) {
				findpaginglist(request, response);
				request.getRequestDispatcher("data/moneyselect.jsp").forward(
						request, response);
			}
		}
	}

	public void paginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		StudentBean studentBean = (StudentBean) session.getAttribute("bean");
		// 总记录条数，计算总页数
		page.setPagebarsum(sql
				.barsum("select count(*) from moneyrecord where userid="
						+ studentBean.getStudentid()));
		// 当前页
		String currenpage = request.getParameter("currenpage");
		// 操作
		String handle = request.getParameter("handle");
		if (currenpage == null || currenpage.equals("")) {
			// 当前页为第一页
			page.setCurrentpage(1);
		} else {
			page.setCurrentpage(Integer.parseInt(currenpage));
		}
		if (handle == null || handle.equals("")) {
			// 当前页的操作
			page.setHandle("firstpage");
		} else {
			page.setHandle(handle);
		}
		List<MoneyRecordBean> moneylist = sql.moneylist(page.getPagebarsize(),
				page.getStarlocal(), studentBean.getStudentid()+"");
		request.setAttribute("moneylist", moneylist);
		StudentBean student = sql.findstudent(studentBean.getStudentname());
		request.setAttribute("userid", student.getStudentid());
		request.setAttribute("pager", page);
	}
	public void findpaginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		StudentBean studentBean = (StudentBean) session.getAttribute("bean");
		// 总记录条数，计算总页数
		String ifvalue = request.getParameter("ifvalue");
		String ifvalues = "";
		//代表的是本周
		if(ifvalue.equals("week")){
			ifvalues = "and pay_date between to_date('2017-06-12 00:00:00','YYYY-MM-DD HH24:MI:SS') and to_date('2017-06-17 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			request.setAttribute("starttime", "2017-06-12 00:00:00");
			request.setAttribute("endtime", "2017-06-17 23:59:59");
		}else if(ifvalue.equals("month")){
			ifvalues = "and pay_date between to_date('2017-06-01 00:00:00','YYYY-MM-DD HH24:MI:SS') and to_date('2017-06-30 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			request.setAttribute("starttime", "2017-06-01 00:00:00");
			request.setAttribute("endtime", "2017-06-30 23:59:59");
		}else if(ifvalue.equals("months")){
			ifvalues = "and pay_date between to_date('2017-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS') and to_date('2017-06-30 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			request.setAttribute("starttime", "2017-04-01 00:00:00");
			request.setAttribute("endtime", "2017-06-30 23:59:59");
		}else if(ifvalue.equals("year")){
			ifvalues = "and pay_date between to_date('2017-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS') and to_date('2019-12-31 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			request.setAttribute("starttime", "2017-01-01 00:00:00");
			request.setAttribute("endtime", "2019-12-31 23:59:59");
		}else if(ifvalue.equals("input")){
			String starttime = request.getParameter("starttime");
			String endtime = request.getParameter("endtime");
			ifvalues = "and pay_date between to_date('"+starttime+"','YYYY-MM-DD HH24:MI:SS') and to_date('"+endtime+"','YYYY-MM-DD HH24:MI:SS')";
			request.setAttribute("starttime", starttime);
			request.setAttribute("endtime", endtime);
		}
		page.setPagebarsum(sql.barsum("select count(*) from moneyrecord where userid="+ studentBean.getStudentid()+ifvalues));
		// 当前页
		String currenpage = request.getParameter("currenpage");
		// 操作
		String handle = request.getParameter("handle");
		if (currenpage == null || currenpage.equals("")) {
			// 当前页为第一页
			page.setCurrentpage(1);
		} else {
			page.setCurrentpage(Integer.parseInt(currenpage));
		}
		if (handle == null || handle.equals("")) {
			// 当前页的操作
			page.setHandle("firstpage");
		} else {
			page.setHandle(handle);
		}
		
		List<MoneyRecordBean> moneylist = sql.findmoneylist(page.getPagebarsize(),
				page.getStarlocal(), studentBean.getStudentid()+"",ifvalues);
		if(moneylist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("moneylist", moneylist);
		StudentBean student = sql.findstudent(studentBean.getStudentname());
		request.setAttribute("pager", page);
	}
}
