function addCustomer() {
	if (validateForm("addForm")) {
		$.post(contextPath + "/customer/add", 
			$("#addForm").serialize(),
			function(data) {
				if (data.controllerResult.result == "success") {
					$("#customer").datagrid("reload");
					$('#addForm').form('clear');
					closeWin("addWin");
					showInfoAlert(data.controllerResult.message);
				} else {
					// 添加失败
					showInfoAlert(data.controllerResult.message);
				}
			}, "json"
		);
	}
}


function openEditWin(winId) {
	var jsonStr = '{"customer.id":"id_value","customer.name":"name_value","customer.gender":"gender_value","customer.birthday":"birthday_value","customer.identity_id":"identity_id_value","customer.email":"email_value","customer.phone":"phone_value","customer.address":"address_value","customer.customer_type":"customer_type_value","customer.together":"together_value","customer.contract":"contract_value","customer.archives":"archives_value","customer.created_time":"created_time_value","customer.status":"status_value"}';

	// 把数据放入到窗口中的form表单中
	var row = $("#customer").datagrid("getSelected"); // 获取选中行所对应的json对象
	if (row) {
		jsonStr = jsonStr.replace("id_value", row.id).replace("name_value", row.name).replace("gender_value",row.gender).replace("birthday_value",row.birthday).replace("identity_id_value",row.identity_id).replace("email_value",row.email).replace("phone_value", row.phone).replace("address_value",row.address).replace("customer_type_value",row.customer_type).replace("together_value",row.together).replace("contract_value",row.contract).replace("archives_value", row.archives).replace("created_time_value",row.created_time).replace("status_value",row.status);
		$("#editForm").form("load", strToJSON(jsonStr)); // row json对象里的属性名需要与form表单中的input的name一致
		$("#" + winId).window("open");
	} else {
		showInfoAlert("请选择需要修改的行");
	}
}

function updateCustomer() {
	if (validateForm("editForm")) {
		$.post(contextPath + "/customer/update", 
			$("#editForm").serialize(),
			function(data) {
				if (data.controllerResult.result == "success") {
					$("#customer").datagrid("reload");
					closeWin("editWin");
					showInfoAlert(data.controllerResult.message);
				} else {
					// 添加失败
					showInfoAlert(data.controllerResult.message);
				}
			}, "json"
		);
	}
}

function inactive(){
	var row = $("#customer").datagrid('getSelected');
	if(row){
		if(row.status == "N"){
			showInfoAlert("此行数据已冻结,无需在次冻结");
		}else{
			$.post(contextPath+"/customer/inactive",{"id":row.id},
					function(data){
						if(data.controllerResult.result == "success"){
							$("#customer").datagrid('reload');
						}
					},"json"
			);
		}
	}else{
		showInfoAlert("请选择需要冻结的行");
	}
}

function active(){
	var row = $("#customer").datagrid('getSelected');
	if(row){
		if(row.status=="Y"){
			showInfoAlert("此行数据已激,无需在次激活");
		}else{
			$.post(contextPath+"/customer/active",{"id":row.id},
					function (data){
						if(data.controllerResult.result == "success"){
							$("#customer").datagrid("reload");
						}
					},"json"
			);
		}
	}else {
		showInfoAlert("请选择需要激活的行");
	}
}