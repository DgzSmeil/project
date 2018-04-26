package SQLBase;

import java.util.List;

import SQLBean.BankBean;
import SQLBean.CashRecordBean;
import SQLBean.Citybean;
import SQLBean.CourseBean;
import SQLBean.ExchangeCodeBean;
import SQLBean.ExchangeRecordBean;
import SQLBean.ForumBean;
import SQLBean.GreadBean;
import SQLBean.JifenBean;
import SQLBean.ManagerBean;
import SQLBean.MoneyBean;
import SQLBean.MoneyRecordBean;
import SQLBean.NewmsgBean;
import SQLBean.PayRecordBean;
import SQLBean.Provincebean;
import SQLBean.Refund;
import SQLBean.SectionBean;
import SQLBean.ShoppingcarBean;
import SQLBean.StudentBean;
import SQLBean.SysLogBean;
import SQLBean.TeacherBean;
import SQLBean.TeacherMoneyBean;
import SQLBean.UserCourseEvalBean;
import SQLBean.VIPBean;
import SQLBean.BirthdayBean;


public interface SQLSentence {
	
	//查询语句
	public abstract List<Citybean> citylist();
	//删除语句
	public abstract void citydel(int cityid);
	//更新语句
	public abstract void cityupdate(Citybean citybean);
	//添加语句
	public abstract void cityadd(Citybean citybean);
	//查找单个城市的语句
	public abstract Citybean findcity(String cityid);
	//查找总记录条数语句
	public abstract int pagebarsum (String tablename);
	//另一种方式的查询
	public abstract List<Citybean> citylist(int pagebarsize,int startlocal);
	
	
	//省份的语句
	public abstract String procudeCode();
	//查询语句
	public abstract List<Provincebean> provincelist();
	//删除语句
	public abstract void provincedel(int provinceid);
	//更新语句
	public abstract void provinceupdate(Provincebean provincebean);
	//添加语句
	public abstract void provinceadd(Provincebean citybean);
	//省份分页的语句
	public abstract List<Provincebean> provincelist(int pagesize,int startpage);
	//城市列表语句
	public abstract List<Citybean> cityalllist(String provincesid);
	
	//教师等级分类语句
	
	public List<GreadBean> greadlist ();
	public void greadadd(GreadBean bean);
	public void greaddel(String gread);
	public void greadupdate(GreadBean bean);
	public GreadBean bean (String greadname);
	public abstract List<GreadBean> greadlist(int pagesize,int startpage);
	public abstract void updateteachername(String oldname,String newname);
	public TeacherBean findmydatainfo(String teachermobile); 
	//管理员语句
	
	public abstract  List<ManagerBean> managerlist ();
	public abstract void manageradd(ManagerBean bean);
	public abstract void managerdel(String managerid);
	public abstract void managerupdate(ManagerBean bean);
	public abstract ManagerBean findmanger (String managerid);
	public abstract void changeleibie (String managerid);
	public abstract void saveleibie (String leibie,String reason,String username,String managerid);
	public abstract List<ManagerBean> managerlist(int pagesize,int startpage);
	//更改密码语句
	public abstract void checkpwd(String managerid, String managerpassword ,String tablename,String id,String pwd);
	//更改状态语句
	public abstract void checkstatus(String managerid,String managerstatus);
	//查询密码语句
	public abstract boolean oldpwd(String managerid);
	
	
	//学生语句
	
	//查询语句
	public abstract List<StudentBean> studentlist();
	//删除语句
	public abstract void studentdel(int studentid);
	//更新语句
	public abstract void studentupdate(StudentBean studentbean);
	//添加语句
	public abstract void studentadd(StudentBean studentbean);
	//学生分页的语句
	public abstract List<StudentBean> studentlist(int pagesize,int startpage,String leibie);
	//学生分页的语句
	public abstract List<StudentBean> studentlist(int pagesize,int startpage);
	//学生生日操作
	public abstract List<StudentBean> studentbirthdaylist(int pagesize,int startpage,int leibie);
	//查询余额
	public abstract double summoney(String moneyname,String tablename,String userid); 
	//保存余额
	public abstract void insertmoney(String summoney,int userid,String pwd);
	//保存余额
	public abstract void updatemoney(String summoney,int userid);
	public abstract void updatemoney(String summoney,String userid);
	//保存余额
	public abstract void updatezhifupwd(String pwd,int userid);
	//查询余额
	public abstract MoneyBean money (String userid);
	public abstract String findstudentname(String studentid);
	public abstract StudentBean findstudentinfo(String studentmobile);
	//省份名称语句
	public abstract Provincebean findprovincename(String provinceid);
	
