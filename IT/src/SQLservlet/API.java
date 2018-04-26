package SQLservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import API.GetPhoneMessage;
import API.HttpClientUtil;

public class API extends HttpServlet {

	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String order = request.getParameter("order");
		PrintWriter out = response.getWriter();
		if(order!=null){
			if(order.equals("sendcode")){
				//用户名
				String Uid = "絮落锦乡1";
				
				//接口安全秘钥
				String Key = "82aa7c832e792c060f8d";
				
				//手机号码，多个号码如13800000000,13800000001,13800000002
				String smsMob = request.getParameter("phone");
				System.out.println(smsMob+"=========");
				int code=new Random().nextInt(899999)+100000;
				//短信内容
				String smsText = "【IT课堂】找回密码,验证码为:"+code+"。10分钟之内有效";
				//发送验证码
				HttpClientUtil client = HttpClientUtil.getInstance();
				//UTF发送
				int result = client.sendMsgUtf8(Uid, Key, smsText, smsMob);
				if(result>0){
					System.out.println("UTF8成功发送条数=="+result);
				}else{
					System.out.println(client.getErrorMsg(result));
				}
				request.setAttribute("code", code);
				out.print(code);
			}else if (order.equals("msg")) {
				String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
				HttpClient client = new HttpClient();
				PostMethod method = new PostMethod(Url);

				client.getParams().setContentCharset("utf-8");
				method.setRequestHeader("ContentType",
						"application/x-www-form-urlencoded;charset=utf-8");

				int mobile_code = (int) ((Math.random() * 9 + 1) * 100000);

				String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
				System.out.println(mobile_code + "===============");
				out.print(mobile_code);
				NameValuePair[] data = {// 提交短信
				new NameValuePair("account", "C90250628"), // 查看用户名请登录用户中心->验证码、通知短信->帐户及签名设置->APIID
				new NameValuePair("password",
						"29c21ba933ab885cebaf635691a4080f"), // 查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
				new NameValuePair("mobile", "17607975702"),
				new NameValuePair("content", content), };
				method.setRequestBody(data);

				try {
					client.executeMethod(method);

					String SubmitResult = method.getResponseBodyAsString();

					// System.out.println(SubmitResult);

					Document doc = DocumentHelper.parseText(SubmitResult);
					Element root = doc.getRootElement();

					String code = root.elementText("code");
					String msg = root.elementText("msg");
					String smsid = root.elementText("smsid");

					System.out.println(code);
					System.out.println(msg);
					System.out.println(smsid);
					if ("2".equals(code)) {
						System.out.println("短信提交成功");
					}

				} catch (HttpException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (DocumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

}
