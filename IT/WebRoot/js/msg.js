$(function(){
    $(".jsUserSendMsg").click(function(){
        var msgAlertId = $.alert.show({
            'title':'发私信给用户',
             'obj':'.jsSendMsg',
             'showButton':true,
             'showCancelButton':true,
             'confirmButtonText':'发送',
             'onConfirm':function(){
                $("#"+msgAlertId +" input[name='userName']").blur();
                var title = $("#"+msgAlertId+" input[name='title']").val();
                var content = $("#"+msgAlertId+" textarea[name='content']").val();
                var userName =  $("#"+msgAlertId +" input[name='userName']").val();
                if(title.length == 0 || title.length > 30){
                    $("#"+msgAlertId+" .jsTitleError").show().html("主题请在30个字内");
                }else{
                    $("#"+msgAlertId+" .jsTitleError").hide().html("");
                }
                if(content.length == 0 || content.length > 500){
                    $("#"+msgAlertId+" .jsContentError").show().html("内容请在500个字内");
                }else{
                    $("#"+msgAlertId+" .jsContentError").hide().html("");
                }
                if($("#"+msgAlertId+" .jsUserNameError:visible").length == 0 && $("#"+msgAlertId+" .jsTitleError:visible").length == 0 && $("#"+msgAlertId+" .jsContentError:visible").length == 0){
                    $.ajax({
                        type:'post',
                        data:{userName:userName,subject:title,content:content,_csrf: yii.getCsrfToken()},
                        url:'/msg/send-msg',
                        async:false,
                        success:function(data){
                            if(data.error==false){
                                $.alert.close(-1);
                                $.message.show({
                                    text:'恭喜您，发送成功！',showCancelButton:false,
                                    showShadow:true});
                                    window.location.reload();
                            }else{
                                $.message.show({
                                    text:data.msg,
                                    showShadow:false});
                            }
                        },
                        error:function(){
                            $.message.show({
                                text:'对不起发送失败，请重新发送。',showCancelButton:false,
                                showShadow:true});
                            setTimeout(function(){
                                $.message.close(-1);
                            },1000);
                        }
                    });
                }
            }
        });
        $("#"+msgAlertId +" input[name='userName']").blur(function(){
            var msg = '';
            var userName = $(this).val();
            if( userName == ''){
                msg = '用户名不能为空！';
            }else{
                $.ajax({
                    type:'post',
                    data:{userName:userName,_csrf: yii.getCsrfToken()},
                    url:'/msg/check-exists-user-name',
                    async:false,
                    success:function(data){
                        if(data != -3){
                            msg = "用户名不存在！";
                        }
                    }
                });
            }
            if(msg){
                $("#"+msgAlertId+" .jsUserNameError").show().html(msg);
        }else{
            $("#"+msgAlertId+" .jsUserNameError").hide().html("");
        }
        });
    });
    $(".jsSetSelectChang a").click(function(){
        var status = $(this).attr('data-status');

        switch (status) {
            case "all": {
                selectAll("checkbox");
                break;
            }
            case "unAll":{
                unSelectAll("checkbox");
                break;
            }
            case "read":{
                unSelectAll("checkbox");
                selectAll("read");
                break;
            }
            case "unread":{
                unSelectAll("checkbox");
                selectAll("unread");
                break;
            }

        }
    });
    $(".jsSetMsgReadStatus a").click(function(){
        $_this = $(this);
        var status = $(this).attr('data-status');
        var idUserIds = [];
       if(status =='read'){
           idUserIds = getSelectValues("read");
           var isRead = 1;
       }else{
           idUserIds = getSelectValues("unread");
           var isRead = 0;
       }
        var msg = "所选私信已经为标记状态，无需设置";
        var ids =getSelectValues("")

        if(ids.length == 0 ){
            msg = '没有选中任何私信，请重新选择';
        }
        if(idUserIds.length){
            $.ajax({
                type:'post',
                data:{ids:idUserIds,isRead:isRead,_csrf: yii.getCsrfToken()},
                url:'/msg/change-read-msg',
                async:false,
                success:function(data){
                    if(data.error==false){
                       if(idUserIds){
                           var idsUserIdsArr = idUserIds.split(',');
                           for(var k in idsUserIdsArr){
                               if(status =='read'){
                                   $("#msg_"+idsUserIdsArr[k]).find('input').removeClass("unread").addClass('read');
                                   $("#msg_"+idsUserIdsArr[k]).find('.mtd_2').find("a b").removeClass("icon_mail_wd").addClass('icon_mail_yd');
                               }else{
                                   $("#msg_"+idsUserIdsArr[k]).find('input').removeClass("read").addClass('unread');
                                   $("#msg_"+idsUserIdsArr[k]).find('.mtd_2').find("a b").removeClass("icon_mail_yd").addClass('icon_mail_wd');
                               }

                           }
                       }
                    }
                }
            });
        }else{
            $.message.show({
                text:msg,showCancelButton:false,
                showShadow:true});
        }
        unSelectAll("checkbox");
        $_this.parents(".btn_gx").find("em").text('标记为');
        $_this.parents(".btn_gx").prev('div').find("span em").text("下拉勾选");
    });
    $(".jsDeleteReceMsg").click(function(){
        var ids = getSelectValues("");
        if(ids){
            $.message.show({
                text: '确定要删除收件箱私信么？',
                showShadow: true,
                onConfirm: function () {
                    $.message.close();
                    deleteReceMsg(ids);
                }
            });
        }else{
            $.message.show({
                text:'请选择删除收件箱私信！',showCancelButton:false,
                showShadow:true});
        }

    });
    $(".jsDeleteUserReceive").click(function(){
        var id = $(this).attr('data-id');
        $.message.show({
            text: '确定要删除此条私信么？',
            showShadow: true,
            onConfirm: function () {
                $.message.close();
                deleteReceMsg(id);
            }
        });
    });
    $(".jsDeleteAllReceMsg").click(function(){
        $.message.show({
            text: '确定要清空收件箱么？',
            showShadow: true,
            onConfirm: function () {
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    url: '/msg/delete-all-user-receive',
                    data: {_csrf: yii.getCsrfToken()},
                    success: function (res) {
                        $.message.close();
                       location.href ="/msg/inbox";
                    }
                });
            }
        });
    });

    function deleteReceMsg(ids){
        if(ids.length){
            $.ajax({
                type:'post',
                data:{ids:ids,_csrf: yii.getCsrfToken()},
                url:'/msg/delete-user-receive',
                async:false,
                success:function(data){
                    if(data.error==false){
                        if(ids){
                            var idsUserIdsArr = ids.split(',');
                            for(var k in idsUserIdsArr){
                                $("#msg_"+idsUserIdsArr[k]).remove();
                            }
                        }
                    }
                }
            });
        }
    }
    //++++++++++意见反馈
	 $(".popyjdatilfeedback").click(function(){	
			  var feedAlertId = $.alert.show({
                 'title':'意见反馈',
				 'obj':'.feedback',
				 'showButton':true,
				 'showCancelButton':false,
				 'width':'440',
				 'confirmButtonText':'提交',
				 'onConfirm':function(){  
				    var feedarea = $("#"+feedAlertId+" textarea[name='feedarea']").val();
                    var feedord = $("#"+feedAlertId+" input[name='feedord']").val();					
					$("#"+feedAlertId+" #cl_redp").hide().html("");
					$("#"+feedAlertId+" #c1_redb").hide().html("");
					$("#"+feedAlertId+" .fail_tj").hide().html("");					
					if(feedarea== '' ){
						$("#"+feedAlertId+" #cl_redp").show().html("意见或建议不能为空");
						return false;
					}				
                    if(strlenlig(feedarea) <4 ){						
						$("#"+feedAlertId+" #cl_redp").show().html("意见或建议不能少于2个汉字");
                        return false;						
					  }
					if(strlenlig(feedarea) >600){
						$("#"+feedAlertId+" #cl_redp").show().html("意见或建议不能大于300个汉字");
                        return false;						
					}
                    if(feedord== '' ){
						$("#"+feedAlertId+" #c1_redb").show().html("联系方式不能为空");
						return false;
					}
                    var emailformat =/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+(\.|-)+[-_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;  
					  if(feedord.indexOf("@")==-1){
						 var patten = /^[1-9][0-9]{4,15}$/;
						 if(!patten.test(feedord)){
                            $("#"+feedAlertId+" #c1_redb").show().html("请输入正确的QQ格式");
						    return false;							 
						  }
					  }else{
						  if(!emailformat.test(feedord)){							
							 $("#"+feedAlertId+" #c1_redb").show().html("请输入正确的邮箱格式");
							 return false;		
						  } 
					  }
                    $.ajax({						
                        type:'post',
                        data:{feedarea:feedarea,feedord:feedord,_csrf: yii.getCsrfToken()},
                        url:'/feed-back/set',
                        async:false,
                        success:function(data){							
                            if(data.error){								
								$(".Pop_btns").append("<span class='fail_tj'>"+data.msg+"</span>");								
							}else{								
								 $.alert.close(-1);
                                $.alert.show({
                                    'title':'意见反馈',
                                    'obj':'.feedbackstatus',
                                    'showButton':false,
                                    'showCancelButton':false,
                                    'width':'440'
                                });
                                $(".popsuctext ").show();

                            }
                        }
                    });		  
				 }          
            }); 
     })
 
    //发件箱删除操作
    $(".jsDeleteSendMsg").click(function(){
        var ids = getSelectValues("");
        if(ids){
            $.message.show({
                text: '确定要删除发件箱私信么？',
                showShadow: true,
                onConfirm: function () {
                    $.message.close();
                    deleteSendMsg(ids);
                }
            });
        }else{
            $.message.show({
                text:'请选择删除发件箱私信！',showCancelButton:false,
                showShadow:true});
        }


    });
    $(".jsDeleteUserSendMsg").click(function(){
        var id = $(this).attr('data-id');
        $.message.show({
            text: '确定要删除此条私信么？',
            showShadow: true,
            onConfirm: function () {
                $.message.close();
                deleteSendMsg(id);
            }
        });
    });
    $(".jsCleanAllSendMsg").click(function(){
        $.message.show({
            text: '确定要清空发件箱么？',
            showShadow: true,
            onConfirm: function () {
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    url: '/msg/delete-all-user-send',
                    data: {_csrf: yii.getCsrfToken()},
                    success: function (res) {
                        $.message.close();
                        location.href ="/msg/sendbox";
                    }
                });
            }
        });
    });

    function deleteSendMsg(ids){
        if(ids.length){
            $.ajax({
                type:'post',
                data:{ids:ids,_csrf: yii.getCsrfToken()},
                url:'/msg/delete-user-send',
                async:false,
                success:function(data){
                    if(data.error==false){
                        if(ids){
                            var idsUserIdsArr = ids.split(',');
                            for(var k in idsUserIdsArr){
                                $("#msg_"+idsUserIdsArr[k]).remove();
                            }
                        }
                    }
                }
            });
        }
    }
});