	public abstract int provinceid (String provincename);
	
	public abstract int cityid (String cityname);
	
	public abstract StudentBean findstudent(String studentname);
	public abstract void checkteacher(String studentname,String status);
	
	public abstract StudentBean checkstudentlogin(String studentname);
	public abstract TeacherBean checkteacherlogin(String teachername);
	
	//银行表语句
	//查询语句
	public abstract List<BankBean> banklist();
	public abstract BankBean bankbe(String bankname);
	
	
	//优惠券活动表
	
	
//管理员语句
	
	public List<ExchangeRecordBean> activelist ();
	public void activeadd(ExchangeRecordBean bean);
	public void activedel(String activeid);
	public void activeupdate(ExchangeRecordBean bean);
	public ExchangeRecordBean findactivemanger (String activeid);
	public abstract List<ExchangeRecordBean> activelist(int pagesize,int startpage);
	public abstract List<ExchangeRecordBean> activelist(int pagesize,int startpage,String username);
	public abstract ManagerBean checkmanagerlogin(String managername);
	public abstract ManagerBean findmanager(String managername);
//课程表语句
	//课程列表
	public List<CourseBean> courselist ();
	//课程的添加
	public void courseadd(CourseBean bean);
	//课程的删除
	public void coursedel(String courseid);
	//课程的更新
	public void courseupdate(CourseBean bean);
	//查找课程
	public CourseBean findcoursemanger (String courseid);
	//查找课程
	public CourseBean findcourse (String teacherid);
	//分页列表
	public abstract List<CourseBean> courselist(int pagesize,int startpage);
	public abstract List<CourseBean> findcourselist(int pagesize,int startpage,String ifvalue);
	//查看我发布的课程
	public abstract List<CourseBean> courselist(String username,int pagesize,int startpage);
	
	public abstract void updatecoursestatus(String courseid,String status,String reason); 
	public List<CourseBean> courselist(String username,int pagesize,int startpage,String word);
//学生语句
	
	//查询语句
	public abstract List<TeacherBean> teacherlist();
	//删除语句
	public abstract void teacherdel(String teacherid);
	//删除语句
	public abstract void teacherdelete(String teachername);
	//更新语句
	public abstract void teacherupdate(TeacherBean teacherbean);
	//更新银行语句
	public abstract void teacherbankupdate(TeacherBean teacherbean);
	//添加语句
	public abstract void teacheradd(TeacherBean teacherbean);
	//查询教师的资料
	public abstract TeacherBean checkteacherinfo(String teachername);
	//提交审核的语句
	public abstract void updatereason(String sectionid);
	//更改头像
	public abstract void updateface(String tablename,String picturename,String pictureurl,String username,String name);
	public abstract TeacherBean findteacherpwd(String teachername);
	
	public abstract void updatestatus(String sectionid,String status,String reason);
	//教师分页的语句
	public abstract List<TeacherBean> taecherlist(int pagesize,int startpage);
	//银行名称语句
	public abstract BankBean findbankname(String bankid);
	//查找单个教师
	public abstract TeacherBean findteacher(String teacherid);
	public abstract TeacherBean findstudenttoteacher(String studentmobile);
	//查找单个教师
	public abstract TeacherBean findmyinfo(String teachername);
	public abstract TeacherBean teacherbean(String teachername);
	//更新密码
	public abstract void teacherpwdupdate (String teacherid,String teacherpwd); 
	public abstract GreadBean findgreadname (String greadid);
	public abstract CourseBean findcoursename (String coursename);
	///================发布课程====================
	//查询语句
	public abstract List<SectionBean> sectionlist();
	//查询语句
	public abstract List<SectionBean> sectionlist(String courseid);
	//删除语句
	public abstract void sectiondel(String sectionid);
	//更新语句
	public abstract void sectionupdate(SectionBean sectionbean);
	//添加语句
	public abstract void sectionadd(SectionBean sectionbean);
	//教师分页的语句
	public abstract List<SectionBean> sectionbeanlist(int pagesize,int startpage);
	//教师分页的语句
	public abstract List<SectionBean> sectionlist(int pagesize,int startpage,String courseid);
	public abstract void checkfree (String sectionid,String isfree);
	//银行名称语句
	public abstract SectionBean findsection(String sectionid);
	//====================管理员===========
	public abstract List<SectionBean> sectionbeanlist(int pagesize,int startpage,String reason);
	public abstract int listbarsum(String studentid);
	//===============充值表==============
	//查询语句
	public abstract List<MoneyRecordBean> moneylist(int pagesize,int startpage,String username);
	//删除语句
	public abstract void moneydel(String recordid);
	//添加语句
	public abstract void moneyadd(MoneyRecordBean moneyrecordbean);
	public abstract int listsum();
	public abstract List<CourseBean> courlistwithsection(int pagesize,int startpage); 
	public abstract CourseBean courlistandsection(int n); 
	public abstract CourseBean courselistandsection(String courseid);
	
