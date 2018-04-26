package SQLservlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import SQLBean.VIPBean;

public class VIPServlet extends HttpServlet {

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
				paginglist(request, response);
				request.getRequestDispatcher("data/viplist.jsp").forward(request, response);
			}else if(order.equals("delete")){
				String vipid = request.getParameter("VIPid");
				sql.delvip(vipid);
				paginglist(request, response);
				request.getRequestDispatcher("data/viplist.jsp").forward(request, response);
			}else if (order.equals("add")) {
				String VIPleibie = request.getParameter("VIPleibie");
				String VIPmoney = request.getParameter("VIPmoney");
				String VIPsell = request.getParameter("VIPsell");
				String VIPsrcmoney = request.getParameter("VIPsrcmoney");
				VIPBean vipbean = new VIPBean();
				vipbean.setVIPleibie(VIPleibie);
				vipbean.setVIPmoney(Integer.parseInt(VIPmoney));
				vipbean.setVIPsell(Integer.parseInt(VIPsell));
				vipbean.setVIPsrcmoney(Integer.parseInt(VIPsrcmoney));
				sql.addvip(vipbean);
				paginglist(request, response);
				request.getRequestDispatcher("data/viplist.jsp").forward(request, response);
			}else if (order.equals("updatesave")) {
				String VIPleibie = request.getParameter("VIPleibie");
				String VIPmoney = request.getParameter("VIPmoney");
				String VIPsell = request.getParameter("VIPsell");
				String VIPid = request.getParameter("VIPid");
				String VIPsrcmoney = request.getParameter("VIPsrcmoney");
				VIPBean vipbean = new VIPBean();
				vipbean.setVIPid(Integer.parseInt(VIPid));
				vipbean.setVIPleibie(VIPleibie);
				vipbean.setVIPmoney(Integer.parseInt(VIPmoney));
				vipbean.setVIPsell(Integer.parseInt(VIPsell));
				vipbean.setVIPsrcmoney(Integer.parseInt(VIPsrcmoney));
				sql.updatevip(vipbean);
				paginglist(request, response);
				request.getRequestDispatcher("data/viplist.jsp").forward(request, response);
			}else if (order.equals("update")) {
				VIPBean viBean = new VIPBean();
				viBean = sql.findvip(request.getParameter("VIPid"));
				request.setAttribute("viBean", viBean);
				paginglist(request, response);
				request.getRequestDispatcher("data/vipupdate.jsp").forward(request, response);
			}
			
		}
	}
	public void paginglist(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		PagingBean page = new PagingBean();
		//总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cnt from VIP"));
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
		List<VIPBean> viplist=sql.viplist(page.getPagebarsize(), page.getStarlocal());
		request.setAttribute("viplist", viplist);
		request.setAttribute("pager", page);
	}

}
