var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;

function addhistory(id){
	var user_id=$("#user_id").val();
	var url=basePath+"/history/add";
	if(user_id!=""){
		$.post(url,{
			"history.user_id":user_id,
			"history.buildings_id":id
			},
			function(data){
				
			},
			"json"
			);
	}
}