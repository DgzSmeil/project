package SQLservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import API.SendEmail;
import SQLBase.SQLSentenceimp;
import SQLBean.Citybean;
import SQLBean.Provincebean;

public class myinfoservlet extends HttpServlet {

	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String order = request.getParameter("order");
		HttpSession session =request.getSession();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println(order+"===========");
		if(order!=null){
			if(order.equals("info")){
				List<Provincebean> provincelsit = sql.provincelist();
				session.setAttribute("provincelist", provincelsit);
				request.getRequestDispatcher("datainfo/info.jsp").forward(request, response);
			}else if (order.equals("changecity")) {
				String provinceid = request.getParameter("provinceid");
				List<Citybean> citylist = sql.cityalllist(provinceid); 
				String data = JSON.toJSONString(citylist);
				out.print(data);
				System.out.println(data);
			}else if (order.equals("email")) {
				String receiveEmail = request.getParameter("code");
		        String receiveNick="站长:陈飞龙";
		        String subject="【IT课堂】验证码";
		        int code = new Random().nextInt(100000)+899999;
		        String contents="【IT课堂】绑定邮箱的验证码为："+code;
		        SendEmail.sendMail(receiveEmail, receiveNick, subject, contents);
		        out.print(code);
			}
			
		}
	}

}
