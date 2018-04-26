package SQLservlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SQLBase.AesUtils;
import SQLBase.SQLSentenceimp;
import SQLBean.CourseBean;
import SQLBean.ExchangeCodeBean;
import SQLBean.ForumBean;
import SQLBean.GreadBean;
import SQLBean.MoneyBean;
import SQLBean.PagingBean;
import SQLBean.PayRecordBean;
import SQLBean.SectionBean;
import SQLBean.ShoppingcarBean;
import SQLBean.StudentBean;
import SQLBean.TeacherBean;
import SQLBean.TeacherMoneyBean;
import SQLBean.UserCourseEvalBean;

public class Courselistservlet extends HttpServlet {

	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		String order = request.getParameter("order");
		if(order.equals("list")){
			paginglist(request, response);
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			CourseBean courseBean1 = sql.courlistandsection(1);
			request.setAttribute("courseBean1", courseBean1);
			CourseBean courseBean2 = sql.courlistandsection(2);
			request.setAttribute("courseBean2", courseBean2);
			CourseBean courseBean3 = sql.courlistandsection(3);
			request.setAttribute("courseBean3", courseBean3);
			CourseBean courseBean4 = sql.courlistandsection(4);
			request.setAttribute("courseBean4", courseBean4);
			CourseBean courseBean5 = sql.courlistandsection(5);
			request.setAttribute("courseBean5", courseBean5);
			if(studentBean==null){
				List<CourseBean> courselist = sql.courselist(8, 0);
				request.setAttribute("courselist", courselist);
				request.setAttribute("summsg", 0);
				request.getRequestDispatcher("datainfo/shouye.jsp").forward(request, response);
			}else {
				int summsg = sql.sumnewmsg(studentBean.getStudentid()+"");
				request.setAttribute("summsg", summsg);
				request.setAttribute("studentBean", studentBean);
				MoneyBean moneybean = sql.money(studentBean.getStudentid()+"");
				request.setAttribute("moneybean", moneybean);
				List<CourseBean> courselist = sql.courselist(8, 0);
				request.setAttribute("courselist", courselist);
				int num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
				request.setAttribute("num", num);
				request.getRequestDispatcher("datainfo/shouye.jsp").forward(request, response);
			}
		}else if(order.equals("datainfo")){
			StudentBean studentbean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentbean", studentbean);
			request.setAttribute("studentBean", studentbean);
			String courseid = request.getParameter("courseid");
			session.setAttribute("courseid", courseid);
			CourseBean o = sql.findcoursemanger(courseid);
			request.setAttribute("o", o);
			int price = (10-(int)o.getDiscount());
			request.setAttribute("price",price );
			int num = sql.barsum("select count(*) cnt from section where courseid="+courseid);
			request.setAttribute("num", num);
			TeacherBean teacherbean = sql.findteacher(o.getTeacher_id()+"");
			List<CourseBean> courselist = sql.courselist(teacherbean.getTeachername(), 2, 0);
			request.setAttribute("courselist", courselist);
			request.setAttribute("teacherbean", teacherbean);
			ExchangeCodeBean codebean = sql.findecode("0", teacherbean.getTeachername());
			request.setAttribute("codebean", codebean);
			request.setAttribute("code",1);
			List<UserCourseEvalBean> pingjia = sql.pingjialist(courseid);
			request.setAttribute("pingjia", pingjia);
			List<SectionBean> sectionlist = sql.sectionlist(request.getParameter("courseid"));
			request.setAttribute("sectionlist", sectionlist);
			request.getRequestDispatcher("data/bucourse.jsp").forward(request, response);
		}else if (order.equals("buy")) {
			DecimalFormat df = new DecimalFormat("0.00");
			StudentBean studentbean =null;
			List<ExchangeCodeBean> exbean=null;
			try {
				studentbean = (StudentBean)session.getAttribute("bean");
				exbean= sql.exchangecodelist(studentbean.getStudentname());
				session.setAttribute("exbean", exbean);
				request.setAttribute("exbean", exbean);
				String courseid = request.getParameter("courseid");
				request.setAttribute("courseid", courseid);
				CourseBean coursebean = sql.findcoursemanger(courseid);
				request.setAttribute("coursebean", coursebean);
				request.setAttribute("courseprice",(int)coursebean.getPrice());
				int price = (10-(int)(coursebean.getDiscount()));
				//打折的折扣数
				request.setAttribute("price",price );
				//计算总金额
				float lastmoney = Float.parseFloat(df.format((coursebean.getPrice()*price)/10));
				if(studentbean.getVIP()==1){
					lastmoney = lastmoney-5;
					request.setAttribute("message", "会员减免5元");
				}
				request.setAttribute("lastmoney", lastmoney);
				TeacherBean teacherbean = sql.findteacher(coursebean.getTeacher_id()+"");
				request.setAttribute("teacherbean", teacherbean);
				String codeid = request.getParameter("code");
				ExchangeCodeBean codebean = sql.findexcodebean(codeid);
				request.setAttribute("code", codebean);
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				request.setAttribute("studentBean", studentBean);
				int num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
				request.setAttribute("num", num);
				request.getRequestDispatcher("datainfo/zhifuzhongxin.jsp").forward(request, response);
			} catch (Exception e) {
				request.setAttribute("msg", "你还未登陆！请先登录");
				e.printStackTrace();
				request.getRequestDispatcher("datainfo/login.jsp").forward(request, response);
			}
		}else if (order.equals("hedui")) {
			DecimalFormat df = new DecimalFormat("0.00");
			String code = request.getParameter("code");
			if(code!=null || !code.equals("")){
				ExchangeCodeBean codeBean = sql.findexcodebean(code);
				request.setAttribute("codeBean", codeBean);
				StudentBean studentbean = (StudentBean)session.getAttribute("bean");
				List<ExchangeCodeBean> exbean = sql.exchangecodelist(studentbean.getStudentname()+"");
				session.setAttribute("exbean", exbean);
				request.setAttribute("exbean", exbean);
				String courseid = request.getParameter("courseid");
				request.setAttribute("courseid", courseid);
				CourseBean coursebean = sql.findcoursemanger(courseid);
//				sql.courseupdate(((int)coursebean.getPrice())-((int)codeBean.getExchangemeony()), Integer.parseInt(courseid));
				request.setAttribute("coursebean", coursebean);
				session.setAttribute("coursebean", coursebean);
				int price = (10-(int)(coursebean.getDiscount()));
				String srcmoney = request.getParameter("lastmoney");
				float lastmoney = Float.parseFloat(df.format(Float.parseFloat(srcmoney)-codeBean.getExchangemeony()));
				request.setAttribute("message", "会员减免5元");
				request.setAttribute("lastmoney", lastmoney);
				request.setAttribute("price",price );
				request.setAttribute("courseprice",srcmoney);
				TeacherBean teacherbean = sql.findteacher(coursebean.getTeacher_id()+"");
				request.setAttribute("teacherbean", teacherbean);
				String codeid = request.getParameter("code");
				ExchangeCodeBean codebean = sql.findexcodebean(codeid);
				request.setAttribute("code", codebean);
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				request.setAttribute("studentBean", studentBean);
				int num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile'"+studentBean.getStudentmobile()+"'");
				request.setAttribute("num", num);
				request.getRequestDispatcher("datainfo/zhifuzhongxin.jsp").forward(request, response);
			}
		}else if (order.equals("qrbuy")) {
			StudentBean studentbean1  = (StudentBean)session.getAttribute("bean");
			MoneyBean money = sql.money(studentbean1.getStudentid()+"");
			String studentpassword = AesUtils.encryptStr(request.getParameter("password"), AesUtils.SECRETKEY);
			String qrmoney = request.getParameter("mymoney");
			String paytype = request.getParameter("paybuytype");
			int courseid=0;
			try {
				courseid =  Integer.parseInt(request.getParameter("courseid"));
				
			} catch (Exception e) {
				courseid=-1;
			}
			CourseBean teacher = sql.findcoursemanger(courseid+"");

			float qian = 0;
			if(qrmoney.equals("") || qrmoney==null){
				qrmoney="0.0";
			}else {
				qian = Float.parseFloat(qrmoney);
			}
			if(studentpassword.equals(money.getPassword())){
				if((money.getSummoney()-qian)<0){
					request.setAttribute("msg", "支付失败！你的余额不足！请充值！");
					PayRecordBean payrecordbean = new PayRecordBean();
					payrecordbean.setStudentid(studentbean1.getStudentid());
					payrecordbean.setCourseid(teacher.getCourse_id());
					payrecordbean.setPayorreturn(0);
					payrecordbean.setPaymoney(qian);
					payrecordbean.setPaytype(Integer.parseInt(paytype));
					payrecordbean.setCardnum(studentbean1.getStudentname());
					payrecordbean.setPayer(studentbean1.getStudentname());
					payrecordbean.setOrdernumber(new Random().nextInt(899999999)+100000000+"");
					payrecordbean.setPaystatus(0);
					payrecordbean.setIsCash(0);
					sql.payrecodeadd(payrecordbean);
					String studentid = request.getParameter("studentid");
					MoneyBean moneybean = sql.money(studentid);
					request.setAttribute("moneybean", moneybean);
					request.setAttribute("summoney", request.getParameter("money"));
					request.setAttribute("coursename", request.getParameter("coursename"));
					request.getRequestDispatcher("datainfo/fukuan.jsp").forward(request, response);
				}else{
					request.setAttribute("msg", "购买成功！");
					if(courseid!=-1){
						TeacherMoneyBean teachermoneybean = sql.teacherbeanlist(teacher.getTeacher_id()+"");
						if(teachermoneybean.getTeacherid()!=teacher.getTeacher_id()){
							TeacherMoneyBean teachermoneybean2 = new TeacherMoneyBean();
							teachermoneybean2.setPassword("23913B3D8C1251FB57ACBD565F07FDDC");
							teachermoneybean2.setSummoney(qian);
							teachermoneybean2.setTeacherid(teacher.getTeacher_id());
							sql.teachermoneyadd(teachermoneybean2);
						}else {
							sql.teachermoneyupdate(teacher.getTeacher_id()+"", "0");
						}
					}
					PayRecordBean payrecordbean = new PayRecordBean();
					payrecordbean.setStudentid(studentbean1.getStudentid());
					payrecordbean.setCourseid(teacher.getCourse_id());
					payrecordbean.setPayorreturn(0);
					payrecordbean.setPaymoney(qian);
					payrecordbean.setPaytype(Integer.parseInt(paytype));
					payrecordbean.setCardnum(studentbean1.getStudentname());
					payrecordbean.setPayer(studentbean1.getStudentname());
					payrecordbean.setOrdernumber(new Random().nextInt(899999999)+100000000+"");
					payrecordbean.setPaystatus(1);
					payrecordbean.setIsCash(0);
					sql.payrecodeadd(payrecordbean);
					sql.updatemoney((money.getSummoney()-qian)+"", studentbean1.getStudentid()+"");
					if(courseid!=-1){
						sql.exchangecodedelete(studentbean1.getStudentid()+"", request.getParameter("youhuimoney")+"", request.getParameter("code"));
					}
					if(courseid==-1){
						sql.updatestudentVIP(studentbean1.getStudentid()+"");
						StudentBean studentbean2 = sql.findstudent(studentbean1.getStudentname());
						session.setAttribute("bean", studentbean2);
					}
					TeacherBean teacherBean = sql.findteacher(teacher.getTeacher_id()+"");
					GreadBean greadBean = sql.findgreadname(teacherBean.getGradeid()+"");
					MoneyBean moneybean = sql.money(studentbean1.getStudentid()+"");
					request.setAttribute("moneybean", moneybean);
					session.setAttribute("moneybean", moneybean);
					StudentBean studentBean = (StudentBean)session.getAttribute("bean");
					request.setAttribute("studentbean", studentBean);
					request.setAttribute("face", studentBean.getStudentface());
					request.getRequestDispatcher("datainfo/main.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("msg", "你的支付密码有误！请核对后输入！");
				PayRecordBean payrecordbean = new PayRecordBean();
				payrecordbean.setStudentid(studentbean1.getStudentid());
				payrecordbean.setCourseid(teacher.getCourse_id());
				payrecordbean.setPayorreturn(0);
				payrecordbean.setPaymoney(qian);
				payrecordbean.setPaytype(Integer.parseInt(paytype));
				payrecordbean.setCardnum(studentbean1.getStudentname());
				payrecordbean.setPayer(studentbean1.getStudentname());
				payrecordbean.setOrdernumber(new Random().nextInt(899999999)+100000000+"");
				payrecordbean.setPaystatus(0);
				payrecordbean.setIsCash(0);
				sql.payrecodeadd(payrecordbean);
				MoneyBean moneybean = sql.money(studentbean1.getStudentid()+"");
				request.setAttribute("moneybean", moneybean);
				request.setAttribute("summoney", request.getParameter("money"));
				request.setAttribute("coursename", request.getParameter("coursename"));
				request.setAttribute("mymoney", request.getAttribute("mymoney"));
				request.getRequestDispatcher("datainfo/fukuan.jsp").forward(request, response);
			}
			request.setAttribute("money", money);
		}else if (order.equals("gouwuche")) {
			StudentBean stBean = (StudentBean)session.getAttribute("bean");
			String courseid = request.getParameter("sectionid");
			ShoppingcarBean shopcar1 =sql.findshopcar(courseid,stBean.getStudentmobile()); 
			if(shopcar1.getStudentmobile()!=null){
				request.setAttribute("msg", "加入失败！该宝贝已存在购物车了！");
				CourseBean o = sql.findcoursemanger(courseid);
				request.setAttribute("o", o);
				int price = (10-(int)(o.getDiscount()*10));
				request.setAttribute("price",price );
				int num = sql.barsum("select count(*) cnt from section where courseid="+courseid);
				request.setAttribute("num", num);
				session.setAttribute("num", num);
				TeacherBean teacherbean = sql.findteacher(o.getTeacher_id()+"");
				List<CourseBean> courselist = sql.courselist(teacherbean.getTeachername(), 2, 0);
				request.setAttribute("courselist", courselist);
				request.setAttribute("teacherbean", teacherbean);
				ExchangeCodeBean codebean = sql.findecode("0", teacherbean.getTeachername());
				request.setAttribute("codebean", codebean);
				request.setAttribute("code",1);
				List<UserCourseEvalBean> pingjia = sql.pingjialist(courseid);
				request.setAttribute("pingjia", pingjia);
				List<SectionBean> sectionlist = sql.sectionlist(courseid);
				request.setAttribute("sectionlist", sectionlist);
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				request.setAttribute("studentBean", studentBean);
				request.getRequestDispatcher("data/bucourse.jsp").forward(request, response);
			}else {
				request.setAttribute("sectionid", courseid);
				StudentBean studentBean = (StudentBean)session.getAttribute("bean");
				CourseBean coursebean1 = sql.findcoursemanger(courseid);
				ShoppingcarBean shopcar = new ShoppingcarBean();
				shopcar.setCourse_count(coursebean1.getCourse_count());
				shopcar.setSectionid(request.getParameter("sectionid"));
				shopcar.setStudentmobile(studentBean.getStudentmobile());
				shopcar.setTeacher_name(coursebean1.getTeacher_id()+"");
				shopcar.setCourse_id(coursebean1.getCourse_id());
				shopcar.setDiscount(coursebean1.getDiscount());
				shopcar.setEffective(coursebean1.getEffective());
				shopcar.setOne_word(coursebean1.getOne_word());
				shopcar.setPicture_url(coursebean1.getPicture_url());
				shopcar.setPrice(coursebean1.getPrice());
				shopcar.setReplay_date(coursebean1.getReplay_date());
				shopcar.setReplay_username(coursebean1.getReplay_username());
				sql.shopcaradd(shopcar);
				CourseBean o = sql.findcoursemanger(courseid);
				request.setAttribute("o", o);
				int price = (10-(int)(o.getDiscount()*10));
				request.setAttribute("price",price );
				int num = sql.barsum("select count(*) cnt from section where courseid="+courseid);
				request.setAttribute("num", num);
				session.setAttribute("num", num);
				TeacherBean teacherbean = sql.findteacher(o.getTeacher_id()+"");
				List<CourseBean> courselist = sql.courselist(teacherbean.getTeachername(), 2, 0);
				request.setAttribute("courselist", courselist);
				request.setAttribute("teacherbean", teacherbean);
				ExchangeCodeBean codebean = sql.findecode("0", teacherbean.getTeachername());
				request.setAttribute("codebean", codebean);
				request.setAttribute("code",1);
				List<UserCourseEvalBean> pingjia = sql.pingjialist(courseid);
				request.setAttribute("pingjia", pingjia);
				List<SectionBean> sectionlist = sql.sectionlist(courseid);
				request.setAttribute("sectionlist", sectionlist);
				request.setAttribute("studentBean", studentBean);
				request.setAttribute("num", num);
				request.setAttribute("msg", "加入购物车成功！到购物车查看！");
				request.getRequestDispatcher("data/bucourse.jsp").forward(request, response);
			}
			
		}else if (order.equals("mycar")) {
			paginglist1(request, response);
			request.getRequestDispatcher("data/shoplist.jsp").forward(request, response);
		}else if (order.equals("mycar1")) {
			paginglist1(request, response);
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			int num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentname()+"'");
			request.setAttribute("num", num);
			request.setAttribute("studentBean", studentBean);
			request.getRequestDispatcher("datainfo/car.jsp").forward(request, response);
		}else if (order.equals("delete1")) {
			String carid = request.getParameter("carid");
			sql.shopcardelete(carid);
			paginglist1(request, response);
			request.getRequestDispatcher("datainfo/car.jsp").forward(request, response);
		}else if(order.equals("paymoney")){
			String courseid = request.getParameter("sectionid");
			CourseBean o = sql.findcoursemanger(courseid);
			CourseBean coursebean = sql.courselistandsection(courseid);
			request.setAttribute("o", o);
			session.setAttribute("courseid", courseid);
			int price = (10-(int)(coursebean.getDiscount()*10));
			request.setAttribute("price",price );
			session.setAttribute("coursebean", coursebean);
			int num = sql.barsum("select count(*) cnt from section where courseid="+courseid);
			request.setAttribute("num", num);
			List<SectionBean> sectionlist = sql.sectionlist(courseid);
			request.setAttribute("sectionlist", sectionlist);
			TeacherBean teacherbean = sql.findteacher(o.getTeacher_id()+"");
			request.setAttribute("teacherbean", teacherbean);
			ExchangeCodeBean codebean = sql.findecode("0", teacherbean.getTeachername());
			request.setAttribute("codebean", codebean);
			request.setAttribute("code",1);
			List<CourseBean> courselist = sql.courselist(teacherbean.getTeachername(), 2, 0);
			request.setAttribute("courselist", courselist);
			List<UserCourseEvalBean> pingjia = sql.pingjialist(courseid);
			request.setAttribute("pingjia", pingjia);
			request.getRequestDispatcher("data/bucourse.jsp").forward(request, response);
		}else if (order.equals("delete")) {
			String carid = request.getParameter("carid");
			sql.shopcardelete(carid);
			paginglist1(request, response);
			request.getRequestDispatcher("data/shoplist.jsp").forward(request, response);
		}else if (order.equals("fukuan")) {
			String youhui = request.getParameter("youhui");
			String lastmoney = request.getParameter("lastmoney");
			System.out.println(youhui);
			request.setAttribute("youhui", youhui);
			request.setAttribute("courseid", request.getParameter("courseid"));
			String studentid = request.getParameter("studentid");
			request.setAttribute("studentid", studentid);
			MoneyBean moneybean = sql.money(studentid);
			request.setAttribute("moneybean", moneybean);
			request.setAttribute("summoney", request.getParameter("lastmoney"));
			System.out.println("asgkdof=="+request.getParameter("coursename"));
			request.setAttribute("coursename", request.getParameter("coursename"));
			request.getRequestDispatcher("datainfo/fukuan.jsp").forward(request, response);
			
		}else if (order.equals("lingqu")) {
			StudentBean studentbean = (StudentBean)session.getAttribute("bean");
			//更新语句
			String code = request.getParameter("code");
			ExchangeCodeBean exchangecodebean = new ExchangeCodeBean();
			exchangecodebean.setExchangecode(code);
			exchangecodebean.setUserid(studentbean.getStudentname()+"");
			exchangecodebean.setExchangestatus(1);
			sql.exchangecodeupdate(exchangecodebean);
			request.setAttribute("codeid", code);
			request.setAttribute("studentbean", studentbean);
			request.setAttribute("code",0);
			String courseid=request.getParameter("courseid");
			CourseBean o = sql.findcoursemanger(courseid);
			request.setAttribute("o", o);
			int price = (10-(int)(o.getDiscount()*10));
			request.setAttribute("price",price );
			int num = sql.barsum("select count(*) cnt from section where courseid="+courseid);
			request.setAttribute("num", num);
			List<SectionBean> sectionlist = sql.sectionlist(courseid);
			request.setAttribute("sectionlist", sectionlist);
			TeacherBean teacherbean = sql.findteacher(o.getTeacher_id()+"");
			List<CourseBean> courselist = sql.courselist(teacherbean.getTeachername(), 2, 0);
			request.setAttribute("courselist", courselist);
			request.setAttribute("teacherbean", teacherbean);
			request.setAttribute("msg", "恭喜你！领取成功！兑换码："+code);
			request.setAttribute("money", request.getParameter("money"));
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			request.getRequestDispatcher("data/bucourse.jsp").forward(request, response);
		}else if (order.equals("lingquwan")) {
			request.setAttribute("msg","你已经领取了优惠券！" );
			StudentBean studentbean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentbean", studentbean);
			String courseid = application.getAttribute("sessionid").toString();
			request.setAttribute("code",0);
			application.setAttribute("sessionid", courseid);
			session.setAttribute("courseid", courseid);
			System.out.println(courseid);
			CourseBean o = sql.courselistandsection(courseid);
			CourseBean coursebean = sql.courselistandsection(courseid);
			request.setAttribute("o", o);
			int price = (10-(int)(coursebean.getDiscount()*10));
			request.setAttribute("price",price );
			session.setAttribute("coursebean", coursebean);
			int num = sql.barsum("select count(*) cnt from section where courseid="+courseid);
			request.setAttribute("num", num);
			List<SectionBean> sectionlist = sql.sectionlist(courseid);
			request.setAttribute("sectionlist", sectionlist);
			TeacherBean teacherbean = sql.findteacher(o.getTeacher_id()+"");
			List<CourseBean> courselist = sql.courselist(teacherbean.getTeachername(), 2, 0);
			request.setAttribute("courselist", courselist);
			request.setAttribute("teacherbean", teacherbean);
			request.setAttribute("money", request.getParameter("money"));
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			request.getRequestDispatcher("data/bucourse.jsp").forward(request, response);
		}else if (order.equals("tiwen")) {
			String coursename = request.getParameter("coursename");
			String url =request.getParameter("url");
			request.setAttribute("sectionurl", url);
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			CourseBean courseBean = sql.findcoursename(coursename);
			String caozuo = request.getParameter("tiwen");
			ForumBean forbean = new ForumBean();
			forbean.setCountent(request.getParameter("msg"));
			forbean.setFourmtype(Integer.parseInt(caozuo));
			forbean.setUserid(studentBean.getStudentid());
			forbean.setReplayUserid(courseBean.getTeacher_id());
			sql.liuyanadd(forbean);
			request.getRequestDispatcher("datainfo/shipin.jsp").forward(request, response);
		}else if (order.equals("liuyanlist")) {
			paginglist3(request, response);
			request.getRequestDispatcher("datainfo/liuyanlist.jsp").forward(request, response);
		}else if (order.equals("huida")) {
			String forumid = request.getParameter("forumid");
			ForumBean forumBean = sql.findliuyan(forumid);
			request.setAttribute("forumBean", forumBean);
			request.getRequestDispatcher("datainfo/liuyanhuifu.jsp").forward(request, response);
		}else if (order.equals("huifu")) {
			String userid = request.getParameter("userid");
			String url =request.getParameter("url");
			request.setAttribute("sectionurl", url);
			int teacherid = Integer.parseInt(request.getParameter("replayid"));
			String caozuo = request.getParameter("tiwen");
			ForumBean forbean = new ForumBean();
			forbean.setCountent(request.getParameter("msg"));
			forbean.setFourmtype(Integer.parseInt(caozuo));
			forbean.setUserid(Integer.parseInt(userid));
			forbean.setReplayUserid(teacherid);
			sql.liuyanadd(forbean);
			request.setAttribute("teacherid", teacherid);
			request.setAttribute("msg", "回复成功！");
			request.getRequestDispatcher("datainfo/huifusess.jsp").forward(request, response);
		}else if (order.equals("deleteliuyan")) {
			String formid = request.getParameter("forumid");
			sql.liuyandel(formid);
			paginglist3(request, response);
			request.getRequestDispatcher("datainfo/liuyanlist.jsp").forward(request, response);
		}else if (order.equals("updateliuyan")) {
			String forumid = request.getParameter("forumid");
			ForumBean forumBean = sql.findliuyan(forumid);
			request.setAttribute("forumBean", forumBean);
			request.getRequestDispatcher("datainfo/liuyanupdate.jsp").forward(request, response);
		}else if (order.equals("updatehuifu")) {
			int teacherid = Integer.parseInt(request.getParameter("replayid"));
			String caozuo = request.getParameter("tiwen");
			ForumBean forbean = new ForumBean();
			forbean.setCountent(request.getParameter("msg"));
			forbean.setFourmtype(Integer.parseInt(caozuo));
			forbean.setReplayUserid(teacherid);
			forbean.setForumid(Integer.parseInt(request.getParameter("forumid")));
			sql.liuyanupdate(forbean);
			request.setAttribute("teacherid", teacherid);
			request.setAttribute("msg", "更新成功！");
			request.getRequestDispatcher("datainfo/huifuupdatesess.jsp").forward(request, response);
		}else if (order.equals("jiaoliutaolun")) {
			List<ForumBean> forlist = sql.liuyanlist(100, 0);
			request.setAttribute("forlist", forlist);
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
			request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/chat.jsp").forward(request, response);
		}else if (order.equals("shousuo")) {
			paginglist4(request, response);
			CourseBean courseBean1 = sql.courlistandsection(1);
			request.setAttribute("courseBean1", courseBean1);
			CourseBean courseBean2 = sql.courlistandsection(6);
			request.setAttribute("courseBean2", courseBean2);
			CourseBean courseBean3 = sql.courlistandsection(3);
			request.setAttribute("courseBean3", courseBean3);
			CourseBean courseBean4 = sql.courlistandsection(4);
			request.setAttribute("courseBean4", courseBean4);
			CourseBean courseBean5 = sql.courlistandsection(5);
			request.setAttribute("courseBean5", courseBean5);
			List<TeacherBean> teacherlist = sql.teacherlist();
			request.setAttribute("teacherlist", teacherlist);
			String name = request.getParameter("sousuo");
			request.setAttribute("name", name);
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			List<CourseBean> list = sql.courselist();
			request.setAttribute("list", list);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
				request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/face.jsp").forward(request, response);
			
		}else if (order.equals("guanyu")) {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
			request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/guanyu.jsp").forward(request, response);
		}else if (order.equals("help")) {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
			request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/help.jsp").forward(request, response);
		}else if (order.equals("fankui1")) {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
			request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/fankui.jsp").forward(request, response);
		}else if (order.equals("lianxi")) {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
			request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/lianxi.jsp").forward(request, response);
		}else if (order.equals("dengji")) {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
			request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/dengji.jsp").forward(request, response);
		}else if (order.equals("fushi")) {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
			request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/fushi.jsp").forward(request, response);
		}else if (order.equals("jiaoliu")) {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}			
			request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/jiaoliu.jsp").forward(request, response);
		}else if (order.equals("app")) {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
			request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/app.jsp").forward(request, response);
		}else if (order.equals("weizhiye")) {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
			request.setAttribute("num", num);
			request.getRequestDispatcher("datainfo/weizhiye.jsp").forward(request, response);
		}else if (order.equals("study")) {
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			request.setAttribute("studentBean", studentBean);
			int num=0;
			if(studentBean!=null){
				num = sql.barsum("select count(*) cnt from shoppingcar where studentmobile='"+studentBean.getStudentmobile()+"'");
			}
			List<CourseBean> courselist = sql.courselist();
			request.setAttribute("courselist", courselist);
			request.setAttribute("num", num);
			CourseBean courseBean1 = sql.courlistandsection(1);
			request.setAttribute("courseBean1", courseBean1);
			CourseBean courseBean2 = sql.courlistandsection(6);
			request.setAttribute("courseBean2", courseBean2);
			CourseBean courseBean3 = sql.courlistandsection(3);
			request.setAttribute("courseBean3", courseBean3);
			CourseBean courseBean4 = sql.courlistandsection(4);
			request.setAttribute("courseBean4", courseBean4);
			CourseBean courseBean5 = sql.courlistandsection(5);
			request.setAttribute("courseBean5", courseBean5);
			request.getRequestDispatcher("datainfo/study.jsp").forward(request, response);
		}else if (order.equals("studentliuyanlist")) {
			paginglist5(request, response);
			request.getRequestDispatcher("datainfo/studentliuyanlist.jsp").forward(request, response);
		}
	}
	public void paginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		page.setPagebarsize(6);
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.listsum());
		System.out.println("sql.listsum()="+sql.listsum());
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
		List<CourseBean> courselistwithsection = sql.courlistwithsection(6, 0);
		if(courselistwithsection.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("courselistwithsection", courselistwithsection);
		request.setAttribute("pager", page);
	}
	public void paginglist1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		HttpSession session = request.getSession();
		StudentBean studentBean = (StudentBean)session.getAttribute("bean");
		PagingBean page = new PagingBean();
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
		List<ShoppingcarBean> shoplist = sql.shopcarlist(page.getPagebarsize(), page.getStarlocal(),studentBean.getStudentmobile());
		if(shoplist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("shoplist", shoplist);
		request.setAttribute("pager", page);
	}
	public void paginglist3(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		HttpSession session = request.getSession();
		String replayid = request.getParameter("id");
		request.setAttribute("replayid", replayid);
		PagingBean page = new PagingBean();
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cnt from Forum where ReplayUserid="+replayid));
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
		String sc = request.getParameter("sc");
		if(sc==null){
			sc="forumdate";
		}else {
			sc="forumdate desc";
		}
		request.setAttribute("sc", sc);
		List<ForumBean> forlist = sql.liuyanlist(page.getPagebarsize(), page.getStarlocal(),replayid,sc);
		if(forlist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("forlist", forlist);
		request.setAttribute("pager", page);
	}
	public void paginglist4(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		String name = request.getParameter("sousuo");
		System.out.println("name=="+name);
		request.setAttribute("name", name);
		PagingBean page = new PagingBean();
		page.setPagebarsize(5);
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cnt from course where course_name like '%"+name+"%' or one_word like '%"+name+"%' or introduce like '%"+name+"%'  or replay_username like '%"+name+"%' "));
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
		List<CourseBean> courselist = sql.courselist(name);
		if(courselist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("courselist", courselist);
		request.setAttribute("pager", page);
	}
	public void paginglist5(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		HttpSession session = request.getSession();
		String replayid = request.getParameter("id");
		request.setAttribute("replayid", replayid);
		PagingBean page = new PagingBean();
		page.setPagebarsize(13);
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.barsum("select count(*) cnt from Forum where Userid="+replayid));
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
		List<ForumBean> forlist = sql.liuyanlist(page.getPagebarsize(), page.getStarlocal(), Integer.parseInt(replayid));
		if(forlist.size()==0){
			page.setCurrentpage(0);
		}
		request.setAttribute("forlist", forlist);
		request.setAttribute("pager", page);
	}
}
