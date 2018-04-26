
$(function(){
	$(".search").click(function(){
	    var searchArgs={
	         name:$("input[name='name']").val(),
	    }
	    bstpTable.inint(searchArgs)
	})
	$("#edit").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			$("#f").fill(data[0]);
		}else{
			alert("请选中行");
			$("#myModal").modal("toggle");
		}
	})
	$("#update").click(function(){
		$.post("EstateSales/admin/updateArticleType",
				$("#f").serialize(),
				function(data){
				if(data.msg=="success"){
					$("#myModal").modal("toggle");
					$("#tb").bootstrapTable("refresh",{url:"EstateSales/admin/articleTypeList"});
				}else{
					alert("修改失败！");
				}
		},"json")
		
	})
	$("#delete").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			$.post("EstateSales/admin/articleTypeDelte",
					{"articleType.id":data[0].id},
					function(msg){
						$("#tb").bootstrapTable("refresh",{url:"EstateSales/admin/articleTypeList"});
					},
					"json")
		}else{
			alert("请选中数据");
		}
	})
})
