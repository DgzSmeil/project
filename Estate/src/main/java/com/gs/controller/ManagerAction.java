package com.gs.controller;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.gs.code.GetPhoneMessage;
import com.gs.common.bean.ControllerResult;
import com.gs.pojo.Manager;
import com.gs.service.ManagerService;
import com.opensymphony.xwork2.ActionSupport;


public class ManagerAction extends ActionSupport
{
	private static final long serialVersionUID = -8877079457557056405L;

	private Manager manager;
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	private String phonecode;
	public String getRemmberpassword() {
		return remmberpassword;
	}
	public void setRemmberpassword(String remmberpassword) {
		this.remmberpassword = remmberpassword;
	}

	private String remmberpassword="";
	private ControllerResult controllerResult; // 用于action的方法返回json格式的结果到前台页面
	public ControllerResult getControllerResult() {
		return controllerResult;
	}
	public String getPhonecode() {
		return phonecode;
	}
	public void setPhonecode(String phonecode) {
		this.phonecode = phonecode;
	}
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	private ManagerService managerService;
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	HttpServletResponse response=ServletActionContext.getResponse();
	
	static String number="88888";
	
	public String shouye() throws Exception {
		return "home";
	}
	public String submitpage() throws Exception {
		return "submit";
	}
	public String loginpage() throws Exception {
		Object object=session.getAttribute("manager");
		String managerName="";
		String password="";
		if(object==null)
		{
			Cookie[] cookies=request.getCookies();
			if(cookies!=null&&cookies.length>0)
			{
				for(int i=0;i<cookies.length;i++)
				{
					Cookie cookie=cookies[i];
					if(("name").equals(cookie.getName()))
					{
						managerName=cookie.getValue().trim();
					}
					if(("password").equals(cookie.getName()))
					{
						password=cookie.getValue().trim();
					}
					if(managerName!=null&&password!=null&&(!managerName.equals(""))&&(!password.equals("")))
					{
						
						Manager mg5=(Manager)managerService.login(managerName, password);
						//Manager mg5=(Manager)managerService.queryByDC(mg4);
						
						if(mg5!=null)
						{
							session.setAttribute("manager", mg5);
							return "autologin";
						}
						
					}
				}
			}
		}
		
		return "login";
	}
	public String mgnInfo() throws Exception {
		manager=(Manager)session.getAttribute("manager");
		return "mgnInfo";
	}
	public String mgnUpPwdPage() throws Exception {
		manager=(Manager)session.getAttribute("manager");
		return "mgnUpPwdPage";
	}
	public String mgnUpPwd() throws Exception {
		managerService.updatePwd(manager.getPwd(), manager.getId());
		Manager manager1=(Manager)session.getAttribute("manager");
		manager1.setPwd(manager.getPwd());
		session.setAttribute("manager",manager1);
		return "home";
	}
	public String mgnUpPage() throws Exception {
		manager=(Manager)session.getAttribute("manager");
		return "mgnUpPage";
	}
	public String mgnUp() throws Exception {
		managerService.update(manager);
		session.setAttribute("manager",manager);
		return "home";
	}
	public String enterMngSys() throws Exception {
		return "mngsys";
	}
	public String submit() throws Exception {
		String s=manager.getPwd();
		manager.setPwd(s);
	    managerService.add(manager);
		return "login";
	}
	
	public String login() throws Exception {
		if(session.getAttribute("manager")==null)
		{
				Manager mg1=null;
				mg1=managerService.login(manager.getName(), manager.getPwd());
				if(mg1!=null){
						session.setAttribute("manager", mg1);
						if(remmberpassword!=null&&(!remmberpassword.equals("")))
						{
							
							Cookie NameCookie=new Cookie("name",mg1.getName());
							NameCookie.setMaxAge(60*60*24*30);
							NameCookie.setPath("/");
							response.addCookie(NameCookie);
							
							Cookie passwordCookie=new Cookie("password", mg1.getPwd());
							passwordCookie.setMaxAge(60*60*24*30);
							passwordCookie.setPath("/");
							response.addCookie(passwordCookie);
						}
						return "mngsys";
				
				}else {
					request.setAttribute("loginerror", "1");
					return "login";
				}
			
			}else {
				
				return "mngsys";
			}
	}
	public String phonelogin() throws Exception {
				Manager users3=null;
				users3=managerService.phonelogin(manager.getPhone());
				if(users3!=null)
				{
					session.setAttribute("manager", users3);
					if(remmberpassword!=null&&(!remmberpassword.equals("")))
					{
						Cookie NameCookie=new Cookie("name",users3.getName());
						NameCookie.setMaxAge(60*60*24*30);
						NameCookie.setPath("/");
						response.addCookie(NameCookie);
						
						Cookie passwordCookie=new Cookie("password", users3.getPwd());
						passwordCookie.setMaxAge(60*60*24*30);
						passwordCookie.setPath("/");
						response.addCookie(passwordCookie);
					}
					return "mngsys";
				}else {
					return null;
				}
			
	}
	public String logout() throws Exception {
		Object object=session.getAttribute("manager");
		if(object!=null)
		{
			session.setAttribute("manager",null);
			Cookie userNameCookie=new Cookie("name",null);
			userNameCookie.setMaxAge(60*60*24*30);
			userNameCookie.setPath("/");
			response.addCookie(userNameCookie);
			Cookie passwordCookie=new Cookie("password", null);
			passwordCookie.setMaxAge(60*60*24*30);
			passwordCookie.setPath("/");
			response.addCookie(passwordCookie);
		}
		
		return "logoutpage";
	}
	public String agencyManagement() throws Exception {
	
		return "agencyManagement";
	}
	public String getvalidatecode() throws Exception {
		GetPhoneMessage gpm = new GetPhoneMessage();
		Manager users2=new Manager();
		users2=managerService.phonelogin(manager.getPhone());
		if(users2!=null)
		{
			phonecode = gpm.getResult(manager.getPhone());
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(phonecode);
			out.flush();
			out.close();
			return null;
		}else {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("0");
			out.flush();
			out.close();
			return null;
		}
	}

	
}