	//==============新闻资讯表==============
	public abstract List<NewmsgBean> msglist(int pagesize,int startpage);
	public abstract void newsmsgadd(NewmsgBean newmsgbean);
	public abstract void newsmsgdelete(String newmsgid);
	public abstract void newsmsgupdte(NewmsgBean newmsgbean);
	public abstract NewmsgBean findnewsmsg(String newmsgid);
	//================查找优惠券==============
	public abstract List<ExchangeCodeBean> exchangecodelist(String userid);
	public abstract List<ExchangeCodeBean> exchangecodelist(int pagesize,int startpage,String userid);
	public abstract List<ExchangeCodeBean> myreplaylist(int pagesize,int startpage,String username);
	public abstract List<ExchangeCodeBean> exchangecodelist(int pagesize,int startpage);
	public abstract List<ExchangeCodeBean> myecodelist(int pagesize,int startpage,String replayname,int activityid);
	public abstract List<ExchangeCodeBean> myecodelist1(int pagesize,int startpage,String replayname,int activityid);
	public abstract void exchangecodedelete(String userid,String money,String code);
	public abstract void exchangecodedelete(String codeid);
	public abstract void exchangecodeupdate(ExchangeCodeBean exchangecodebean);
	public abstract void exchangecodeupdatestatus(String status,String id);
	public abstract ExchangeCodeBean findexchangecode(String conname,String value);
	public abstract ExchangeCodeBean findexcodebean(String codeid);
	public abstract ExchangeCodeBean findecode(String status,String username);
	public abstract void exchangecodeadd(ExchangeCodeBean exchangecodebean,int num);
	public abstract int exchangecodesum(String userid);
	public abstract int exchangecodesum();
	
	//===========讲师余额的新增，查询=============
	public abstract void teachermoneyadd(TeacherMoneyBean teachermoneybean);
	public abstract TeacherMoneyBean teacherbeanlist(String teacherid);
	public abstract void teachermoneyupdate(String teacherid,String money);
	public abstract void updateteachermoney(String summoney,String teacherid);
	
