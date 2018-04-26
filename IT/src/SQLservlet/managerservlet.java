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
import SQLBean.ManagerBean;
import SQLBean.PagingBean;
import SQLBean.SysLogBean;
import SQLup.Filename;

import com.oreilly.servlet.MultipartRequest;

public class managerservlet extends HttpServlet {

	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		if(request.getParameter("order")!=null){
			String order = request.getParameter("order");
			if(order.equals("delete")){
				ManagerBean mana = (ManagerBean)session.getAttribute("managerbean");
				ManagerBean managerbean = sql.findmanger(mana.getManager_id()+"");
				if(managerbean.getManager_leibie()!=1){
					request.setAttribute("msg", "删除失败，您的权限不足，此操作需要超级管理员权限");
					paginglist(request, response);
					request.getRequestDispatcher("data/managerselect.jsp").forward(request, response);
					return;
				}else {
				   	sql.managerdel(request.getParameter("managerid"));
				   	SysLogBean sysLogBean = new SysLogBean();
				   	sysLogBean.setIpaddress(request.getRemoteAddr());
				   	sysLogBean.setCountent("执行删除的管理员操作");
				   	sysLogBean.setManagerid(mana.getManager_id());
				   	sysLogBean.setTypetext(2);
				   	sql.addlog(sysLogBean);
				   	paginglist(request, response);
					request.getRequestDispatcher("data/managerselect.jsp").forward(request, response);
				}
			}else if(order.equals("manageradd")){
				ManagerBean managerBean = (ManagerBean)session.getAttribute("managerbean1");
				ManagerBean bean = new ManagerBean();
				bean.setManager_account(request.getParameter("manager_account"));
				bean.setManager_name(request.getParameter("manager_name"));
				String password = request.getParameter("manager_password");
				password = AesUtils.encryptStr(password, AesUtils.SECRETKEY);
				bean.setManager_password(password);
				bean.setManager_sex(Integer.parseInt(request.getParameter("manager_sex")));
				bean.setManager_contact(request.getParameter("manager_contact"));
				bean.setManager_status(1);
				bean.setManagerurl("upfile/1495973395422.jpg");
				sql.manageradd(bean);
				SysLogBean sysLogBean = new SysLogBean();
			   	sysLogBean.setIpaddress(request.getRemoteAddr());
			   	sysLogBean.setCountent("执行新增管理员操作");
			   	sysLogBean.setManagerid(managerBean.getManager_id());
			   	sysLogBean.setTypetext(0);
			   	sql.addlog(sysLogBean);
				paginglist(request, response);
				request.getRequestDispatcher("data/managerselect.jsp").forward(request, response);
			}else if(order.equals("list")){
				paginglist(request, response);
				request.getRequestDispatcher("data/managerselect.jsp").forward(request, response);
			}else if (order.equals("update")) {
				ManagerBean mana = (ManagerBean)session.getAttribute("managerbean");
				ManagerBean managerbean = sql.findmanger(mana.getManager_id()+"");
				request.setAttribute("managerbean", managerbean);
				session.setAttribute("managerbean", managerbean);
				request.getRequestDispatcher("data/managerupdate.jsp").forward(request, response);
			}else if (order.equals("change")) {
				String managerid = request.getParameter("managerid");
				ManagerBean managerbean1 = sql.findmanger(managerid);
				sql.changeleibie(managerid);
				ManagerBean managerbean = sql.findmanger(managerid);
				request.setAttribute("managerbean", managerbean);
				request.getRequestDispatcher("data/managerupdate.jsp").forward(request, response);
			}else if (order.equals("managerupdate")) {
				ManagerBean bean = new ManagerBean();
				bean.setManager_id(Integer.parseInt(request.getParameter("manager_id")));
				bean.setManager_account(request.getParameter("manager_account"));
				bean.setManager_name(request.getParameter("manager_name"));
				bean.setManager_sex(Integer.parseInt(request.getParameter("manager_sex")));
				bean.setManager_contact(request.getParameter("manager_contact"));
				sql.managerupdate(bean);
				SysLogBean sysLogBean = new SysLogBean();
			   	sysLogBean.setIpaddress(request.getRemoteAddr());
			   	sysLogBean.setCountent("执行修改管理员操作");
			   	sysLogBean.setManagerid(bean.getManager_id());
			   	sysLogBean.setTypetext(1);
			   	sql.addlog(sysLogBean);
				paginglist(request, response);
				request.getRequestDispatcher("data/managerselect.jsp").forward(request, response);
			}else if (order.equals("updatestatus")) {
				ManagerBean mana = (ManagerBean)session.getAttribute("managerbean1");
				ManagerBean managerbean = sql.findmanger(mana.getManager_id()+"");
				if(managerbean.getManager_leibie()!=1){
					request.setAttribute("msg", "更改失败，您的权限不足，此操作需要超级管理员权限");
					paginglist(request, response);
					request.getRequestDispatcher("data/managerselect.jsp").forward(request, response);
					return;
				}else {
					sql.checkstatus(request.getParameter("managerid"), request.getParameter("status"));
					paginglist(request, response);
					SysLogBean sysLogBean = new SysLogBean();
				   	sysLogBean.setIpaddress(request.getRemoteAddr());
				   	sysLogBean.setCountent("执行修改管理员的状态操作");
				   	sysLogBean.setManagerid(managerbean.getManager_id());
				   	sysLogBean.setTypetext(1);
				   	sql.addlog(sysLogBean);
					request.getRequestDispatcher("data/managerselect.jsp").forward(request, response);
				}
			}else if (order.equals("updatepassword")) {
				String managerid = request.getParameter("managerid");
				String managerpassword = AesUtils.encryptStr(request.getParameter("oldpassword"), AesUtils.SECRETKEY);
				ManagerBean managerbean = sql.findmanger(managerid);
				if (managerbean.getManager_password().equals(managerpassword)){
					sql.checkpwd(managerid, managerpassword,"manager","manager_password","manager_id");
					request.setAttribute("msg", "恭喜你！密码修改成功！");
					SysLogBean sysLogBean = new SysLogBean();
				   	sysLogBean.setIpaddress(request.getRemoteAddr());
				   	sysLogBean.setCountent("执行修改管理员的密码操作");
				   	sysLogBean.setManagerid(managerbean.getManager_id());
				   	sysLogBean.setTypetext(4);
				   	sql.addlog(sysLogBean);
					paginglist(request, response);
					request.getRequestDispatcher("data/managerselect.jsp").forward(request, response);
				}else {
					request.setAttribute("msg", "对不起！你输入的旧密码有误！请核对后再输！");
					paginglist(request, response);
					request.getRequestDispatcher("data/updatemanagerpwd.jsp").forward(request, response);
				}
			}else if (order.equals("initpassword")) {
				sql.checkpwd(request.getParameter("managerid"), AesUtils.encryptStr("666666", AesUtils.SECRETKEY),"manager","manager_password","manager_id");
				request.setAttribute("msg", "恭喜你！初始化密码成功！密码为：666666");
				paginglist(request, response);
				SysLogBean sysLogBean = new SysLogBean();
			   	sysLogBean.setIpaddress(request.getRemoteAddr());
			   	sysLogBean.setCountent("执行初始化管理员的密码操作");
			   	sysLogBean.setManagerid(Integer.parseInt(request.getParameter("managerid")));
			   	sysLogBean.setTypetext(4);
			   	sql.addlog(sysLogBean);
				request.getRequestDispatcher("data/managerselect.jsp").forward(request, response);
			}else if (order.equals("money")) {
				String money = sql.pingtai();
				request.setAttribute("money", money);
				request.getRequestDispatcher("data/pingtai.jsp").forward(request, response);
			}else if (order.equals("updateleibie")) {
				String managerid = request.getParameter("managerid");
				ManagerBean managerbean = sql.findmanger(managerid);
				request.setAttribute("managerbean", managerbean);
				request.getRequestDispatcher("data/managerupdateinfo.jsp").forward(request, response);
			}else if (order.equals("updateleibiesave")) {
				ManagerBean managerBean = (ManagerBean)session.getAttribute("managerbean");
				String leibie = request.getParameter("leibie");
				String reason = request.getParameter("reason");
				String managerid = request.getParameter("manager_id");
				sql.saveleibie(leibie, reason, managerBean.getManager_name(), managerid);
				SysLogBean sysLogBean = new SysLogBean();
			   	sysLogBean.setIpaddress(request.getRemoteAddr());
			   	sysLogBean.setCountent("管理员成为超级管理员的操作");
			   	sysLogBean.setManagerid(Integer.parseInt(managerid));
			   	sysLogBean.setTypetext(1);
			   	sql.addlog(sysLogBean);
				ManagerBean managerbean = sql.findmanger(managerid);
				request.setAttribute("managerbean", managerbean);
				request.getRequestDispatcher("data/managerupdateinfo.jsp").forward(request, response);
			}else if (order.equals("changejindu")) {
				String managerid = request.getParameter("managerid");
				ManagerBean managerbean = sql.findmanger(managerid);
				request.setAttribute("managerbean", managerbean);
				request.getRequestDispatcher("data/managerupdateinfo.jsp").forward(request, response);
			}else if (order.equals("loglist")) {
				paginglist1(request,response);
				request.getRequestDispatcher("data/loglist.jsp").forward(request, response);
			}else if (order.equals("deletelog")) {
				sql.deletelog(request.getParameter("syslogid"));
				paginglist1(request,response);
				request.getRequestDispatcher("data/loglist.jsp").forward(request, response);
			}
		}else {
			ManagerBean managerBean = (ManagerBean)session.getAttribute("managerbean");			MultipartRequest mr = null;
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
				sql.updateface("manager", "managerurl", "upfile/"+fileName, "manager_id", managerBean.getManager_id()+"");
				ManagerBean mana = (ManagerBean)session.getAttribute("managerbean");
				ManagerBean managerbean = sql.findmanger(mana.getManager_id()+"");
				request.setAttribute("managerbean", managerbean);
				session.setAttribute("managerbean", managerbean);
				SysLogBean sysLogBean = new SysLogBean();
			   	sysLogBean.setIpaddress(request.getRemoteAddr());
			   	sysLogBean.setCountent("管理员修改头像操作");
			   	sysLogBean.setManagerid(managerbean.getManager_id());
			   	sysLogBean.setTypetext(1);
			   	sql.addlog(sysLogBean);
				request.getRequestDispatcher("data/managerupdate.jsp").forward(request, response);			
			} catch (Exception e) {
				request.getRequestDispatcher("managerfaceup.jsp").forward(request, response);
				e.printStackTrace();
			}
		}
	}
	public void paginglist(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//实例化javabean，取参数
		PagingBean page = new PagingBean();
		//总记录条数，计算总页数
		page.setPagebarsum(sql.pagebarsum("manager"));
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
		List<ManagerBean> managerlist = sql.managerlist(page.getPagebarsize(),page.getStarlocal());
		request.setAttribute("managerlist", managerlist);
		request.setAttribute("pager", page);
	}
	public void paginglist1(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//实例化javabean，取参数
		PagingBean page = new PagingBean();
		//总记录条数，计算总页数
		page.setPagebarsum(sql.pagebarsum("syslog"));
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
		List<SysLogBean> sysloglist = sql.loglist(page.getPagebarsize(),page.getStarlocal());
		request.setAttribute("sysloglist", sysloglist);
		request.setAttribute("pager", page);
	}
}
