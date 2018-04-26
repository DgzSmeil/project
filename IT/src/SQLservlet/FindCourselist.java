package SQLservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SQLBase.SQLSentenceimp;
import SQLBean.CourseBean;
import SQLBean.ForumBean;
import SQLBean.PagingBean;
import SQLBean.StudentBean;

public class FindCourselist extends HttpServlet {

	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String order = request.getParameter("order");
		if(order!=null){
			if(order.equals("list")){
				paginglist(request, response);
				request.getRequestDispatcher("datainfo/study.jsp").forward(request, response);
			}else if (order.equals("findprice")) {
				paginglist1(request, response);
				request.getRequestDispatcher("datainfo/study.jsp").forward(request, response);
			}else if (order.equals("findif")) {
				paginglist2(request, response);
				request.getRequestDispatcher("datainfo/study.jsp").forward(request, response);
				
			}
			
		}
	}
	public void paginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(15);
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cnt from course"));
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
			//当前页的操作
			page.setHandle("firstpage");
		} else {
			page.setHandle(handle);
		}
		List<CourseBean> courselist = sql.courselist( page.getPagebarsize(),page.getStarlocal());
		if(courselist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("courselist", courselist);
		request.setAttribute("pager", page);
	}
	public void paginglist1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(15);
		int startprice = Integer.parseInt(request.getParameter("startprice"));
		int endprice = Integer.parseInt(request.getParameter("endprice"));
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cnt from course where price>="+startprice+" and price<="+endprice));
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
			//当前页的操作
			page.setHandle("firstpage");
		} else {
			page.setHandle(handle);
		}
		String ifvalue = "where price>="+startprice+" and price<="+endprice;
		List<CourseBean> courselist = sql.findcourselist( page.getPagebarsize(),page.getStarlocal(),ifvalue);
		if(courselist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("courselist", courselist);
		request.setAttribute("pager", page);
	}
	public void paginglist2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(15);
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cnt from course"));
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
			//当前页的操作
			page.setHandle("firstpage");
		} else {
			page.setHandle(handle);
		}
		String ifvalue = request.getParameter("ifvalue");
		List<CourseBean> courselist=null;
		if(ifvalue!=null){
			if(ifvalue.equals("time")){
				courselist = sql.findcourselist( page.getPagebarsize(),page.getStarlocal()," order by replay_date desc");
			}else if (ifvalue.equals("price")) {
				courselist = sql.findcourselist( page.getPagebarsize(),page.getStarlocal()," order by price desc");
			}
		}
		if(courselist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("courselist", courselist);
		request.setAttribute("pager", page);
	}
}
