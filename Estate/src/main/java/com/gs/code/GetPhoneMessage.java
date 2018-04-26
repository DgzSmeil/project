package com.gs.code;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Random;

//import net.sf.json.JSONObject;

/**
 * 获取短信验证码
 * @author Administrator
 * May 21, 2017
 */
public class GetPhoneMessage {
	/**
	 * 用户ID
	 */
	public  final String ACCOUNT_SID = "f6dce197de394e8996d0488a886c00e6";
	/**
	 * 密匙
	 */
	public  final String AUTH_TOKEN = "9cb704ba5fe9455e9fa992601ddd35cf";
	/**
	 * 请求地址前半部分
	 */
	public  final String BASE_URL = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	//验证码
	public  String randNum = new Random().nextInt(899999)+100000+"";
	public  String smsContent = "【房天下】欢迎加盟房天下管理平台您的验证码为"+randNum+",打死都不要告诉别人哦";//账号内已有模板
	/**
	 * 获取短信验证码
	 * @param to
	 * @return
	 */
	public  String getResult(String to){
		String args = QueryUtil.queryArguments(ACCOUNT_SID, AUTH_TOKEN, smsContent, to);
		OutputStreamWriter out = null;
		BufferedReader br = null;
		StringBuffer sb = new StringBuffer();
		try {
			URL url = new URL(BASE_URL);
			URLConnection connection = url.openConnection();//打开链接
			connection.setDoOutput(true);
			connection.setDoInput(true);
			//设置响应时间:5秒还未请求到就取消请求———链接超时
			connection.setConnectTimeout(5000);
			//设置读取的响应时间————读取超时
			connection.setReadTimeout(10000);
			//提交数据
			out = new OutputStreamWriter(connection.getOutputStream(),"utf-8");
			out.write(args);
			out.flush();
			//读取返回数据
			br = new BufferedReader(new InputStreamReader(connection.getInputStream()));//节点流
			//循环读取
			String line = "";
			while((line = br.readLine()) != null){
				sb.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{//关闭流
			try {
				if(br != null){
					br.close();
				}
				if(out != null){
					out.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
//		JSONObject jsonObject = JSONObject.fromObject(sb.toString());
//		Object object = jsonObject.get("respCode");
//		if(!object.equals("00000")){
//			System.out.println("异常编码："+object);
//			return "error";
//		}else {
////			System.out.println("正常编码："+object);
//			return randNum;
//		}
		return args;
	}
	public GetPhoneMessage(){}
	
	public String  GetPhoneMessages(String phone){
		String result = getResult(phone);
		System.err.println(result);
		System.out.println("验证码是："+randNum);
		return result;
	}
	
}
