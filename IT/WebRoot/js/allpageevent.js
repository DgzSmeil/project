$(function(){
    //设置COOKIE
    if(typeof(setCookie) == 'undefined'){
        function setCookie(name, value, iDay) {
            var oDate = new Date();
            oDate.setTime(oDate.getTime() + iDay*1000); 
            var dateStr = ( iDay == 0 ) ? '' : ';expires='+oDate.toGMTString();
            document.cookie = name+'='+value+dateStr+';path=/';
        }
        //获取cookie
        function getCookie(name) {
            var arr = document.cookie.split('; ');
            var i = 0;
            for(i=0; i<arr.length; i++) {
                var arr2 = arr[i].split('=');
                if(arr2[0] == name) {return arr2[1];}
            }
            return '';
        }
        //删除cookie
        function removeCookie(name) {
            setCookie(name,'',-1);
        }
    }
});
