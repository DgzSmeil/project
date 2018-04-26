package SQLservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SQLBase.SQLSentenceimp;
import SQLBean.CashRecordBean;
import SQLBean.CourseBean;
import SQLBean.ExchangeRecordBean;
import SQLBean.GreadBean;
import SQLBean.MoneyBean;
import SQLBean.PagingBean;
import SQLBean.PayRecordBean;
import SQLBean.StudentBean;
import SQLBean.TeacherBean;
import SQLBean.TeacherMoneyBean;

public class payrecodeservlet extends HttpServlet {
	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		if (request.getParameter("order") != null) {
			String order = request.getParameter("order");
			if (order.equals("delete")) {
				sql.payrecodedelete(request.getParameter("payrecodeid"));
				paginglist1(request, response);
				request.getRequestDispatcher("data/payrecodeteacherlist.jsp").forward(
						request, response);
			} else if (order.equals("activeadd")) {
				ExchangeRecordBean bean = new ExchangeRecordBean();
				bean.setActivity_date(request.getParameter("activitydate"));
				bean.setActivity_desc(request.getParameter("activitydesc"));
				bean.setActivity_name(request.getParameter("activityname"));
				bean.setActivity_username(request
						.getParameter("activityusername"));
				sql.activeadd(bean);
				paginglist(request, response);
				request.getRequestDispatcher("data/activeselect.jsp").forward(
						request, response);
			} else if (order.equals("deleteid")) {
				sql.payrecodedelete(request.getParameter("payrecodeid"));
				paginglist(request, response);
				request.getRequestDispatcher("data/payrecodelist.jsp").forward(
						request, response);
			}else if (order.equals("list")) {
				paginglist(request, response);
				request.getRequestDispatcher("data/payrecodelist.jsp").forward(
						request, response);
			}else if (order.equals("findstudentcourse")) {
				findpaginglist(request, response);
				request.getRequestDispatcher("data/payrecodelist.jsp").forward(
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
			}else if (order.equals("tixian")) {
				TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherBean2");
				int teacherid=0;
				if(teacherBean==null){
					teacherid = Integer.parseInt(request.getParameter("teacherid"));
				}else {
					teacherid = teacherBean.getTeacherid();
				}
				request.setAttribute("teacherid", teacherid);
				paginglist1(request, response);
				request.getRequestDispatcher("data/payrecodeteacherlist.jsp").forward(
						request, response);
			}else if (order.equals("mymoney")) {
				TeacherBean teacherbean = (TeacherBean)session.getAttribute("teacherBean2");
				TeacherMoneyBean teacherMoneyBean=null;
				if(teacherbean==null){
					teacherMoneyBean = sql.teacherbeanlist(request.getParameter("teacherid"));
				}else {
					teacherMoneyBean = sql.teacherbeanlist(teacherbean.getTeacherid()+"");
				}
				request.setAttribute("teacherMoneyBean", teacherMoneyBean);
				TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherBean2");
				int teacherid=0;
				if(teacherBean==null){
					teacherid = Integer.parseInt(request.getParameter("teacherid"));
				}else {
					teacherid = teacherBean.getTeacherid();
				}
				request.setAttribute("teacherid", teacherid);
				paginglist1(request, response);
				request.getRequestDispatcher("data/yuer.jsp").forward(
						request, response);
			}else if (order.equals("mymoney1")) {
				TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherbean");
				StudentBean student = sql.findstudentinfo(teacherBean.getTeachermobile());
				MoneyBean teacherMoneyBean = sql.money(student.getStudentid()+"");
				request.setAttribute("teacherMoneyBean", teacherMoneyBean);
				request.getRequestDispatcher("data/teacheryuer.jsp").forward(
						request, response);
			}else if (order.equals("shenqingtixian")) {
				String recode = request.getParameter("payrecodeid");
				sql.payrecodeupdate("2", recode);
				request.setAttribute("msg", "申请提现成功!");
				paginglist1(request, response);
				request.getRequestDispatcher("data/payrecodeteacherlist.jsp").forward(
						request, response);
			}else if (order.equals("tixianpass")) {
				paginglist2(request, response);
				request.getRequestDispatcher("data/payrecodemanagerlist.jsp").forward(
						request, response);
			}else if (order.equals("tixianinfo")) {
				String payrecodeid = request.getParameter("payrecodeid");
				sql.payrecodeupdate("1", payrecodeid);
				PayRecordBean paybean = sql.findpayrecode(payrecodeid);
				session.setAttribute("paybean", paybean);
				CashRecordBean cashbean = new CashRecordBean();
				cashbean.setUserid(paybean.getStudentid());
				cashbean.setTeacherid(paybean.getTeacher_id());
				cashbean.setStatus(1);
				cashbean.setReason("恭喜你！审核通过。。");
				cashbean.setPaymoney(paybean.getPaymoney());
				GreadBean greadBean = sql.findgreadname(paybean.getGreadid()+"");
				float bili = greadBean.getGreadpercent();
				float money = paybean.getPaymoney()*bili;
				String pingtai = sql.pingtai();
				if(pingtai==null || pingtai.equals("")){
					sql.pingtaiadd(money+"");
				}else {
					sql.pingtaiupdate(money+"");
				}
				cashbean.setIncommoney(0);
				cashbean.setTeacherid(paybean.getTeacher_id());
				sql.cashrecordadd(cashbean);
				sql.updateteachermoney((paybean.getPaymoney()-money)+"", paybean.getTeacher_id()+"");
				paginglist2(request, response);
				request.getRequestDispatcher("data/payrecodemanagerlist.jsp").forward(
						request, response);
			}else if (order.equals("tixianinfo1")) {
				String payrecodeid = request.getParameter("payrecodeid");
				sql.payrecodeupdate("3", payrecodeid);
				PayRecordBean paybean = sql.findpayrecode(payrecodeid);
				session.setAttribute("paybean", paybean);
				CashRecordBean cashbean = new CashRecordBean();
				cashbean.setUserid(paybean.getStudentid());
				cashbean.setTeacherid(paybean.getTeacher_id());
				cashbean.setStatus(2);
				cashbean.setReason("很遗憾！审核不通过。。");
				cashbean.setPaymoney(paybean.getPaymoney());
				GreadBean greadBean = sql.findgreadname(paybean.getGreadid()+"");
				float bili = greadBean.getGreadpercent();
				float money = paybean.getPaymoney()*bili;
				cashbean.setIncommoney(money);
				cashbean.setTeacherid(paybean.getTeacher_id());
				sql.cashrecordadd(cashbean);
				paginglist2(request, response);
				request.getRequestDispatcher("data/payrecodemanagerlist.jsp").forward(
						request, response);
			}
		}
	}

