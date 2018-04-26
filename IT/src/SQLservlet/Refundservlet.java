package SQLservlet;

import java.io.IOException;
import java.util.List;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.bind.v2.model.core.ID;

import SQLBase.SQLSentenceimp;
import SQLBean.CourseBean;
import SQLBean.ForumBean;
import SQLBean.GreadBean;
import SQLBean.MoneyBean;
import SQLBean.MoneyRecordBean;
import SQLBean.PagingBean;
import SQLBean.PayRecordBean;
import SQLBean.Refund;
import SQLBean.StudentBean;
import SQLBean.TeacherBean;

public class Refundservlet extends HttpServlet {

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
			//学生新增退款申请
			if(order.equals("add")){
				String courseid = request.getParameter("courseid");
				String teacherid = request.getParameter("teacherid");
				String studentid = request.getParameter("studentid");
				String sectionid = request.getParameter("sectionid");
				String reason = request.getParameter("reason");
				Refund refund = new Refund();
				refund.setCourseid(Integer.parseInt(courseid));
				refund.setTeacherid(Integer.parseInt(teacherid));
				refund.setStudentid(Integer.parseInt(studentid));
				refund.setSectionid(Integer.parseInt(sectionid));
				refund.setStatus(0+"");
				refund.setReason(reason);
				sql.addfund(refund);
				sql.addteacherfund(refund);
				String payid = "0";
				if(request.getParameter("payrecodeid")!=null || !request.getParameter("payrecodeid").equals("")){
					payid = request.getParameter("payrecodeid");
				}
				sql.updatepaystatus(payid,"2");
				paginglist(request, response);
				request.getRequestDispatcher("data/refundmylist.jsp").forward(request,response);
			}else if (order.equals("refund")) {
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				String courseid = request.getParameter("courseid");
				String sectionid = request.getParameter("sectionid");
				String payrecodeid = request.getParameter("payrecodeid");
				request.setAttribute("payrecodeid", payrecodeid);
				//准备退款
				Refund refund = sql.findfund(courseid, sectionid);
				if(refund.getPicture_url()==null){
					CourseBean courseBean = sql.findcoursemanger(courseid);
					refund.setCourseid(Integer.parseInt(courseid));
					refund.setSectionid(Integer.parseInt(sectionid));
					refund.setCourse_name(courseBean.getCourse_name());
					refund.setPicture_url(courseBean.getPicture_url());
					refund.setCourseid(courseBean.getCourse_id());
					TeacherBean teacherBean = sql.findteacher(courseBean.getTeacher_id()+"");
					refund.setTeachername(teacherBean.getTeachername());
					refund.setTeacherid(teacherBean.getTeacherid());
					refund.setStudentid(studentBean.getStudentid());
				}
				if(refund.getStatus()!=null){
					if(refund.getStatus().equals("1")){
						sql.updatepaystatus(payrecodeid, "3");
					}
				}
				request.setAttribute("refund", refund);
				request.getRequestDispatcher("data/refundselect.jsp").forward(request,response);
			}else if (order.equals("mylist")) {
				paginglist(request, response);
				request.getRequestDispatcher("data/refundmylist.jsp").forward(request,response);
			}else if (order.equals("update")) {
				String refundid = request.getParameter("refundid");
				Refund refund = sql.updaterefund(refundid, "");
				request.setAttribute("refund", refund);
				request.getRequestDispatcher("data/refundupdate.jsp").forward(request,response);
			}else if (order.equals("updatesave")) {
				String courseid = request.getParameter("courseid");
				String refundid = request.getParameter("refundid");
				String teacherid = request.getParameter("teacherid");
				String studentid = request.getParameter("studentid");
				String sectionid = request.getParameter("sectionid");
				String reason = request.getParameter("reason");
				Refund refund = new Refund();
				refund.setCourseid(Integer.parseInt(courseid));
				refund.setTeacherid(Integer.parseInt(teacherid));
				refund.setStudentid(Integer.parseInt(studentid));
				refund.setSectionid(Integer.parseInt(sectionid));
				refund.setStatus(0+"");
				refund.setReason(reason);
				refund.setRefundid(Integer.parseInt(refundid));
				sql.updatesavefund(refund);
				paginglist(request, response);
				request.getRequestDispatcher("data/refundmylist.jsp").forward(request,response);
			}else if (order.equals("delete")) {
				String refundid = request.getParameter("refundid");
				sql.deletefund(refundid);
				paginglist(request, response);
				request.getRequestDispatcher("data/refundmylist.jsp").forward(request,response);
			}else if (order.equals("teacherrefundlist")) {
				paginglist1(request, response);
				request.getRequestDispatcher("data/refundteacherlist.jsp").forward(request,response);
			}else if (order.equals("refundteacher")) {
				String refundid = request.getParameter("refundid");
				Refund refund = sql.findteacherrefund(refundid);
				String studentname = sql.findstudentname(refund.getStudentid()+"");
				StudentBean studentBean = sql.findstudent(studentname);
				request.setAttribute("studentBean", studentBean);
				//准备退款
				request.setAttribute("refund", refund);
				request.getRequestDispatcher("data/refundteacherselect.jsp").forward(request,response);
			}else if (order.equals("teacherrefundupdate")) {
				String courseid = request.getParameter("courseid");
				String teacherid = request.getParameter("teacherid");
				String studentid = request.getParameter("studentid");
				String sectionid = request.getParameter("sectionid");
				String status = request.getParameter("status");
				String reason = request.getParameter("reason");
				String refundid = request.getParameter("refundid");
				Refund refund = new Refund();
				refund.setCourseid(Integer.parseInt(courseid));
				refund.setTeacherid(Integer.parseInt(teacherid));
				refund.setStudentid(Integer.parseInt(studentid));
				refund.setSectionid(Integer.parseInt(sectionid));
				refund.setStatus(status);
				refund.setReason(reason);
				refund.setRefundid(Integer.parseInt(refundid));
				sql.updatesaveteacherfund(refund);
				//同意退款
				/*	讲师操作
				 * 	<option value="1" selected="selected">同意退款</option>
		            <option value="2">拒绝退款</option>
		            <option value="3">退款驳回</option>
		            <option value="4">提交管理处理</option>
		            学生操作
		            <c:if test="${y.status==0}">
						正在退款
					</c:if>
					<c:if test="${y.status==1}">
						退款成功
					</c:if>
					<c:if test="${y.status==2}">
						退款失败
					</c:if>
					<c:if test="${y.status==3}">
						退款驳回
					</c:if>
					<c:if test="${y.status==4}">
						已提交管理员处理
					</c:if>
				 * */
				Refund r = sql.findfund(courseid, sectionid);
				refund.setRefundid(r.getRefundid());
				if(status.equals("1")){//同意退款
					refund.setStatus("1");
					CourseBean courseBean = sql.findcoursemanger(courseid);
					TeacherBean teacherBean = sql.findteacher(teacherid);
					String studentname = sql.findstudentname(studentid);
					StudentBean studentBean = sql.findstudent(studentname);	
					//获取价格
					float price = courseBean.getPrice()*(10-courseBean.getDiscount())/10;
					System.out.println(courseBean.getPrice()+"总金额");
					if(studentBean.getVIP()==1){
						price = price-5;
					}
					System.out.println(price+"=====price=====");
					sql.refundstudentmoney(studentid, price);
					sql.refundupdateteachermoney(price+"", teacherid);
					GreadBean greadBean = sql.findgreadname(teacherBean.getGradeid()+"");
					float money = (float)price*(greadBean.getGreadpercent())/10;
					System.out.println(greadBean.getGreadpercent()+"比例");
					System.out.println("money="+money);
					sql.refundpingtaiupdate(money+"");
					MoneyRecordBean  moneyrecordbean= new MoneyRecordBean();
					moneyrecordbean.setPay_money(price);
					moneyrecordbean.setUserid(studentBean.getStudentid());
					moneyrecordbean.setStatus(1);
					moneyrecordbean.setRemark("退款金额，请查收！");
					sql.moneyadd(moneyrecordbean);
				}else if (status.equals("2")) {//拒绝退款
					refund.setStatus("2");
				}else if (status.equals("3")) {//退款驳回
					refund.setStatus("3");
				}else if (status.equals("4")) {//提交管理处理
					refund.setStatus("4");
				}
				sql.updatesavefund(refund);
				paginglist1(request, response);
				request.getRequestDispatcher("data/refundteacherlist.jsp").forward(request,response);
			}else if (order.equals("managerrefundlist")) {
				paginglist2(request, response);
				request.getRequestDispatcher("data/refundmanagerlist.jsp").forward(request,response);
				
			}
		}
	}
	public void paginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		StudentBean studentBean = (StudentBean)session.getAttribute("bean");
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(13);
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cnt from refund where studentid="+studentBean.getStudentid()));
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
		List<Refund> refundlist = sql.refundlist(page.getPagebarsize(), page.getStarlocal(), " and r.studentid="+studentBean.getStudentid());
		if(refundlist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("refundlist", refundlist);
		request.setAttribute("pager", page);
	}
	public void paginglist1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherbean");
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(13);
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cnt from refundteacher where teacherid="+teacherBean.getTeacherid()));
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
		List<Refund> refundlist = sql.refundteacherlist(page.getPagebarsize(), page.getStarlocal(), " and r.teacherid="+teacherBean.getTeacherid());
		if(refundlist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("refundlist", refundlist);
		request.setAttribute("pager", page);
	}
	public void paginglist2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherbean");
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(13);
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cnt from refundteacher"));
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
		List<Refund> refundlist = sql.refundteacherlist(page.getPagebarsize(), page.getStarlocal(), "");
		if(refundlist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("refundlist", refundlist);
		request.setAttribute("pager", page);
	}
}
