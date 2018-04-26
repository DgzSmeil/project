
var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;

function initTable() {  
    //先销毁表格  
    $('#cusTable').bootstrapTable('destroy');  
    //初始化表格,动态从服务器加载数据  
    $("#cusTable").bootstrapTable({  
        method: "get",  //使用get请求到服务器获取数据  
        url: basePath+"/user/userpager", //获取数据的Servlet地址  
        striped: true,  //表格显示条纹  
        clickToSelect: true, //是否启用点击选中行
        pagination: true, //启动分页  
        pageSize: 5,  //每页显示的记录数  
        pageNumber:1, //当前第几页  
        pageList: [5, 10],  //记录数可选列表  
        showColumns: true,  //显示下拉框勾选要显示的列
        showExport: true,//显示导出按钮
        exportDataType:'all',
        showRefresh: true,  //显示刷新按钮  
        sidePagination: "server", //表示服务端请求  
        //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
        //设置为limit可以获取limit, offset, search, sort, order  
        queryParamsType : "undefined", 
        formatter: function (value, row, index) {  
            return index+1;  
        },
        queryParams: function queryParams(params) {   //设置查询参数  
          var param = {    
        	  pageNumber: params.pageNumber,    
              pageSize: params.pageSize,
              searchText: params.searchText,
          };    
          return param;                   
        }
      });  
  }    
function logoFormatter(value,row,index){
	return "<a href='/Estate/upload/"+row.headicon+"' data-lightbox='"+row.headicon+"' title=''><img src='/Estate/upload/"+row.headicon+"' style='width:130px;height:100px;'></a>";
  }
  function logoFormatter2(value,row,index){
	  if(row.status=='Y'){
		  return "已启用";
	  }else if(row.status=='N'){
		  return "已禁用";
	  }
  }
  function logoFormatter3(value,row,index){
	  if(row.status=='Y'){
		  return "<a href='javascript:void(0);' onClick='dele2(\""+row.id+"\");'>禁用</a>";
	  }else if(row.status=='N'){
		  return "<a href='javascript:void(0);' onClick='dele(\""+row.id+"\");'>启用</a>";
	  }
  }
  function logoFormatter4(value,row,index){
	  if(row.checked_status=='Y'){
		  return "已审核";
	  }else if(row.checked_status=='N'){
		  return "未审核";
	  }else if(row.checked_status=='F'){
		  return "审核不成功";
	  }
  }
  function logoFormatter5(value,row,index){
	  		$("#agencyid").val(row.id);
		  return "<a href='"+basePath+"/agency/checked?agency.id="+row.id+"' class=''>通过</a>    <a href='javascript:void(0);' class='' onclick='unck()'>不通过</a>";
	  
  }
  function logoFormatter6(value,row,index){
		  return "<a href='"+basePath+"/agency/delbyid?agency.id="+row.id+"' class=''>删除</a>";
  }
 
  function formatDate(value) {
	    if (value == undefined || value == null || value == '') {
	        return "";
	    } else {
	        var date = new Date(value); // 获取js的Date对象
	        var year = date.getFullYear().toString();
	        var month = (date.getMonth() + 1);
	        var day = date.getDate().toString();
	        var hour = date.getHours().toString();
	        var minutes = date.getMinutes().toString();
	        var seconds = date.getSeconds().toString();
	        if (month < 10) {
	            month = "0" + month;
	        }
	        if (day < 10) {
	            day = "0" + day;
	        }
	        if (hour < 10) {
	            hour = "0" + hour;
	        }
	        if (minutes < 10) {
	            minutes = "0" + minutes;
	        }
	        if (seconds < 10) {
	            seconds = "0" + seconds;
	        }
	        return year + "-" + month + "-" + day;
	    }
	}


		$(".search").click(function(){
		    var searchArgs={
		         name:$("input[name='name']").val(),
		    }
		 
		    bstpTable.inint(searchArgs)
		})
		$("#btn_look").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/user/userlook?user.id="+data[0].id; 
			}else{
				swal("提示信息", "请选中行", "info");
			}
			  
		})
	
		$("#btn_search").click(function(){
			 $('#myModal').modal('show');
		});

	
		
		//返回
		$("#back").click(function(){
			window.history.back(-1);
		});

	$("#bysearch").bind("click",function(){
		$('#myModal').modal('hide');
		window.location.href="Estate/user/search?user.nickname="+$("#usernickname").val()+"&user.name="+$("#username").val()+"&user.email="+$("#useremail").val()+"&user.phone="+$("#userphone").val()+"&user.qq="+$("#userqq").val()+"&user.wechat="+$("#userwechat").val();
		});
	function dele(id){
		  swal({   
			  title: "您确定要启用该用户？",   
			  text: "",
			  type: "info",   
			  showCancelButton: true,   
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "确定启用", 
			  cancelButtonText: " 不启用",
			  closeOnConfirm: false }, 
			  function(isConfirm){   
				  if (isConfirm) {     
					  var url=basePath+"/user/active";
	        			$.post(url,{
	            			"user.id":id
	            			},
	            			function(data){
	            				swal(data.msg, "","success");
	            				$('#cusTable').bootstrapTable(('refresh'), basePath+"/user/mgnuserpage");
	            			},
	            			"json"
	            		);
					  } else {     
						     
		  			} 
				  });
		  
	  }
function dele2(id){
swal({   
	  title: "您确定要禁用该用户？",   
	  text: "",
	  type: "info",   
	  showCancelButton: true,   
	  confirmButtonColor: "#DD6B55",
	  confirmButtonText: "确定禁用", 
	  cancelButtonText: "不禁用",
	  closeOnConfirm: false }, 
	  function(isConfirm){   
		  if (isConfirm) {     
			  var url=basePath+"/user/inactive";
  			$.post(url,{
      			"user.id":id
      			},
      			function(data){
      				swal(data.msg, "","success");
      				$('#cusTable').bootstrapTable(('refresh'), basePath+"/user/mgnuserpage");
      			},
      			"json"
      		);
			  } else {     
				     
			} 
		  });
}