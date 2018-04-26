package com.gs.filter;

import java.util.Map;

import com.gs.pojo.Agency;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class FilterInterceptor  extends MethodFilterInterceptor{
	 private static final long serialVersionUID = 1L;
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		  //取得请求相关的ActionContext实例 
		  ActionContext ctx = invocation.getInvocationContext(); 
		  Map session = ctx.getSession(); 
		  //取出名为user的Session属性 
		  Agency  agengcy = (Agency)session.get("agency"); 
		  
		  //没有登陆，将服务器提示设置成一个HttpServletRequest属性 
		  if (agengcy != null  ) 
		  { 
		  return invocation.invoke(); 
		  } 
		  ctx.put("error" , "您还没有登陆，请输入账号,密码登陆系统"); 
		  //直接返回login的逻辑视图 
		  return "login"; 
	}

	}