	public void paginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		StudentBean studentBean = (StudentBean)session.getAttribute("bean");
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) from payrecord p,course c,section s where p.courseid=c.course_id and  paystatus<>0  and studentid="+studentBean.getStudentid()+" and p.courseid=s.courseid "));
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
		List<PayRecordBean> paylist = sql.payrecodelist(10, page.getStarlocal(), "0",studentBean.getStudentid());
		request.setAttribute("paylist", paylist);
		session.setAttribute("paylist", paylist);
		request.setAttribute("pager", page);
	}
	public void paginglist1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherBean2");
		CourseBean courseBean=null;
		if(teacherBean==null){
			courseBean = sql.findcourse(request.getParameter("teacherid"));
		}else {
			courseBean = sql.findcourse(teacherBean.getTeacherid()+"");
		}
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.payrecodebarsum("1","courseid",courseBean.getCourse_id()+""));
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
		List<PayRecordBean> paylist = sql.payrecodelist(page.getPagebarsize(), page.getStarlocal(), "1",courseBean.getCourse_id()+"");
		request.setAttribute("paylist", paylist);
		session.setAttribute("paylist", paylist);
		request.setAttribute("pager", page);
	}
	public void paginglist2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(5);
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.payrecodebarsum("1","iscash","2"));
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
		List<PayRecordBean> paylist = sql.payrecodetixian(page.getPagebarsize(), page.getStarlocal(), "2","1");
		request.setAttribute("paylist", paylist);
		session.setAttribute("paylist", paylist);
		request.setAttribute("pager", page);
	}
	public void findpaginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		StudentBean studentBean = (StudentBean)session.getAttribute("bean");
		String name = new String(request.getParameter("key").getBytes("iso-8859-1"),"utf-8");
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) from payrecord p,course c,section s where p.courseid=c.course_id and  paystatus=1  and studentid="+studentBean.getStudentid()+" and p.courseid=s.courseid and course_name like '%"+name+"%' or sectionname like '%"+name+"%'"));
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
		List<PayRecordBean> paylist = sql.findpayrecodelist(10, page.getStarlocal(), "1",studentBean.getStudentid(),"  course_name like '%"+name+"%' or sectionname like '%"+name+"%' ");
		if(paylist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("paylist", paylist);
		session.setAttribute("paylist", paylist);
		request.setAttribute("pager", page);
	}

}
