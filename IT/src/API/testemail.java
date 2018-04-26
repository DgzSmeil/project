package API;

import java.util.Random;

public class testemail {

	 public static void main(String[] args) {
	        String receiveEmail = "275300091@qq.com";
	        String receiveNick="陈飞龙";
	        String subject="【IT课堂】验证码";
	        int code = new Random().nextInt(100000)+899999;
	        String contents="【IT课堂】绑定邮箱的验证码为："+code;
	        SendEmail.sendMail(receiveEmail, receiveNick, subject, contents);
	    }
}