/*
 * 删除通知
 * */

function updateNotifySta(ID){
    if(!ID){
        return ;
    }
    var alertId = $.message.show({
        text:'确定删除此通知？',
        type:'info',
        showShadow:true,
        onConfirm:function(){
            $.ajax({
                datatype:'json',
                type:'post',
                url:'/msg/update-notify-status',
                data:{"notifyId":ID,"_csrf":yii.getCsrfToken()},
                success:function(data){
                    $("#jsConListNotify"+ID).remove();
                    closeMess();
                }
            })
        }
    });

}

function strlenlig(str){  
  var len = 0;
    for (var i=0; i<str.length; i++) { 
     var c = str.charCodeAt(i); 
    //单字节加1 
     if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) { 
       len++; 
     } 
     else { 
      len+=2; 
     } 
    } 
    return len;
} 
//回复提交
$(function(){
    $(".jsMsgReplySubmit").click(function(){
        var content = $("#jsMsgReplyForm textarea[name='content']").val();
        if(content == ''){
                $("#jsMsgReplyForm textarea[name='content']").css('border-color',"#ff4400");
                return ;
        }else{
            $("#jsMsgReplyForm textarea[name='content']").css('border-color',"");
        }
        if(strlenlig(content)>500){
            $("#jsMsgReplyForm .jsMsgReplyError").show().html("最多输入500个字");
            return ;
        }else{
            $("#jsMsgReplyForm .jsMsgReplyError").hide().html("");
        }
        $("#jsMsgReplyForm").submit();
        $("#jsMsgReplyForm textarea[name='content']").val("");


    });
    $("#jsGetGuess ul li").click(function(){
        var type = $(this).attr('data-type');
        var index = $(this).index();
        if(type && (type =='blog' || type =='down' || type =='bbs' || type =='edu')){
            var content = $.trim($("#jsGetGuess").next('.Hottext_tabbox').find("ul").eq(index).html());
            if(content !=''){
                return ;
            }
            $("#jsGetGuess").next('.Hottext_tabbox').find("ul").eq(index).append("<li><div class='ajax_load'></div></li>");
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: '/msg/ajax-get-guess',
                data: {_csrf: yii.getCsrfToken(),type:type},
                success: function (res) {
                    var guess = "";
                    if(res){
                        for(var k in res){
                            guess += '<li class="Hottext t14"><a title="'+res[k].title+'" target="_blank" href="'+res[k].url+'" class="cl_3">'+res[k].title+'</a></li>';
                        }
                    }
                    $("#jsGetGuess").next('.Hottext_tabbox').find("ul").eq(index).html("");
                    $("#jsGetGuess").next('.Hottext_tabbox').find("ul").eq(index).html(guess);
                }

            });

        }
    });
    $("#jsGetNewHot ul li").click(function(){
        var type = $(this).attr('data-type');
        var index = $(this).index();
        if(type && (type =='blog' || type =='down' || type =='bbs' || type=='edu')){
           var content = $.trim($("#jsGetNewHot").next('.Hottext_tabbox').find("ul").eq(index).html());
            if(content !=''){
                return ;
            }
            $("#jsGetNewHot").next('.Hottext_tabbox').find("ul").eq(index).append("<li><div class='ajax_load'></div></li>");
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: '/msg/ajax-get-newhot',
                data: {_csrf: yii.getCsrfToken(),type:type},
                success: function (res) {
                    var hot = "";
                    var url ="";
                    if(res){
                        for(var k in res){
                            if(k>4){
                                continue ;
                            }
                            switch (type){
                                case 'blog':
                                    url ="http://blog.51cto.com/"+res[k].authorid+'/'+res[k].tid;
                                    break;
                                case 'down':
                                    url ="http://down.51cto.com/data/"+ res[k].tid;
                                    break;
                                case 'bbs':
                                    url ="http://bbs.51cto.com/thread-"+res[k].tid+'-1.html';
                                    break;
								case 'edu':
                                    url =res[k].url;
                                    break;
                            }
                            hot += '<li class="Hottext t14"><a title="'+res[k].title+'" href="'+url+'" target="_blank" class="cl_3">'+res[k].title+'</a></li>';
                        }
                    }
                    $("#jsGetNewHot").next('.Hottext_tabbox').find("ul").eq(index).html('');
                    $("#jsGetNewHot").next('.Hottext_tabbox').find("ul").eq(index).html(hot);
                }

            });

        }
    });

});

function closeMess(){
    $(".jsAlertShadow").remove();
    $(".jsMessage").remove();
    $(".jsAlertContainer").remove();
}

