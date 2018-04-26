package SQLservlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import API.GetPhoneMessage;
import API.SendEmail;
import SQLBase.AesUtils;
import SQLBase.SQLSentenceimp;
import SQLBean.BankBean;
import SQLBean.BirthdayBean;
import SQLBean.Citybean;
import SQLBean.GreadBean;
import SQLBean.MoneyBean;
import SQLBean.MoneyRecordBean;
import SQLBean.PagingBean;
import SQLBean.PayRecordBean;
import SQLBean.Provincebean;
import SQLBean.StudentBean;
import SQLBean.TeacherBean;
import SQLup.Filename;

public class Studentservlet extends HttpServlet {
	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application = getServletContext();
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(); 
		PrintWriter out = response.getWriter();
		if(request.getParameter("order")!=null){
			String order = request.getParameter("order");
			if(order.equals("list")){
			   	paginglist2(request, response);
				request.getRequestDispatcher("datainfo/jiaoyijilu.jsp").forward(request, response);
			}else if(order.equals("checklist")){
			   	paginglist(request, response);
				request.getRequestDispatcher("data/studenttoteacherselect.jsp").forward(request, response);
			}else if (order.equals("delete")) {
				sql.studentdel(Integer.parseInt(request.getParameter("studentid")));
				paginglist1(request, response);
				request.getRequestDispatcher("data/studentselect.jsp").forward(request, response);
			}else if (order.equals("add")) {
				String registerName = request.getParameter("registerName");
				String checkUser = request.getParameter("checkUser");
				String password = request.getParameter("password");
				password = AesUtils.encryptStr(password, AesUtils.SECRETKEY);
				StudentBean studentbean = new StudentBean();
				studentbean.setStudentname(checkUser);
				studentbean.setStudentmobile(registerName);
				studentbean.setStudentpassword(password);
				studentbean.setLeibie(1);
				studentbean.setProvinceid(1);
				studentbean.setCityid(1);
				studentbean.setStudentface("image/face.gif");
				studentbean.setStudentemail("数据暂缺");
				studentbean.setStudenthomeaddress("数据暂缺");
				sql.studentadd(studentbean);
				StudentBean bean = sql.findstudent(registerName);
				session.setAttribute("bean", bean);
				request.setAttribute("bean", bean);
				request.setAttribute("name", registerName);
				request.setAttribute("password", password);
				int num = sql.barsum("select count(*) cnt from shoppingcar where studentname='"+registerName+"'");
				request.setAttribute("num", num);
				request.getRequestDispatcher("datainfo/zhucesess.jsp").forward(request, response);
			}else if (order.equals("updateinit")) {
				String provinceid = request.getParameter("provinceid");
				System.out.println(provinceid);
				String studentname = request.getParameter("studentname");
				String studentid = request.getParameter("studentid");
				String studentmobile = request.getParameter("studentmobile");
				String studentemail = request.getParameter("studentemail");
				String studenthomeaddress = request.getParameter("studenthomeaddress");
				String studentsex = request.getParameter("studentsex");
				List<Provincebean> provincelist = sql.provincelist();
				List<Citybean> citylist = null;
				if(provinceid!=null){
					citylist = sql.cityalllist(provinceid);
				}else if (provincelist.size()>0) {
					Provincebean p = new Provincebean();
					citylist = sql.cityalllist(p.getProvinceid()+"");
				}
				request.setAttribute("provincelist", provincelist);
				request.setAttribute("citylist", citylist);
				request.setAttribute("provinceid", provinceid);
				request.setAttribute("studentname", studentname);
				request.setAttribute("studentid", studentid);
				request.setAttribute("studentmobile", studentmobile);
				request.setAttribute("studentsex", studentsex);
				request.setAttribute("studentemail", studentemail);
				request.setAttribute("studenthomeaddress", studenthomeaddress);
				request.getRequestDispatcher("data/studentupdate.jsp").forward(request, response);
			}else if (order.equals("addsave")) {
				String studentname = request.getParameter("studentname");
				String studentpassword = request.getParameter("studentpassword");
				String password = AesUtils.encryptStr(studentpassword, AesUtils.SECRETKEY);
				String studentmobile = request.getParameter("studentmobile");
				String studentsex = request.getParameter("studentsex");
				String studentemail = request.getParameter("studentemail");
				int provinceid = Integer.parseInt(request.getParameter("provinceid"));
				int cityid = Integer.parseInt(request.getParameter("cityid"));
				String studenthomeaddress = request.getParameter("studenthomeaddress");
				StudentBean studentbean = new StudentBean();
				studentbean.setCityid(cityid);
				studentbean.setProvinceid(provinceid);
				studentbean.setStudentemail(studentemail);
				studentbean.setStudenthomeaddress(studenthomeaddress);
				studentbean.setStudentmobile(studentmobile);
				studentbean.setStudentname(studentname);
				studentbean.setStudentpassword(password);
				studentbean.setStudentsex(Integer.parseInt(studentsex));
				studentbean.setStudentface("images/logo.png");
				studentbean.setLeibie(1);
				sql.studentadd(studentbean);
				request.setAttribute("studentbean", studentbean);
				StudentBean bean = sql.findstudent(studentname);
				session.setAttribute("bean", bean);
				paginglist(request, response);
				request.getRequestDispatcher("systemvo/systemstudentmain.jsp").forward(request, response);
			}else if (order.equals("update")) {
				List<Provincebean> provincelist = sql.provincelist();
				session.setAttribute("provincelist", provincelist);
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				StudentBean  studentbean = sql.findstudent(studentBean.getStudentname());
				request.setAttribute("studentbean", studentbean);
				List<Citybean> citylist = sql.citylist();
				request.setAttribute("citylist", citylist);
				MoneyBean moneybean = sql.money(studentbean.getStudentid()+"");
				request.setAttribute("moneybean", moneybean);
				session.setAttribute("moneybean", moneybean);
				session.setAttribute("mm", moneybean.getSummoney());
//				request.getRequestDispatcher("data/studentupdate.jsp").forward(request, response);
				request.getRequestDispatcher("datainfo/studentinfo.jsp").forward(request, response);
			}else if (order.equals("update1")) {
				List<Provincebean> provincelist = sql.provincelist();
				session.setAttribute("provincelist", provincelist);
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				StudentBean  studentbean = sql.findstudent(sql.findstudentname(request.getParameter("studentid")));
				request.setAttribute("studentbean", studentbean);
				List<Citybean> citylist = sql.citylist();
				request.setAttribute("citylist", citylist);
				MoneyBean moneybean = sql.money(studentbean.getStudentid()+"");
				request.setAttribute("moneybean", moneybean);
				session.setAttribute("moneybean", moneybean);
				session.setAttribute("mm", moneybean.getSummoney());
//				request.getRequestDispatcher("data/studentupdate.jsp").forward(request, response);
				request.getRequestDispatcher("datainfo/studentmangerinfo.jsp").forward(request, response);
			}else if (order.equals("update2")) {
				List<Provincebean> provincelist = sql.provincelist();
				session.setAttribute("provincelist", provincelist);
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				StudentBean  studentbean = sql.findstudent(sql.findstudentname(request.getParameter("studentid")));
				request.setAttribute("studentbean", studentbean);
				List<Citybean> citylist = sql.citylist();
				request.setAttribute("citylist", citylist);
				MoneyBean moneybean = sql.money(studentbean.getStudentid()+"");
				request.setAttribute("moneybean", moneybean);
				session.setAttribute("moneybean", moneybean);
				session.setAttribute("mm", moneybean.getSummoney());
//				request.getRequestDispatcher("data/studentupdate.jsp").forward(request, response);
				request.getRequestDispatcher("data/studentsendmangerinfo.jsp").forward(request, response);
			}else if (order.equals("checkbirthday")) {
				long code = Long.parseLong(request.getParameter("newpassword"));
				StudentBean st = (StudentBean)session.getAttribute("bean");
				BirthdayBean birthday = sql.findbirthday("where studentid="+st.getStudentid());
				if(birthday.getCode()==code){
					request.setAttribute("birthday", birthday);
					request.getRequestDispatcher("choujiang/drawemoney.jsp").forward(request, response);
				}else {
					request.setAttribute("msg","亲爱的"+st.getStudentname()+"用户你好！你输入有误,编号已经发至你的邮箱\n,如有疑问，请拨打客服电话！");
					System.out.println(request.getAttribute("msg"));
					request.getRequestDispatcher("choujiang/checkcode.jsp").forward(request, response);
				}
			}else if (order.equals("yanzheng")) {
				StudentBean st = (StudentBean)session.getAttribute("bean");
				int money = Integer.parseInt(request.getParameter("money"));
				if(money==0){
					sql.updatebirthday(-1, "where studentid="+st.getStudentid());
					out.print("ok");
				}else {
					sql.updatebirthday(money, "where studentid="+st.getStudentid());
					MoneyRecordBean moneyrecordbean = new MoneyRecordBean();
					moneyrecordbean.setPay_money(money);
					moneyrecordbean.setRemark("福利抽奖金额");
					moneyrecordbean.setUserid(st.getStudentid());
					sql.moneyadd(moneyrecordbean);
					sql.updatemoney(money+"", st.getStudentid());
					sql.updatebirthdaystatus(1, " where studentid="+st.getStudentid());
					out.print("ok");
				}
			}else if (order.equals("checkyanzheng")) {
				StudentBean st = (StudentBean)session.getAttribute("bean");
				BirthdayBean birthdayBean = sql.findbirthday(" where studentid="+st.getStudentid());
				out.print(birthdayBean.getMoney());
			}else if (order.equals("send")) {
				String studentid = request.getParameter("studentid");
				String email = request.getParameter("email");
				String content = request.getParameter("content");
				long mi = System.currentTimeMillis();
				if(email!=null){
					BirthdayBean birthday = new BirthdayBean();
					birthday.setStatus(0);
					birthday.setStudentid(Integer.parseInt(studentid));
					birthday.setCode(mi);
					birthday.setMoney(0);
					sql.addbirthday(birthday);
					String receiveEmail = email;
			        String receiveNick="陈飞龙";
			        String subject="【IT课堂】祝福语";
			        String contents="亲爱的"+request.getParameter("studentname")+"用户你好！你在本平台学习时间超过了2个月平台，你获得了一次抽奖的机会，请在主页查看,校验码为：【"+mi+"】。"+content;
			        SendEmail.sendMail(receiveEmail, receiveNick, subject, contents);
			        paginglist4(request, response);
			        request.getRequestDispatcher("data/birthdayList.jsp").forward(request, response);
				}else{
					String mobile = request.getParameter("mobile");
				}
			}else if (order.equals("birthdaylist")) {
		        paginglist4(request, response);
		        request.getRequestDispatcher("data/birthdayList.jsp").forward(request, response);
				
			}else if (order.equals("updatesave")) {
				String studentid = request.getParameter("studentid");
				String studentname = request.getParameter("studentname");
				String studentmobile = request.getParameter("studentmobile");
				String studentsex = request.getParameter("studentsex");
				String studentemail = request.getParameter("studentemail");
				String province = request.getParameter("province");
				String city = request.getParameter("cityid");
				Provincebean provincename = sql.findprovincename(province);
				Citybean citybean = sql.findcity(city);
				String studenthomeaddress = provincename.getProvinceName()+citybean.getCityname();
				String studentregisterdate = new Date().toLocaleString();
				StudentBean studentbean1 = new StudentBean();
				studentbean1.setStudentid(Integer.parseInt(studentid));
				studentbean1.setCityid(Integer.parseInt(city));
				studentbean1.setProvinceid(Integer.parseInt(province));
				studentbean1.setStudentemail(studentemail);
				studentbean1.setStudenthomeaddress(studenthomeaddress);
				studentbean1.setStudentmobile(studentmobile);
				studentbean1.setStudentname(studentname);
				studentbean1.setStudentregisterdate(studentregisterdate);
				studentbean1.setStudentsex(Integer.parseInt(studentsex));
				sql.studentupdate(studentbean1);
				List<Provincebean> provincelist = sql.provincelist();
				request.setAttribute("provincelist", provincelist);
				StudentBean  studentbean = sql.findstudent(studentname);
				request.setAttribute("studentbean", studentbean);
				List<Citybean> citylist = sql.citylist();
				request.setAttribute("citylist", citylist);
				request.setAttribute("msg", "资料修改成功！");
				session.setAttribute("bean", studentbean);
//				request.getRequestDispatcher("data/studentupdate.jsp").forward(request, response);
				request.getRequestDispatcher("datainfo/studentinfo.jsp").forward(request, response);
			}else if (order.equals("updatepassword")) {
				String studentname = new String(request.getParameter("studentname").getBytes("iso-8859-1"),"utf-8");
				String studentpassword = AesUtils.encryptStr(request.getParameter("oldpassword"), AesUtils.SECRETKEY);
				StudentBean studentbean = sql.findstudent(studentname);
				if (studentbean.getStudentpassword().equals(studentpassword)){
					//sql.checkpwd(studentname, studentpassword, "student","studentpassword","studentname");
					request.setAttribute("msg", "恭喜你！密码验证成功！");
					request.setAttribute("name",studentname );
					paginglist(request, response);
					request.getRequestDispatcher("data/updatestudentpwd.jsp").forward(request, response);
				}else {
					request.setAttribute("msg", "对不起！你输入的旧密码有误！请核对后再输！");
					paginglist(request, response);
					request.getRequestDispatcher("data/oldstudentpwd.jsp").forward(request, response);
				}
			}else if (order.equals("checkpassword")) {
				String studentname = request.getParameter("studentname");
				String studentpassword = AesUtils.encryptStr(request.getParameter("newpassword"), AesUtils.SECRETKEY);
				sql.checkpwd(studentname, studentpassword, "student","studentpassword","studentname");
				request.setAttribute("msg", "恭喜你！密码修改成功！");
				paginglist(request, response);
				List<Provincebean> provincelist = sql.provincelist();
				session.setAttribute("provincelist", provincelist);
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				StudentBean  studentbean = sql.findstudent(studentBean.getStudentname());
				request.setAttribute("studentbean", studentbean);
				List<Citybean> citylist = sql.citylist();
				request.setAttribute("citylist", citylist);
//				request.getRequestDispatcher("systemvo/demo.jsp").forward(request, response);
				request.getRequestDispatcher("datainfo/studentinfo.jsp").forward(request, response);
			}else if (order.equals("toteacher")) {
				StudentBean  studentbean = sql.findstudent(new String(request.getParameter("studentname").getBytes("iso-8859-1"),"utf-8"));
				request.setAttribute("studentbean", studentbean);
				request.getRequestDispatcher("data/studenttoteacher.jsp").forward(request, response);
			}else if (order.equals("checkteacher")) {
				String studentname = new String(request.getParameter("studentname").getBytes("iso-8859-1"),"utf-8");
				sql.checkteacher(studentname,"2");
				request.setAttribute("msg", "你的教师申请已经提交");
				StudentBean  studentbean = sql.findstudent(new String(request.getParameter("studentname").getBytes("iso-8859-1"),"utf-8"));
				request.setAttribute("studentbean", studentbean);
				request.getRequestDispatcher("data/studenttoteacher.jsp").forward(request, response);
			}else if (order.equals("checkteachersave")) {
				String name = request.getParameter("studentid");
				int status = Integer.parseInt(request.getParameter("status"));
				if(status==1){
					sql.checkteacher(name,"0");
					sql.checkteacher(request.getParameter("teacherid"), request.getParameter("status"), request.getParameter("reason"));
				}else {
					sql.checkteacher(name,"1");
					sql.checkteacher(request.getParameter("teacherid"), request.getParameter("status"), request.getParameter("reason"));
				}
				paginglist(request, response);
				TeacherBean teacherbean = sql.findteacher(request.getParameter("teacherid"));
				request.setAttribute("teacherbean", teacherbean);
				request.getRequestDispatcher("data/studenttoteacherselect.jsp").forward(request, response);
			}else if (order.equals("summoney")) {
				StudentBean studentbean = (StudentBean)session.getAttribute("bean");
				MoneyBean moneybean = sql.money(studentbean.getStudentid()+"");
				request.setAttribute("moneybean", moneybean);
				request.setAttribute("userid", studentbean.getStudentid());
				paginglist11(request, response);
				request.getRequestDispatcher("data/yue.jsp").forward(request, response);
			}else if (order.equals("zhifupwd")) {
				String username = request.getParameter("username");
				StudentBean studentbean = sql.findstudent(new String(username.getBytes("iso-8859-1"),"utf-8"));
				String pwd = AesUtils.encryptStr(request.getParameter("pwd"), AesUtils.SECRETKEY);
				sql.updatezhifupwd(pwd, studentbean.getStudentid());
				request.getRequestDispatcher("systemvo/demo.jsp").forward(request, response);
			}else if (order.equals("teacher")) {
				List<BankBean> banklist = sql.banklist();
				request.setAttribute("banklist", banklist);
				List<GreadBean> greadlist = sql.greadlist();
				request.setAttribute("greadlist", greadlist);
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				TeacherBean teacherbean = sql.findmydatainfo(studentBean.getStudentmobile());
				if(teacherbean.getTeachername()!=null){
					request.setAttribute("teacherbean", teacherbean);
//					request.getRequestDispatcher("data/teachertostudentupdate.jsp").forward(request, response);
					request.getRequestDispatcher("datainfo/studenttoteacherdatainfo.jsp").forward(request, response);
					
				}else {
//					request.getRequestDispatcher("data/teacheradd.jsp").forward(request, response);
					request.getRequestDispatcher("datainfo/studenttoteacherinfo.jsp").forward(request, response);
					
				}
			}else if (order.equals("shenqing")) {
				String teachername = request.getParameter("teachername");
				sql.teacherdelete(teachername);
				List<BankBean> banklist = sql.banklist();
				request.setAttribute("banklist", banklist);
				List<GreadBean> greadlist = sql.greadlist();
				request.setAttribute("greadlist", greadlist);
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				TeacherBean teacherbean = sql.findmydatainfo(studentBean.getStudentmobile());
				if(teacherbean.getTeachername()!=null){
					request.setAttribute("teacherbean", teacherbean);
//					request.getRequestDispatcher("data/teachertostudentupdate.jsp").forward(request, response);
					request.getRequestDispatcher("datainfo/studenttoteacherdatainfo.jsp").forward(request, response);
				}else {
//					request.getRequestDispatcher("data/teacheradd.jsp").forward(request, response);
					request.getRequestDispatcher("datainfo/studenttoteacherinfo.jsp").forward(request, response);
				}
			}else if (order.equals("teacheradd")) {
				List<BankBean> banklist = sql.banklist();
				request.setAttribute("banklist", banklist);
				StudentBean stud = (StudentBean)session.getAttribute("bean");
				sql.checkteacher(stud.getStudentmobile(),"2");
				StudentBean  studentbean = (StudentBean)session.getAttribute("bean");
				request.setAttribute("studentbean", studentbean);
				String teachername = request.getParameter("teachername");
				String teacheremail = request.getParameter("teacheremail");
				String teacherjianjie = request.getParameter("teacherjianjie");
				String teacheredution = request.getParameter("teacheredution");
				String teacherjiaolin = request.getParameter("teacherjiaolin");
				String teacherspecial = request.getParameter("teacherspecial");
				String teacherbanknumber = request.getParameter("teacherbanknumber");
				String teacheraddress =request.getParameter("teacheraddress");
				int bankid = Integer.parseInt(request.getParameter("bankid"));
				TeacherBean teacherbean1 = new TeacherBean();
				teacherbean1.setBankid(bankid);
				teacherbean1.setGradeid(1);
				teacherbean1.setTeacheraddress(teacheraddress);
				teacherbean1.setTeacherbanknumber(teacherbanknumber);
				teacherbean1.setTeachereducation(teacheredution);
				teacherbean1.setTeacheremail(teacheremail);
				teacherbean1.setTeacherjianjie(teacherjianjie);
				teacherbean1.setTeacherjiaolin(teacherjiaolin);
				teacherbean1.setTeachermobile(studentbean.getStudentmobile());
				teacherbean1.setTeachername(teachername);
				teacherbean1.setTeacherpassword(studentbean.getStudentpassword());
				teacherbean1.setTeacherpictureurl(studentbean.getStudentface());
				teacherbean1.setTeachersex(studentbean.getStudentsex());
				teacherbean1.setTeacherspecial(teacherspecial);
				teacherbean1.setTeacherbankname(teachername);
				teacherbean1.setStatus(0);
				teacherbean1.setReason("请求审核成教师。。");
				sql.teacheradd(teacherbean1);
				request.setAttribute("studentname", studentbean.getStudentname());
				TeacherBean teacherbean = sql.findmyinfo(teachername);
				request.setAttribute("teacherbean", teacherbean);
//				request.getRequestDispatcher("data/teachertostudentupdate.jsp").forward(request, response);
				request.getRequestDispatcher("datainfo/studenttoteacherdatainfo.jsp").forward(request, response);
			}else if (order.equals("shenhestudent")) {
				String studentmobile =request.getParameter("studentmobile");
				StudentBean studentbean = sql.findstudentinfo(studentmobile);
				request.setAttribute("studentbean", studentbean);
				TeacherBean teacherbean = sql.findstudenttoteacher(studentbean.getStudentmobile());
				request.setAttribute("teacherbean", teacherbean);
				List<GreadBean> greadlist = sql.greadlist();
				request.setAttribute("greadlist", greadlist);
				List<BankBean> banklist = sql.banklist();
				request.setAttribute("banklist", banklist);
				request.getRequestDispatcher("data/shenhe.jsp").forward(request, response);
			}else if(order.equals("studentlist")){
				paginglist1(request, response);
				request.getRequestDispatcher("data/studentselect.jsp").forward(request, response);
			}else if (order.equals("zhifucenter")) {
				StudentBean studentbean = (StudentBean)session.getAttribute("bean");
				request.setAttribute("studentbean", studentbean);
				MoneyBean moneybean = sql.money(studentbean.getStudentid()+"");
				request.setAttribute("moneybean", moneybean);
				paginglist2(request, response);
				request.getRequestDispatcher("datainfo/moneycenter.jsp").forward(request, response);
			}else if (order.equals("deletejilu")) {
				sql.payrecodedelete(request.getParameter("payrecodeid"));
				StudentBean studentbean = (StudentBean)session.getAttribute("bean");
				request.setAttribute("studentbean", studentbean);
				MoneyBean moneybean = sql.money(studentbean.getStudentid()+"");
				request.setAttribute("moneybean", moneybean);
				request.setAttribute("msg", "交易记录已删除！");
				paginglist2(request, response);
				request.getRequestDispatcher("datainfo/moneycenter.jsp").forward(request, response);
			}else if (order.equals("check")) {
				String registerName = request.getParameter("registerName");
				if(registerName.length()<11){
					out.print("请您输有效的邮箱，或者手机号。");
					
				}else {
					String str = sql.img("studentface","student","studentmobile",registerName);
					System.out.println(str);
					if(str.equals("upfile/1493734331223.jpg")){
						out.print("该手机号可以使用！");
					}else {
						out.print("该手机号已存在！");
					}
				}
				
				System.out.println(registerName);
			}else if (order.equals("checkusername")) {
				String studentname =  request.getParameter("username");
				StudentBean stu = sql.findstudent(studentname);
				if(stu.getStudentname()==null || stu.getStudentname().equals("")){
					out.print("该名称暂时是独一无二的喔！");
				}else {
					out.print("该名称已经存在，不独特了喔！");
				}
			}else if (order.equals("findword")) {
				System.out.println();
				StudentBean studentBean =sql.findstudentinfo(request.getParameter("registerName"));
				if(studentBean.getStudentmobile()!=null){
					out.print("输入正确");
				}else {
					out.print("请您输有效的邮箱，或者手机号。");
				}
			}else if (order.equals("duanxincheckpassword")) {
				String password = request.getParameter("password");
				String registerName = request.getParameter("registerName");
				StudentBean studentBean =sql.findstudentinfo(registerName);
				password = AesUtils.encryptStr(password, AesUtils.SECRETKEY);
				//讲师登录密码的修改
				if(studentBean.getLeibie()==0){
					sql.checkpwd(registerName, password, "teacher","teacherpassword","teachermobile");
				}else {
					sql.checkpwd(registerName, password, "student","studentpassword","studentmobile");
				}
				request.getRequestDispatcher("datainfo/login.jsp").forward(request, response);

			}else if (order.equals("checkcode")) {
				// 验证码
				String code = request.getParameter("code").trim();
				String rand = session.getAttribute("rand").toString();
				if(code.toUpperCase().equals(rand.toUpperCase())){
					out.print("输入正确");
				}else {
					out.print("输入错误");
				}
			}else if (order.equals("managerstudentlist")) {
				paginglist3(request, response);
				request.getRequestDispatcher("data/managerstudentlist.jsp").forward(request, response);
			}
		}else  {
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
			System.out.println("filename:"+filename);
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
				sql.updateface("teacher", "teacherpictureurl", "upfile/"+fileName, "teachermobile", studentBean.getStudentmobile());
				sql.updateface("student", "studentface", "upfile/"+fileName, "studentmobile", studentBean.getStudentmobile());
				MoneyBean moneybean = sql.money(studentBean.getStudentid()+"");
				request.setAttribute("moneybean", moneybean);
				session.setAttribute("moneybean", moneybean);
				request.setAttribute("studentbean", studentBean);
				request.setAttribute("face", studentBean.getStudentface());
				List<Provincebean> provincelist = sql.provincelist();
				request.setAttribute("provincelist", provincelist);
				List<Citybean> citylist = sql.citylist();
				request.setAttribute("citylist", citylist);
				StudentBean stu = sql.findstudent(studentBean.getStudentname());
				session.setAttribute("bean", stu);
				request.getRequestDispatcher("data/studentupdate.jsp").forward(request, response);
			} catch (Exception e) {
				request.getRequestDispatcher("studentface.jsp").forward(request, response);
				e.printStackTrace();
				
			}
		}
	}
	public void paginglist(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//实例化javabean，取参数
		PagingBean page = new PagingBean();
		//总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cont from student"));
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
		List<StudentBean> studentlist = sql.studentlist(page.getPagebarsize(), page.getStarlocal());
		request.setAttribute("studentlist", studentlist);
		request.setAttribute("pager", page);
	}
	public void paginglist1(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//实例化javabean，取参数
		PagingBean page = new PagingBean();
		//总记录条数，计算总页数
		page.setPagebarsum(sql.pagebarsum("student"));
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
		List<StudentBean> studentlist = sql.studentlist(page.getPagebarsize(), page.getStarlocal());
		request.setAttribute("studentlist", studentlist);
		request.setAttribute("pager", page);
	}
	public void paginglist2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		HttpSession session = request.getSession();
		StudentBean studentBean = (StudentBean)session.getAttribute("bean");
		PagingBean page = new PagingBean();
		page.setPagebarsize(10);
		page.setPagebarsize(5);
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.shopcarbarsum(studentBean.getStudentmobile()));
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
		List<PayRecordBean> shoplist = sql.payrecodelist(page.getPagebarsize(), page.getStarlocal(), "1", studentBean.getStudentid());
		request.setAttribute("shoplist", shoplist);
		request.setAttribute("pager", page);
	}
	public void paginglist11(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		StudentBean studentBean = (StudentBean) session.getAttribute("bean");
		// 总记录条数，计算总页数
		page.setPagebarsum(sql
				.barsum("select count(*) from moneyrecord where userid="
						+ studentBean.getStudentid()));
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
		List<MoneyRecordBean> moneylist = sql.moneylist(page.getPagebarsize(),
				page.getStarlocal(), studentBean.getStudentid()+"");
		request.setAttribute("moneylist", moneylist);
		StudentBean student = sql.findstudent(studentBean.getStudentname());
		request.setAttribute("userid", student.getStudentid());
		request.setAttribute("pager", page);
	}
	public void paginglist3(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//实例化javabean，取参数
		PagingBean page = new PagingBean();
		//总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cont from student where leibie=1"));
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
		List<StudentBean> studentlist = sql.studentbirthdaylist(page.getPagebarsize(), page.getStarlocal(),1);
		request.setAttribute("studentlist", studentlist);
		request.setAttribute("pager", page);
	}
	public void paginglist4(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//实例化javabean，取参数
		PagingBean page = new PagingBean();
		//总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cont from birthday"));
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
		List<BirthdayBean> birthdayList = sql.birthdaylist(page.getPagebarsize(), page.getStarlocal());
		request.setAttribute("birthdayList", birthdayList);
		request.setAttribute("pager", page);
	}
}
