package SQLservlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import SQLBase.SQLSentenceimp;
import SQLBean.CourseBean;
import SQLBean.MoneyBean;
import SQLBean.PagingBean;
import SQLBean.PayRecordBean;
import SQLBean.StudentBean;
import SQLBean.TeacherBean;
import SQLBean.UserCourseEvalBean;
import SQLup.Filename;

public class Courseservlet extends HttpServlet {
	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (request.getParameter("order") != null) {
			String order = request.getParameter("order");
			if (order.equals("list")) {
				paginglist(request, response);
				request.getRequestDispatcher("data/courselist.jsp").forward(
						request, response);
			} else if (order.equals("delete")) {
				sql.coursedel(request.getParameter("courseid"));
				request.setAttribute("name",new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8"));
				mylist(request, response);
				request.getRequestDispatcher("data/mycourselist.jsp").forward(
						request, response);
			} else if (order.equals("add")) {
				MultipartRequest mr = null;
				String path = getServletContext().getRealPath("/")+"upfile"; 
				File file = new File(path);
				if (!file.exists()) {
					file.mkdir();
				}
				int fileupsize = 10*1024*1024;
				int filecount=0;
				String fileName=null;
				Filename filename = new Filename();
				CourseBean bean = new CourseBean();
				TeacherBean teacherbean=(TeacherBean)session.getAttribute("teacherBean2");
				try {
					mr = new MultipartRequest(request,path,fileupsize,"utf-8",filename);
					String coursename = mr.getParameter("coursename");
					String courseword = mr.getParameter("courseword");
					String courseindex = mr.getParameter("courseindex");
					String coursetime = mr.getParameter("coursetime");
					String courseprice = mr.getParameter("courseprice");
					String discount = mr.getParameter("discount");
					String isactive = mr.getParameter("isactive");
					String xuhao = mr.getParameter("xuhao");
					String isfree = mr.getParameter("isfree");
					Enumeration filesname = mr.getFileNames();   
			        while (filesname.hasMoreElements()) {  
			            String name = (String) filesname.nextElement();  
			            fileName = mr.getFilesystemName(name); 
			            String contentType = mr.getContentType(name);
			            if (fileName != null) {  
			                filecount++;  
			            }  
			            System.out.println("文件名：" + fileName);  
			            System.out.println("文件类型： " + contentType);   
			            //out.println("<img src='upfile/"+fileName+"' />");
			        } 
			        bean.setCourse_name(coursename);
			        bean.setPicture_url("upfile/"+fileName);
			        bean.setOne_word(courseword);
			        bean.setIntroduce(courseindex);
			        bean.setTeacher_id(teacherbean.getTeacherid());
			        bean.setCourse_count(Integer.parseInt(coursetime));
			        bean.setPrice(Float.parseFloat(courseprice));
			        bean.setDiscount(Float.parseFloat(discount));
			        bean.setEffective(Integer.parseInt(isactive));
			        bean.setReplay_username(teacherbean.getTeachername());
			        bean.setSeq(Integer.parseInt(xuhao));
			        bean.setStatus(0);
			        bean.setReason("未审核");
			        bean.setIsmoney(Integer.parseInt(isfree));
			        sql.courseadd(bean);
				} catch (Exception e) {
					request.setAttribute("msg", "上传失败！文件大小只能是3M以下！");
					request.getRequestDispatcher("T12doc/fileup.jsp").forward(request, response);
					return;
				}
				request.setAttribute("msg", "上传成功！");
				mylist(request, response);
				request.setAttribute("name", teacherbean.getTeachername());
				request.getRequestDispatcher("data/mycourselist.jsp").forward(
						request, response);
			} else if (order.equals("addsave")) {
				paginglist(request, response);
				request.getRequestDispatcher("data/studentselect.jsp").forward(
						request, response);
			} else if (order.equals("update")) {
				String courseid = request.getParameter("courseid");
				CourseBean coursebean = sql.findcoursemanger(courseid);
				request.setAttribute("coursebean", coursebean);
				request.getRequestDispatcher("data/courseupdate.jsp").forward(
						request, response);
 			} else if (order.equals("mycourselist")) {
				mylist(request, response);
				request.setAttribute("name",new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8") );
				request.getRequestDispatcher("data/mycourselist.jsp").forward(
						request, response);
			}else if (order.equals("shenhe")) {
				String courseid = request.getParameter("courseid");
				request.setAttribute("msg", "你的章节视频审核请求已经提交！");
				sql.updatecoursestatus(courseid, "1", "请求审核。。。。。");
				mylist(request, response);
				request.getRequestDispatcher("data/mycourselist.jsp").forward(
						request, response);
			}else if (order.equals("across")) {
				String courseid = request.getParameter("courseid");
				sql.updatecoursestatus(courseid, request.getParameter("status"), request.getParameter("reason"));
				paginglist(request, response);
				request.getRequestDispatcher("data/courselist.jsp").forward(
						request, response);
			}else if(order.equals("pingjia")){
				String coursename = request.getParameter("coursename");
				String url = request.getParameter("url");
				int fenshu1=Integer.parseInt(request.getParameter("fengshu1"));
				int fenshu2=Integer.parseInt(request.getParameter("fengshu2"));
				int fenshu3=Integer.parseInt(request.getParameter("fengshu3"));
				String msg = request.getParameter("msg");
				CourseBean coursebean = sql.findcoursename(coursename);
				PayRecordBean payrecordbean = sql.findcode(coursebean.getCourse_id()+"");
				UserCourseEvalBean codebean = new UserCourseEvalBean();
				codebean.setUserid(payrecordbean.getStudentid());
				codebean.setEvalcontent(msg);
				codebean.setEvallevel((int)(fenshu1+fenshu2+fenshu3)/3);
				codebean.setCourseid(coursebean.getCourse_id());
				UserCourseEvalBean pingjiabean = sql.findcode(payrecordbean.getStudentid()+"", coursebean.getCourse_id()+"");
				if(pingjiabean.getEvalcontent()==null || pingjiabean.getEvalcontent().equals("")){
					sql.pingjiaadd(codebean);
					request.setAttribute("msg", "评价成功！");
					String  studentname = sql.findstudentname(request.getParameter("studentid"));
					StudentBean bean = sql.findstudent(studentname);
					session.setAttribute("bean", bean);
					MoneyBean moneybean = sql.money(bean.getStudentid()+"");
					request.setAttribute("moneybean", moneybean);
					session.setAttribute("moneybean", moneybean);
					request.getRequestDispatcher("datainfo/main.jsp").forward(request, response);
				}else {
					request.setAttribute("msg", "一个用户只能评价一次！你已经评价过");
					String  studentname = sql.findstudentname(request.getParameter("studentid"));
					StudentBean bean = sql.findstudent(studentname);
					session.setAttribute("bean", bean);
					MoneyBean moneybean = sql.money(bean.getStudentid()+"");
					request.setAttribute("moneybean", moneybean);
					session.setAttribute("moneybean", moneybean);
					request.getRequestDispatcher("datainfo/main.jsp").forward(request, response);
				}
				
			}else if(order.equals("updatesave")){
				MultipartRequest mr = null;
				String path = getServletContext().getRealPath("/")+"upfile"; 
				File file = new File(path);
				if (!file.exists()) {
					file.mkdir();
				}
				int fileupsize = 10*1024*1024;
				int filecount=0;
				String fileName=null;
				Filename filename = new Filename();
				CourseBean bean = new CourseBean();
				try {
					mr = new MultipartRequest(request,path,fileupsize,"utf-8",filename);
					String coursename = mr.getParameter("coursename");
					String courseword = mr.getParameter("courseword");
					String courseindex = mr.getParameter("courseindex");
					String coursetime = mr.getParameter("coursetime");
					String courseprice = mr.getParameter("courseprice");
					String discount = mr.getParameter("discount");
					String isactive = mr.getParameter("isactive");
					String xuhao = mr.getParameter("xuhao");
					String isfree = mr.getParameter("isfree");
					String teacherid = mr.getParameter("teacherid"); 
					String teachername = mr.getParameter("teachername"); 
					Enumeration filesname = mr.getFileNames();   
			        while (filesname.hasMoreElements()) {  
			            String name = (String) filesname.nextElement();  
			            fileName = mr.getFilesystemName(name); 
			            String contentType = mr.getContentType(name);
			            if (fileName != null) {  
			                filecount++;  
			            }
			            System.out.println("文件名：" + fileName);  
			            System.out.println("文件类型： " + contentType);   
			        } 
			        bean.setCourse_name(coursename);
			        if(fileName==null || fileName.equals("")){
			        	bean.setPicture_url(mr.getParameter("url"));
			        }else {
			        	bean.setPicture_url("upfile/"+fileName);
					}
			        bean.setCourse_id(Integer.parseInt(mr.getParameter("courseid")));
			        bean.setOne_word(courseword);
			        bean.setIntroduce(courseindex);
			        bean.setTeacher_id(Integer.parseInt(teacherid));
			        bean.setCourse_count(Integer.parseInt(coursetime));
			        bean.setPrice(Float.parseFloat(courseprice));
			        bean.setDiscount(Float.parseFloat(discount));
			        bean.setEffective(Integer.parseInt(isactive));
			        bean.setSeq(Integer.parseInt(xuhao));
			        bean.setStatus(0);
			        bean.setReason("提交审核成功。。。。");
			        bean.setReplay_date(new Date().toLocaleString());
			        bean.setIsmoney(Integer.parseInt(isfree));
			        bean.setTeacher_id(Integer.parseInt(teacherid));
			        bean.setReplay_username(teachername);
			        request.setAttribute("msg", "课程审核提交成功！");
			        sql.courseupdate(bean);
				} catch (Exception e) {
					e.printStackTrace();
				}
				mylist(request, response);
				request.setAttribute("name", mr.getParameter("teachername"));
				request.getRequestDispatcher("data/mycourselist.jsp").forward(
						request, response);
			}else if (order.equals("shenhecourse")) {
				String courseid = request.getParameter("courseid");
				CourseBean coursebean = sql.findcoursemanger(courseid);
				request.setAttribute("coursebean", coursebean);
				request.getRequestDispatcher("data/shenhecourse.jsp").forward(
						request, response);
			}else if (order.equals("coursesousuo")) {
				mylist1(request, response);
				request.getRequestDispatcher("data/mycourselist.jsp").forward(
						request, response);
			}
		}
	}
	public void paginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) from course"));
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
		List<CourseBean> courselist = sql.courselist(page.getPagebarsize(),
				page.getStarlocal());
		if(courselist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("courselist", courselist);
		request.setAttribute("pager", page);
	}
	public void mylist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherBean2");
//		String username=null;
//		if(teacherBean==null){
//			String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
//			if(name==null){
//				name = request.getAttribute("name").toString();
//			}
//			username = name;
//		}else {
//			username = teacherBean.getTeachername();
//		}
//		System.out.println("username=="+username);
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) from course where teacher_id="+teacherBean.getTeacherid()));
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
		System.out.println("usernmae="+teacherBean.getTeachername());
		List<CourseBean> mycourserlist = sql.courselist(teacherBean.getTeachername(),page.getPagebarsize(),
				page.getStarlocal());
		if(mycourserlist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("mycourserlist", mycourserlist);
		request.setAttribute("pager", page);
	}
	public void mylist1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String word = request.getParameter("keywords");
		HttpSession session = request.getSession();
		TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherBean2");
//		String username=null;
//		if(teacherBean==null){
//			String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
//			if(name==null){
//				name = request.getAttribute("name").toString();
//			}
//			username = name;
//		}else {
//			username = teacherBean.getTeachername();
//		}
//		System.out.println("username=="+username);
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) from course where replay_username='"+teacherBean.getTeachername()+"' and course_name like '%"+word+"%'"));
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
		System.out.println("usernmae="+teacherBean.getTeachername());
		List<CourseBean> mycourserlist = sql.courselist(teacherBean.getTeachername(),page.getPagebarsize(),
				page.getStarlocal(),word);
		if(mycourserlist.size()==0){
			request.setAttribute("msg","对不起！没有与"+word+"相符合的课程名称试试其他的");
			page.setCurrentpage(0);
		}
		request.setAttribute("mycourserlist", mycourserlist);
		request.setAttribute("pager", page);
	}
}