	//===========缴费购买课程==============
	public abstract void payrecodeadd(PayRecordBean payrecordbean);
	public abstract List<PayRecordBean> payrecodelist(int pagesize,int startpage,String status,int studentid);
	public abstract List<PayRecordBean> payrecodelist(int pagesize,int startpage,String status,String studentid);
	public abstract void payrecodedelete(String payrecodeid);
	public abstract int payrecodebarsum(String status,String conclum,String value);
	public abstract void payrecodeupdate(String iscash,String recodeid);
	public abstract List<PayRecordBean> payrecodetixian(int pagesize,int startpage,String iscash,String status);
	public abstract PayRecordBean findpayrecode(String recodeid);
	public abstract PayRecordBean findcode(String recodename);
	public abstract List<UserCourseEvalBean> pingjialist(String codeid);
	public List<MoneyRecordBean> findmoneylist(int pagesize, int startpage,String studentid,String ifvalue);
	public abstract List<PayRecordBean> findpayrecodelist(int pagesize,int startpage,String status,int studentid,String ifvalue); 
	public abstract void updatepaystatus(String payid,String status); 
	//==========提现记录表================
	public abstract void cashrecordadd(CashRecordBean cashbean);
	//==============购物车================
	public abstract void shopcaradd(ShoppingcarBean shopcarbean);
	public abstract void shopcardelete(String carid);
	public abstract int shopcarbarsum(String studentname);
	public abstract ShoppingcarBean findshopcar(String courseid,String studentid);
	public abstract List<ShoppingcarBean> shopcarlist(int pagesize,int startpage,String studentname);
	//=============审核=====
	public abstract int barsum(String sql);
	public abstract List<TeacherBean> checkList(int pagesize,int startpage,String status);
	public abstract void checkteacher(String teacherid,String status,String reason);
	//==============用户评价===================
	public abstract void pingjiaadd(UserCourseEvalBean pingjia);
	public abstract List<UserCourseEvalBean> codelist();
	public abstract List<UserCourseEvalBean> codelist(int pagesize,int startpage);
	public abstract UserCourseEvalBean findcode(String userid,String courseid);
	public abstract List<UserCourseEvalBean> findpingjia(String courseid);
	//==============在线留言板=================
	public abstract List<ForumBean> liuyanlist(int pagesize,int startpage,String myid,String sc);
	public abstract List<ForumBean> liuyanlist(int pagesize,int startpage,int myid);
	public abstract List<ForumBean> liuyanlist(int pagesize,int startpage);
	public abstract ForumBean liuyanadd(ForumBean forumBean);
	public abstract void liuyandel(String forid);
	public abstract ForumBean findliuyan(String forid);
	public abstract void liuyanupdate(ForumBean forumBean);
	public abstract String pingtai();
	public abstract void pingtaiadd(String money);
	public abstract void pingtaiupdate(String money);
	//==============积分查询===========
	public abstract void jifenupdate(JifenBean jifenbean);
	public abstract JifenBean jifenlist(String teacherid);
	public abstract void jifenadd(JifenBean jifenbean);
	public abstract void updateteachergread(String gradeid,String teacherid);
	//===============搜索==================
	public abstract List<CourseBean> courselist(String coursename);
	public abstract List<CourseBean> courselist(int courseid);
	//更改金额
	public abstract void courseupdate(int money,int courseid);
	public abstract String img(String column,String tablename,String tablecolumn,String mobile);
	//会员的操作
	public abstract List<VIPBean> viplist();
	public abstract List<VIPBean> viplist(int pagesize,int startpage);
	public abstract VIPBean findvip(String vipid);
	public abstract void delvip(String vipid);
	public abstract void updatevip(VIPBean vipbean);
	public abstract void addvip(VIPBean vipbean);
	//修改学生的状态
	public abstract void updatestudentVIP(String studentid);
	//退款语句
	public abstract Refund findfund(String courseid,String sectionid);
	public abstract void addfund(Refund refund);
	public abstract void deletefund(String fundid);
	public abstract List<Refund> refundlist(String ifvalue);
	public abstract List<Refund> refundlist(int pagesize,int startpage,String ifvalue);
	public abstract Refund updaterefund(String refundid,String ifvalue);
	public abstract void updatesavefund(Refund refund);
	//讲师处理退款操作
	public abstract void addteacherfund(Refund refund);
	public abstract List<Refund> refundteacherlist(int pagesize, int startpage, String ifvalue);
	public abstract void updatesaveteacherfund(Refund refund);
	public abstract Refund findteacherrefund(String refundid);
	public abstract void refundstudentmoney(String studentid,float money);
	public abstract void refundupdateteachermoney(String summoney, String teacherid);
	//日志文件的操作
	public abstract List<SysLogBean> loglist();
	public abstract List<SysLogBean> loglist(int pagesize, int startpage);
	public abstract void deletelog(String syslogid);
	public abstract void addlog(SysLogBean syslogbean);
	//用户生日操作
	public abstract void addbirthday(BirthdayBean birthday);
	public abstract List<BirthdayBean> birthdaylist(int pagesize, int startpage);
	public abstract int sumnewmsg(String studentid);
	public abstract BirthdayBean findbirthday(String ifvalue);
	public abstract void updatebirthday(int money,String ifvalue);
	public abstract void updatebirthdaystatus(int status,String ifvalue);
}

