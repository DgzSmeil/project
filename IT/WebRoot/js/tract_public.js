//日志公用部分

var vv_log = {
	cookieKey : 'cookiename',  //cookie名称,
	timestamp : function(){
		return new Date().getTime(); //毫秒数
	},
	setCookie : function(name, value, iDay){ //设置cookie
		var oDate = new Date();
		oDate.setTime(oDate.getTime() + iDay*24*60*60*1000); 
		var dateStr = ( iDay == 0 ) ? '' : ';expires='+oDate.toGMTString();
		document.cookie = name+'='+value+dateStr+';path=/';
	},
	randomChar : function(n){  //取出随机不重复的cookie
		var  x="qwertyuioplkjhgfdsazxcvbnmABCDEFGHIGKLMNOPQRSTUVWXYZ";
		var  tmp="";
		var timestamp = new Date().getTime(); //毫秒数
		var appname = navigator.appName; //浏览器类型
		var appVersion = navigator.appVersion; //浏览器版本
		var userAgent = navigator.userAgent.replace(/;/g,':');  //用户代理
		var random = Math.floor(Math.random()*1000000);

		for(var  i=0;i<n;i++)  {
			tmp  += x.charAt(Math.floor(Math.random()*x.length));
		}
		return  faultylabs.MD5(timestamp+userAgent+random)+tmp;  //MD5加密
	},
	getCookie : function(name){
		var arr = document.cookie.split('; ');
		var i = 0;
		for(i=0; i<arr.length; i++) {
			var arr2 = arr[i].split('=');
			if(arr2[0] == name) {return arr2[1];}
		}
		return '';
	},
	isCookie : function(name){
		var arr = document.cookie.match(new RegExp("(^| )" + name
					 + "=([^;]*)(;|$)"));	
		if(arr == null){
			this.setCookie(name,this.randomChar(4),3650);
		}
		return this.getCookie(name);
	},
	from_referrer : function(){
		var referrer = '';
		referrer = document.referrer;
		return referrer;
	},
	cur_url : function(){
		return window.location.href;
	},
	send : function(str){ 
		//是不是要判断浏览器呢 IE用curl发，其它用 js 发

		// if(navigator.appName == 'Microsoft Internet Explorer'){
			
		// }else{
			
		// }
		str = encodeURIComponent('[{"headers":{"host":"cc-staging-loginmgr2"},"body":"'+str+'"}]');
		$.ajax({
		   url:'/index.php?do=tract&m=sends',
		   type: "POST",
		   data: {'str':str,'url':'http://da.51cto.com'},
		   success: function (json) {
				//console.log('');
		   }
		});
	}
}
	