package SQLservlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SQLBase.AesUtils;
import SQLBase.SQLSentenceimp;
import SQLBean.BankBean;
import SQLBean.CourseBean;
import SQLBean.GreadBean;
import SQLBean.JifenBean;
import SQLBean.PagingBean;
import SQLBean.Provincebean;
import SQLBean.StudentBean;
import SQLBean.TeacherBean;
import SQLBean.TeacherMoneyBean;
import SQLup.Filename;

import com.oreilly.servlet.MultipartRequest;

public class Teacherservlet extends HttpServlet {
	
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
			if (order.equals("list")) {
				paginglist(request, response);
				request.getRequestDispatcher("data/teacherselect.jsp").forward(
						request, response);
			} else if (order.equals("delete")) {
				sql.teacherdel(request
						.getParameter("teacherid"));
				paginglist(request, response);
				request.getRequestDispatcher("data/teacherselect.jsp").forward(
						request, response);
			} else if (order.equals("add")) {
				List<BankBean> banklist = sql.banklist();
				request.setAttribute("banklist", banklist);
				List<GreadBean> gradelist = sql.greadlist();
				request.setAttribute("gradelist", gradelist);
				request.getRequestDispatcher("data/teacheradd.jsp").forward(
						request, response);
			} else if (order.equals("addsave")) {
				String teachername = request.getParameter("teachername");
				String teacherpassword = request.getParameter("teacherpassword");
				String password = AesUtils.encryptStr(teacherpassword,AesUtils.SECRETKEY);
				String teachermobile = request.getParameter("teachermobile");
				String teachersex = request.getParameter("teachersex");
				String teacheremail = request.getParameter("teacheremail");
				String teacherjianjie = request.getParameter("teacherjianjie");
				String teacheredution = request.getParameter("teacheredution");
				String teacherjiaolin = request.getParameter("teacherjiaolin");
				String teacherspecial = request.getParameter("teacherspecial");
				String teacherpictureurl = request.getParameter("teacherpictureurl");
				String teacherbanknumber = request.getParameter("teacherbanknumber");
				String teacherbankname = request.getParameter("teacherbankname");
				String teacheraddress =request.getParameter("teacheraddress");
				int greadid = Integer.parseInt(request.getParameter("greadid"));
				int bankid = Integer.parseInt(request.getParameter("bankid"));
				TeacherBean teacherbean = new TeacherBean();
				teacherbean.setBankid(bankid);
				teacherbean.setGradeid(greadid);
				teacherbean.setTeacheraddress(teacheraddress);
				teacherbean.setTeacherbankname(teacherbankname);
				teacherbean.setTeacherbanknumber(teacherbanknumber);
				teacherbean.setTeachereducation(teacheredution);
				teacherbean.setTeacheremail(teacheremail);
				teacherbean.setTeacherjianjie(teacherjianjie);
				teacherbean.setTeacherjiaolin(teacherjiaolin);
				teacherbean.setTeachermobile(teachermobile);
				teacherbean.setTeachername(teachername);
				teacherbean.setTeacherpassword(password);
				teacherbean.setTeacherpictureurl(teacherpictureurl);
				teacherbean.setTeachersex(Integer.parseInt(teachersex));
				teacherbean.setTeacherspecial(teacherspecial);
				sql.teacheradd(teacherbean);
				paginglist(request, response);
				request.getRequestDispatcher("data/teacherselect.jsp").forward(
						request, response);
			} else if (order.equals("update")) {
				TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherBean2");
				TeacherBean teacherbean=null;
				if(teacherBean==null){
					teacherbean = sql.findteacher(request.getParameter("teacherid"));
				}else {
					teacherbean = sql.findteacher(teacherBean.getTeacherid()+"");
				}
				request.setAttribute("teacherbean", teacherbean);
				List<GreadBean> greadlist = sql.greadlist();
				request.setAttribute("greadlist", greadlist);
				List<BankBean> banklist = sql.banklist();
				request.setAttribute("banklist", banklist);
				List<CourseBean> courselist = sql.courselist();
				request.setAttribute("courselist", courselist);
				List<Provincebean> provincelist = sql.provincelist();
				session.setAttribute("provincelist", provincelist);
//				request.getRequestDispatcher("data/teacherupdate.jsp").forward(request, response);
				request.getRequestDispatcher("datainfo/teacherinfo.jsp").forward(request, response);
			} else if (order.equals("updatesave")) {
				String teacherid = request.getParameter("teacherid");
				String teachername = request.getParameter("teachername");
				System.out.println("teachername"+teachername);
				String teachermobile = request.getParameter("teachermobile");
				String teachersex = request.getParameter("teachersex");
				String teacheremail = request.getParameter("teacheremail");
				String teacherjianjie = request.getParameter("teacherjianjie");
				String teacheredution = request.getParameter("teacheredution");
				String teacherjiaolin = request.getParameter("teacherjiaolin");
				String teacherspecial = request.getParameter("teacherspecial");
				String teacherbankname = request.getParameter("teacherbankname");
				String teacheraddress =request.getParameter("teacheraddress");
				TeacherBean teacherbean = new TeacherBean();
				teacherbean.setTeacherid(Integer.parseInt(teacherid));
				teacherbean.setTeacheraddress(teacheraddress);
				teacherbean.setTeacherbankname(teacherbankname);
				teacherbean.setTeachereducation(teacheredution);
				teacherbean.setTeacheremail(teacheremail);
				teacherbean.setTeacherjianjie(teacherjianjie);
				teacherbean.setTeacherjiaolin(teacherjiaolin);
				teacherbean.setTeachermobile(teachermobile);
				teacherbean.setTeachername(teachername);
				teacherbean.setTeachersex(Integer.parseInt(teachersex));
				teacherbean.setTeacherspecial(teacherspecial);
				sql.teacherupdate(teacherbean);
				TeacherBean teacherBean2 = sql.findmyinfo(teacherbean.getTeachername());
				session.setAttribute("teacherbean", teacherBean2);
				request.setAttribute("msg", "你的资料已经更改成功!");
				TeacherBean teacherbean1 = sql.teacherbean(teachername);
				request.setAttribute("teacherbean", teacherbean1);
				List<GreadBean> greadlist = sql.greadlist();
				request.setAttribute("greadlist", greadlist);
				List<BankBean> banklist = sql.banklist();
				request.setAttribute("banklist", banklist);
				request.setAttribute("teachername", teachername);
//				request.getRequestDispatcher("data/teacherupdate.jsp").forward(request, response);
				request.getRequestDispatcher("datainfo/teacherinfo.jsp").forward(request, response);
			} else if(order.equals("checkinfo")){
				String teachername = new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8");
				TeacherBean teacherbean = sql.teacherbean(teachername);
				request.setAttribute("teacherbean", teacherbean);
				List<GreadBean> greadlist = sql.greadlist();
				request.setAttribute("greadlist", greadlist);
				List<BankBean> banklist = sql.banklist();
				request.setAttribute("banklist", banklist);
				request.setAttribute("teachername", teachername);
				request.getRequestDispatcher("datainfo/teacherinfo.jsp").forward(request, response);
			}else if (order.equals("updatepassword")) {
				String teachername = new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8");
				String teacherpassword = AesUtils.encryptStr(request.getParameter("oldpassword"), AesUtils.SECRETKEY);
				TeacherBean teacherbean = sql.findteacherpwd(teachername);
				if (teacherbean.getTeacherpassword().equals(teacherpassword)){
					//sql.checkpwd(studentname, studentpassword, "student","studentpassword","studentname");
					request.setAttribute("msg", "恭喜你！密码验证成功！");
					request.setAttribute("name",teachername );
					paginglist(request, response);
					request.getRequestDispatcher("data/updateteacherpwd.jsp").forward(request, response);
				}else {
					request.setAttribute("msg", "对不起！你输入的旧密码有误！请核对后再输！");
					paginglist(request, response);
					request.getRequestDispatcher("data/oldteacherpwd.jsp").forward(request, response);
				}
			}else if (order.equals("checkpassword")) {
				String teachername = request.getParameter("teachername");
				String teacherpassword = AesUtils.encryptStr(request.getParameter("newpassword"), AesUtils.SECRETKEY);
				sql.checkpwd(teachername, teacherpassword, "teacher","teacherpassword","teachername");
				request.setAttribute("msg", "恭喜你！密码修改成功！");
				paginglist(request, response);
				TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherBean2");
				TeacherBean teacherbean=null;
				if(teacherBean==null){
					teacherbean = sql.findteacher(request.getParameter("teacherid"));
				}else {
					teacherbean = sql.findteacher(teacherBean.getTeacherid()+"");
				}
				request.setAttribute("teacherbean", teacherbean);
				List<GreadBean> greadlist = sql.greadlist();
				request.setAttribute("greadlist", greadlist);
				List<BankBean> banklist = sql.banklist();
				request.setAttribute("banklist", banklist);
				List<CourseBean> courselist = sql.courselist();
				request.setAttribute("courselist", courselist);
				List<Provincebean> provincelist = sql.provincelist();
				session.setAttribute("provincelist", provincelist);
//				request.getRequestDispatcher("data/teacherupdate.jsp").forward(request, response);
				request.getRequestDispatcher("datainfo/teacherinfo.jsp").forward(request, response);			}else if (order.equals("bank")) {
				TeacherBean teacherBean = (TeacherBean)session.getAttribute("teacherBean2");
				TeacherBean teacherbean=null;
				if(teacherBean==null){
					teacherbean = sql.findteacher(request.getParameter("teacherid"));
				}else {
					teacherbean = sql.findteacher(teacherBean.getTeacherid()+"");
				}
				request.setAttribute("teacherbean", teacherbean);
				List<GreadBean> greadlist = sql.greadlist();
				request.setAttribute("greadlist", greadlist);
				List<BankBean> banklist = sql.banklist();
				request.setAttribute("banklist", banklist);
				request.getRequestDispatcher("data/teacherbankupdate.jsp").forward(request, response);
			}else if (order.equals("updatabanksave")) {
				String bankid = request.getParameter("bankid");
				String teacherbanknumber = request.getParameter("teacherbanknumber");
				String teacherbankname = request.getParameter("teacherbankname");
				String teacherid = request.getParameter("teacherid");
				TeacherBean teacherBean = new TeacherBean();
				teacherBean.setBankid(Integer.parseInt(bankid));
				teacherBean.setTeacherbanknumber(teacherbanknumber);
				teacherBean.setTeacherbankname(teacherbankname);
				teacherBean.setTeacherid(Integer.parseInt(teacherid));
				sql.teacherbankupdate(teacherBean);
				request.setAttribute("msg", "恭喜你！账户修改成功！");
				TeacherBean tea = (TeacherBean)session.getAttribute("teacherbean");
				TeacherBean teacherBean2 = sql.findmyinfo(tea.getTeachername());
				session.setAttribute("teacherbean", teacherBean2);
				request.getRequestDispatcher("datainfo/teacherinfo.jsp").forward(request, response);
			}
		}else {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			MultipartRequest mr = null;
			String path = getServletContext().getRealPath("/")+"upfile"; 
			File file = new File(path);
			if (!file.exists()) {
				file.mkdir();
			}
			int fileupsize = 3*1024*1024;
			int filecount=0;
			String fileName=null;
			Filename filename = new Filename();
			try {
				mr = new MultipartRequest(request,path,fileupsize,"utf-8",filename);
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
				sql.updateface("teacher", "teacherpictureurl", "upfile/"+fileName, "teachername", studentBean.getStudentname());
				sql.updateface("student", "studentface", "upfile/"+fileName, "studentname", studentBean.getStudentname());
				paginglist(request, response);
				TeacherBean teacherBean2 = (TeacherBean)session.getAttribute("teacherBean2");
				TeacherMoneyBean teacherMoneyBean = sql.teacherbeanlist(teacherBean2.getTeacherid()+"");
				request.setAttribute("teacherMoneyBean", teacherMoneyBean);
				JifenBean jifenBean = sql.jifenlist(teacherBean2.getTeacherid()+"");
				request.setAttribute("jifenBean", jifenBean);
				StudentBean studentBean2  = sql.findstudent(teacherBean2.getTeachername());
				request.setAttribute("studentbean", studentBean2);
				int num = sql.barsum("select count(*) cnt from shoppingcar where studentname='"+studentBean2.getStudentname()+"'");
				request.setAttribute("num", num);
				request.getRequestDispatcher("systemvo/demo.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void paginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.pagebarsum("teacher"));
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
		List<TeacherBean> teacherlist = sql.taecherlist(page.getPagebarsize(),
				page.getStarlocal());
		request.setAttribute("teacherlist", teacherlist);
		request.setAttribute("pager", page);
	}

}
