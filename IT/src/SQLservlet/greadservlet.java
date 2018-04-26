package SQLservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SQLBase.SQLSentenceimp;
import SQLBean.GreadBean;
import SQLBean.PagingBean;

public class greadservlet extends HttpServlet {

	SQLSentenceimp im = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("order")!=null){
			String order = request.getParameter("order");
			if(order.equals("list")){
				list(request, response);
				request.getRequestDispatcher("data/greadlist.jsp").forward(request, response);
			}else if (order.equals("delete")) {
				im.greaddel(request.getParameter("greadid"));
				list(request, response);
				request.getRequestDispatcher("data/greadlist.jsp").forward(request, response);
			}else if (order.equals("greadadd")) {
				GreadBean bean = new GreadBean();
				bean.setGreadpercent(Float.valueOf(request.getParameter("greadpercent")));
				bean.setGreadname(request.getParameter("greadname"));
				im.greadadd(bean);
				list(request, response);
				request.getRequestDispatcher("data/greadlist.jsp").forward(request, response);
			}else if (order.equals("greadupdate")) {
				GreadBean bean = new GreadBean();
				bean.setGreadid(Integer.parseInt(request.getParameter("greadid")));
				bean.setGreadpercent(Float.valueOf(request.getParameter("greadpercent")));
				bean.setGreadname(request.getParameter("greadname"));
				im.greadupdate(bean);
				list(request, response);
				request.getRequestDispatcher("data/greadlist.jsp").forward(request, response);
			}else if (order.equals("update")) {
				GreadBean greadbean = im.bean(request.getParameter("greadid"));
				request.setAttribute("greadbean", greadbean);
				list(request, response);
				request.getRequestDispatcher("data/greadupdate.jsp").forward(request, response);
			}
			
		}
			
	}

	public void list(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//实例化javabean，取参数
		PagingBean page = new PagingBean();
		//总记录条数，计算总页数
		page.setPagebarsum(im.pagebarsum("gread"));
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
		List<GreadBean> greadlist = im.greadlist(page.getPagebarsize(), page.getStarlocal());
		request.setAttribute("greadlist", greadlist);
		request.setAttribute("pager", page);
	}


}
