package SQLservlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import SQLBase.AesUtils;
import SQLBase.SQLSentenceimp;
import SQLBean.CourseBean;
import SQLBean.JifenBean;
import SQLBean.ManagerBean;
import SQLBean.PagingBean;
import SQLBean.SectionBean;
import SQLBean.TeacherBean;
import SQLBean.UserCourseEvalBean;
import SQLup.Filename;

public class Sectionservlet extends HttpServlet {
	SQLSentenceimp sql = new SQLSentenceimp();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session  = request.getSession();
		if(request.getParameter("order")!=null){
			String order = request.getParameter("order");
			if(order.equals("delete")){
			   	sql.sectiondel(request.getParameter("sectionid"));
			   	paginglist(request, response);
				request.getRequestDispatcher("data/sectionselect.jsp").forward(request, response);
			}else if(order.equals("add")){
				List<CourseBean> courselist = sql.courselist();
				request.setAttribute("courselist", courselist);
				request.setAttribute("courseid", request.getParameter("courseid"));
				request.getRequestDispatcher("data/sectionadd.jsp").forward(request, response);
			}else if(order.equals("list")){
				paginglist(request, response);
				System.err.println("===========");
				request.getRequestDispatcher("data/sectionselect.jsp").forward(request, response);
			}else if(order.equals("addsave")){
				MultipartRequest mr = null;
				String path = getServletContext().getRealPath("/")+"upvedio"; 
				File file = new File(path);
				if (!file.exists()) {
					file.mkdir();
				}
				int fileupsize = 1024*1024*1024;
				int filecount=0;
				String fileName=null;
				Filename filename = new Filename();
				try {
					mr = new MultipartRequest(request,path,fileupsize,"utf-8",filename);
					String courseid = mr.getParameter("courseid");
					String sectionname = mr.getParameter("sectionname");
					String remark = mr.getParameter("remark");
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
//			            out.println("<img src='upfile/"+fileName+"' />");
			        } 
					String sectionlength = mr.getParameter("sectionlength");
					String isfree = mr.getParameter("isfree");
					String paixu = mr.getParameter("paixu");
					SectionBean sectionbean = new SectionBean();
					sectionbean.setCourseid(Integer.parseInt(courseid));
					sectionbean.setSectionname(sectionname);
					sectionbean.setIsfree(Integer.parseInt(isfree));
					sectionbean.setReason("待审核");
					sectionbean.setPaixu(Integer.parseInt(paixu));
					sectionbean.setSectionremark(remark);
					sectionbean.setSectionurl("upvedio/"+fileName);
					sectionbean.setStatus(0);
					sectionbean.setSectioncontent("暂时没有");
					sectionbean.setTimelength(Integer.parseInt(sectionlength));
					sql.sectionadd(sectionbean);
					paginglist(request, response);
					request.getRequestDispatcher("data/sectionselect.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(order.equals("updatesave")){
				MultipartRequest mr = null;
				String path = getServletContext().getRealPath("/")+"upvedio"; 
				File file = new File(path);
				if (!file.exists()) {
					file.mkdir();
				}
				int fileupsize = 1024*1024*1024;
				int filecount=0;
				String fileName=null;
				Filename filename = new Filename();
				try {
					mr = new MultipartRequest(request,path,fileupsize,"utf-8",filename);
					String courseid = mr.getParameter("courseid");
					String sectionname = mr.getParameter("sectionname");
					String remark = mr.getParameter("remark");
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
//			            out.println("<img src='upfile/"+fileName+"' />");
			        } 
					String sectionlength = mr.getParameter("sectionlength");
					String isfree = mr.getParameter("isfree");
					String paixu = mr.getParameter("paixu");
					SectionBean sectionbean = new SectionBean();
					sectionbean.setCourseid(Integer.parseInt(courseid));
					sectionbean.setSectionname(sectionname);
					sectionbean.setIsfree(Integer.parseInt(isfree));
					sectionbean.setReason("审核提交成功！");
					sectionbean.setPaixu(Integer.parseInt(paixu));
					sectionbean.setSectionremark(remark);
					sectionbean.setSectionid(Integer.parseInt(mr.getParameter("sectionid")));
					if(fileName==null || fileName.equals("")){
						sectionbean.setSectionurl(mr.getParameter("url"));
					}else {
						sectionbean.setSectionurl("upvedio/"+fileName);
					}
					sectionbean.setStatus(0);
					sectionbean.setSectioncontent("暂时没有");
					sectionbean.setTimelength(Integer.parseInt(sectionlength));
					request.setAttribute("msg", "审核提交成功！");
					sql.sectionupdate(sectionbean);
					paginglist(request, response);
					request.getRequestDispatcher("data/sectionselect.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (order.equals("shenhe")) {
				String sectionid = request.getParameter("sectionid");
				sql.updatereason(sectionid);
				request.setAttribute("msg", "你的章节视频审核请求已经提交！");
				paginglist(request, response);
				request.getRequestDispatcher("data/sectionselect.jsp").forward(request, response);
			}else if (order.equals("checklist")) {
				paginglist1(request, response);
				request.getRequestDispatcher("data/sectionchecklist.jsp").forward(request, response);
			}else if (order.equals("checkcross")) {
				TeacherBean teacherBean2 = (TeacherBean)session.getAttribute("teacherbean2");
				String sectionid = request.getParameter("sectionid");
				String reason = request.getParameter("reason");
				System.out.println(reason);
				sql.updatestatus(sectionid, request.getParameter("status"), reason);
				SectionBean sectionbean = sql.findsection(sectionid);
				CourseBean coursebean = sql.findcoursemanger(sectionbean.getCourseid()+"");
				JifenBean jifen = sql.jifenlist(coursebean.getTeacher_id()+"");
				if(jifen.getFen()<=2600 || jifen.getFen()>=0){
					if(jifen.getTeacherid()==0){
						JifenBean jifenbean = new JifenBean();
						jifenbean.setFen(200);
						jifenbean.setTeacherid(coursebean.getTeacher_id());
						sql.jifenadd(jifenbean);
					}else{
						JifenBean jifenbean = new JifenBean();
						jifenbean.setFen(200);
						jifenbean.setTeacherid(coursebean.getTeacher_id());
						sql.jifenupdate(jifenbean);
						JifenBean jifenlsit = sql.jifenlist(coursebean.getTeacher_id()+"");
						int jifensum = jifenlsit.getFen();
						if(jifensum==200){
							sql.updateteachergread("1", coursebean.getTeacher_id()+"");
						}else if (jifensum==600) {
							sql.updateteachergread("2", coursebean.getTeacher_id()+"");
						}else if (jifensum==1000) {
							sql.updateteachergread("3", coursebean.getTeacher_id()+"");
						}else if (jifensum==1600) {
							sql.updateteachergread("4", coursebean.getTeacher_id()+"");
						}else if (jifensum==2600) {
							sql.updateteachergread("5", coursebean.getTeacher_id()+"");
						}
						JifenBean jifenBean = sql.jifenlist(coursebean.getTeacher_id()+"");
						request.setAttribute("jifenBean", jifenBean);
						session.setAttribute("jifenBean", jifenBean);
					}
				}
				paginglist1(request, response);
				request.getRequestDispatcher("data/sectionchecklist.jsp").forward(request, response);
			}else if (order.equals("checknotcross")) {
				String sectionid = request.getParameter("sectionid");
				String reason = request.getParameter("reason");
				System.out.println(reason);
				sql.updatestatus(sectionid, "2", reason);
				paginglist1(request, response);
				request.getRequestDispatcher("data/sectionchecklist.jsp").forward(request, response);
			}else if (order.equals("isfree")) {
				String sectionid = request.getParameter("sectionid");
				String isfree = request.getParameter("isfree");
				sql.checkfree(sectionid, isfree);
				paginglist(request, response);
				request.getRequestDispatcher("data/sectionselect.jsp").forward(request, response);
			}else if (order.equals("shenhesection")) {
				String sectionid = request.getParameter("sectionid");
				SectionBean sectionbean = sql.findsection(sectionid);
				request.setAttribute("sectionbean", sectionbean);
				request.getRequestDispatcher("data/sectionupdate.jsp").forward(request, response);
				
			}else if (order.equals("update")) {
				List<CourseBean> courselist = sql.courselist();
				request.setAttribute("courselist", courselist);
				String sectionid = request.getParameter("sectionid");
				SectionBean sectionbean = sql.findsection(sectionid);
				request.setAttribute("sectionbean", sectionbean);
				request.setAttribute("courseid", request.getParameter("courseid"));
				request.getRequestDispatcher("data/updatemysection.jsp").forward(request, response);
			}else if (order.equals("info")) {
				String courseid = request.getParameter("courseid");
				CourseBean coursebean = sql.findcoursemanger(courseid);
				request.setAttribute("coursebean",coursebean );
				List<SectionBean> sectionlist = sql.sectionlist(courseid);
				request.setAttribute("sectionlist", sectionlist);
				List<UserCourseEvalBean> codebeanlist = sql.findpingjia(courseid);
				request.setAttribute("codebeanlist", codebeanlist);
				int num = sql.barsum("select count(*) cnt from section where courseid="+courseid);
				request.setAttribute("num", num);
				request.getRequestDispatcher("datainfo/courseinfo.jsp").forward(request, response);
			}
		}
	}
		
	public void paginglist(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//实例化javabean，取参数
		PagingBean page = new PagingBean();
		//总记录条数，计算总页数
		page.setPagebarsum(sql.pagebarsum("section"));
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
		List<SectionBean> sectionlist = sql.sectionlist(page.getPagebarsize(), page.getStarlocal(),request.getParameter("courseid"));
		request.setAttribute("sectionlist", sectionlist);
		request.setAttribute("pager", page);
	}
	public void paginglist1(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(14);
		//总记录条数，计算总页数
		page.setPagebarsum(sql.pagebarsum("section"));
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
		List<SectionBean> sectionlist = sql.sectionbeanlist(page.getPagebarsize(), page.getStarlocal());
		request.setAttribute("sectionlist", sectionlist);
		request.setAttribute("pager", page);
	}

}
