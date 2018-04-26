package SQLservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SQLBase.SQLSentenceimp;
import SQLBean.ExchangeRecordBean;
import SQLBean.PagingBean;
import SQLBean.TeacherBean;

public class Activeservlet extends HttpServlet {

	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		if(request.getParameter("order")!=null){
			String order = request.getParameter("order");
			if(order.equals("delete")){
			   	sql.activedel(request.getParameter("activeid"));
			   	paginglist(request, response);
				request.getRequestDispatcher("data/activeselect.jsp").forward(request, response);
			}else if(order.equals("activeadd")){
				TeacherBean teacherbean = (TeacherBean)session.getAttribute("teacherBean2");
				if(request.getParameter("activityname")==null || request.getParameter("activityname").equals("")){
					paginglist(request, response);
					request.getRequestDispatcher("data/activeselect.jsp").forward(request, response);
				}else {
					ExchangeRecordBean bean = new ExchangeRecordBean();
					bean.setActivity_desc(request.getParameter("activitydesc"));
					bean.setActivity_name(request.getParameter("activityname"));
					if(teacherbean==null){
						bean.setActivity_username(new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8"));
					}else {
						bean.setActivity_username(teacherbean.getTeachername());
					}
					sql.activeadd(bean);
					paginglist(request, response);
					request.getRequestDispatcher("data/activeselect.jsp").forward(request, response);
				}
				
			}else if(order.equals("list")){
				paginglist(request, response);
				request.getRequestDispatcher("data/activeselect.jsp").forward(request, response);
			}else if (order.equals("update")) {
				String activeid = request.getParameter("activeid");
				ExchangeRecordBean activebean = sql.findactivemanger(activeid);
				request.setAttribute("activebean", activebean);
				request.getRequestDispatcher("data/activealter.jsp").forward(request, response);
			}else if (order.equals("activeupdate")) {
				ExchangeRecordBean bean = new ExchangeRecordBean();
				bean.setActivity_id(Integer.parseInt(request.getParameter("activeid")));
				bean.setActivity_name(request.getParameter("activityname"));
				bean.setActivity_desc(request.getParameter("activitydesc"));
				bean.setActivity_username(request.getParameter("activityusername"));
				bean.setActivity_date(request.getParameter("activitydate"));
				sql.activeupdate(bean);
				paginglist(request, response);
				request.getRequestDispatcher("data/activeselect.jsp").forward(request, response);
			}
		}
	}
	public void paginglist(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session = request.getSession();
		//实例化javabean，取参数
		TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherbean");
		PagingBean page = new PagingBean();
		//总记录条数，计算总页数
		page.setPagebarsum(sql.pagebarsum("ExchangeRecord"));
		//当前页
		String currenpage = request.getParameter("currenpage");
		//操作
		String handle = request.getParameter("handle");
		if(currenpage==null || currenpage.equals("")){
			//当前页为第一页
			page.setCurrentpage(1);
		}else {
			page.setCurrentpage(Integer.parseInt(currenpage));
		}
		if(handle==null || handle.equals("")){
			//当前页的操作
			page.setHandle("firstpage");
		}else {
			page.setHandle(handle);
		}
		List<ExchangeRecordBean> activelist=null;
		if(teacherBean==null){
			activelist = sql.activelist(page.getPagebarsize(),page.getStarlocal(),new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8"));
		}else {
			activelist = sql.activelist(page.getPagebarsize(),page.getStarlocal(),teacherBean.getTeachername());
		}
		request.setAttribute("activelist", activelist);
		request.setAttribute("pager", page);
	}

}
