package SQLservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SQLBase.SQLSentenceimp;
import SQLBean.Citybean;
import SQLBean.PagingBean;
import SQLBean.Provincebean;

@SuppressWarnings("serial")
public class cityservlet extends HttpServlet {
	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("order")!=null){
			String order = request.getParameter("order");
			if(order.equals("delete")){
			   	sql.citydel(Integer.parseInt(request.getParameter("cityid")));
			   	paginglist(request, response);
				request.getRequestDispatcher("data/cityselect.jsp").forward(request, response);
			}else if(order.equals("add")){
				List<Provincebean> provincelist = sql.provincelist();  
				request.setAttribute("provincelist", provincelist);
				request.getRequestDispatcher("data/cityadd.jsp").forward(request, response);
			}else if(order.equals("provinceadd")){
				Citybean citybean = new Citybean();
				citybean.setCityname(request.getParameter("cityname"));
				citybean.setProvinceid(Integer.parseInt(request.getParameter("provinceid")));
				sql.cityadd(citybean);
				paginglist(request, response);
				request.getRequestDispatcher("data/cityselect.jsp").forward(request, response);
			}else if(order.equals("list")){
				paginglist(request, response);
				request.getRequestDispatcher("data/cityselect.jsp").forward(request, response);
				
			}else if (order.equals("update")) {
				List<Provincebean> provincelist = sql.provincelist();
				request.setAttribute("provincelist", provincelist);
				String cityid = request.getParameter("cityid");
				Citybean citybean = sql.findcity(cityid);
				request.setAttribute("citybean", citybean);
				request.getRequestDispatcher("data/cityalter.jsp").forward(request, response);
			}else if (order.equals("provinceupdate")) {
				String cityid = request.getParameter("cityid");
				String cityname = request.getParameter("cityname");
				String provinceid = request.getParameter("provinceid");
				Citybean city = new Citybean();
				city.setCityid(Integer.parseInt(cityid));
				city.setCityname(cityname);
				city.setProvinceid(Integer.parseInt(provinceid));
				sql.cityupdate(city);
				paginglist(request, response);
				request.getRequestDispatcher("data/cityselect.jsp").forward(request, response);
			}
		}
	}
	public void paginglist(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(5);
		//总记录条数，计算总页数
		page.setPagebarsum(sql.pagebarsum("city"));
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
		List<Citybean> citylist = sql.citylist(page.getPagebarsize(), page.getStarlocal());
		request.setAttribute("citylist", citylist);
		request.setAttribute("pager", page);
	}

}
