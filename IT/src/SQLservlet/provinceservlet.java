package SQLservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SQLBase.SQLSentenceimp;
import SQLBean.PagingBean;
import SQLBean.Provincebean;

@SuppressWarnings("serial")
public class provinceservlet extends HttpServlet {

	SQLSentenceimp im = new SQLSentenceimp();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if (request.getParameter("order") != null) {
			String order = request.getParameter("order");
			if (order.equals("del")) {
				im.provincedel(Integer.parseInt(request.getParameter("provinceid")));
				list(request, response);
				request.getRequestDispatcher("data/provinceselect.jsp")
						.forward(request, response);
			} else if (order.equals("add")) {
				Provincebean provincebean = new Provincebean();
				provincebean.setProvinceName(new String(request.getParameter(
						"provincename").getBytes("iso-8859-1"), "utf-8"));
				im.provinceadd(provincebean);
				list(request, response);
				request.getRequestDispatcher("data/provinceselect.jsp")
						.forward(request, response);
			} else if (order.equals("update")) {
				Provincebean provincebean = new Provincebean();
				provincebean.setProvinceid(Integer.parseInt(request
						.getParameter("provinceid")));
				provincebean.setProvinceName(request.getParameter("provincename"));
				im.provinceupdate(provincebean);
				list(request, response);
				request.getRequestDispatcher("data/provinceselect.jsp")
						.forward(request, response);
			} else if (order.equals("list")) {
				list(request, response);
				request.getRequestDispatcher("data/provinceselect.jsp")
						.forward(request, response);
			} else if (order.equals("selectallcity")) {
				list(request, response);
				request.getRequestDispatcher("data/provinceselect.jsp")
						.forward(request, response);
			}
		}
	}

	public void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String handle = request.getParameter("handle");
		String currentpage = request.getParameter("currentpage");
		PagingBean page = new PagingBean();
		page.setPagebarsize(5);
		page.setPagebarsum(im.pagebarsum("province"));
		if (currentpage == null || currentpage.equals("")) {
			page.setCurrentpage(1);
		} else {
			page.setCurrentpage(Integer.parseInt(currentpage));
		}
		if (handle == null || handle.equals("")) {
			page.setHandle("first");
		} else {
			page.setHandle(handle);
		}
		String provincename = request.getParameter("provincename");
		System.out.println("provincename:"+provincename);
		request.setAttribute("provincename", provincename);
		List<Provincebean> provincelist = im.provincelist(page.getPagebarsize()
				,
				page.getStarlocal());
		request.setAttribute("provincelist", provincelist);
		request.setAttribute("pager", page);
	}
}
