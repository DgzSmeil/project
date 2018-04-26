package SQLservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SQLBase.SQLSentenceimp;
import SQLBean.ExchangeCodeBean;
import SQLBean.ExchangeRecordBean;
import SQLBean.PagingBean;
import SQLBean.TeacherBean;

public class Exchangecodeservlet extends HttpServlet {
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
				sql.exchangecodedelete(request.getParameter("exchangecodeid"));
				paginglist(request, response);
				request.getRequestDispatcher("data/exchangecodeselect.jsp").forward(
						request, response);
			} else if (order.equals("add")) {
				List<ExchangeRecordBean> exchangerecodelist = sql.activelist();
				request.setAttribute("exchangerecodelist",exchangerecodelist );
				paginglist(request, response);
				request.getRequestDispatcher("data/exchangecodeadd.jsp").forward(
						request, response);
			} else if (order.equals("list")) {
				paginglist(request, response);
				request.getRequestDispatcher("data/exchangecodeselect.jsp").forward(
						request, response);

			} else if (order.equals("update")) {
				String activeid = request.getParameter("activeid");
				ExchangeRecordBean activebean = sql.findactivemanger(activeid);
				request.setAttribute("activebean", activebean);
				request.getRequestDispatcher("data/activealter.jsp").forward(
						request, response);
			} else if (order.equals("activeupdate")) {
				ExchangeRecordBean bean = new ExchangeRecordBean();
				bean.setActivity_id(Integer.parseInt(request
						.getParameter("activeid")));
				bean.setActivity_name(request.getParameter("activityname"));
				bean.setActivity_desc(request.getParameter("activitydesc"));
				bean.setActivity_username(request
						.getParameter("activityusername"));
				bean.setActivity_date(request.getParameter("activitydate"));
				sql.activeupdate(bean);
				paginglist(request, response);
				request.getRequestDispatcher("data/activeselect.jsp").forward(
						request, response);
			}else if (order.equals("addsave")) {
				TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherbean");
				String codemoney = request.getParameter("codemoney");
				if(codemoney==null || codemoney.equals("")){
					paginglist(request,response);
					request.getRequestDispatcher("data/exchangecodeselect.jsp").forward(
							request, response);
				}else {
					ExchangeCodeBean codeBean = new ExchangeCodeBean();
					String date = request.getParameter("codedate");
					String codenum = request.getParameter("codenum");
					String activeid = request.getParameter("activityid");
					codeBean.setActivityid(Integer.parseInt(activeid));
					codeBean.setExchangemeony(Integer.parseInt(codemoney));
					if(teacherBean==null){
						codeBean.setReplayname(new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8"));
					}else {
						codeBean.setReplayname(teacherBean.getTeachername());
					}
					codeBean.setDate(date);
					sql.exchangecodeadd(codeBean,Integer.parseInt(codenum));
					paginglist(request, response);
					request.getRequestDispatcher("data/exchangecodeselect.jsp").forward(
							request, response);
				}
				
			}else if (order.equals("updatestatus")) {
				String exchangecodeid = request.getParameter("exchangecodeid");
				sql.exchangecodeupdatestatus("3", exchangecodeid);
				paginglist(request,response);
				request.getRequestDispatcher("data/exchangecodeselect.jsp").forward(
						request, response);
			}
		}
	}

	public void paginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherbean");
		String acticityid = request.getParameter("activityid");
		request.setAttribute("acticityid", acticityid);
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(6);
		// 总记录条数，计算总页数
		if(teacherBean==null){
			page.setPagebarsum(sql.barsum("select count(*) from ExchangeCode where replayusername='"+new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8")+"' and activityid="+acticityid));
		}else {
			page.setPagebarsum(sql.barsum("select count(*) from ExchangeCode where replayusername='"+teacherBean.getTeachername()+"' and activityid="+acticityid));
		}
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
		List<ExchangeCodeBean> exchangecodelist=null;
		if(teacherBean==null){
			exchangecodelist = sql.myecodelist1(page.getPagebarsize(), page.getStarlocal(),new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8"),Integer.parseInt(acticityid));
		}else {
			exchangecodelist = sql.myecodelist1(page.getPagebarsize(), page.getStarlocal(),teacherBean.getTeachername(),Integer.parseInt(acticityid));
		}
		request.setAttribute("exchangecodelist", exchangecodelist);
		request.setAttribute("pager", page);
	}

}
