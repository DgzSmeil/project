;(function($){
	$.extend({
		message : {
			show : function (){
				if (!arguments.length){					
					return false;
				}
				//如果消息提示已存在，先关闭
				if ($('.jsMessage').length){
					$('.jsMessage').remove();
				}

				var _param = {
					type : 'info',
					text : '',
					closeTime : null,
					width : null,
					showShadow : false,
                    showCancelButton:true,
					onShown : null,
					onConfirm:null
				}
				
				if (typeof arguments[0] == 'string'){
					_param.text = arguments[0];
				}
				else{
					$.extend(_param,arguments[0]);
				}
				
				if (!_param.text){					
					return false;
				}
				
				var iconClass = '';
				switch (_param.type){
					case 'success':
						iconClass = 'poptite';
						break;
					case 'error':
						iconClass = 'poptite';
						break;
					case 'warning':
						iconClass = 'poptite';
						break;
					case 'info':
						iconClass = 'Pop_protext';     
						break;
				}
				
				var id = cto.utility.getObjectId();
				var str = '<div id="' + id + '" class="jsMessage PopBox PopBox_300 alert-' + _param.type + '">';
				str += '<div class="PopBoxin pt20 pb20">';
				str += '<div class="' + iconClass + ' tc t14 mb15"><span>' + _param.text+'</span>';
				str += '</div><div class="Pop_btns tc">';
				str += '<span class="Popbtn_blue_62 mr10 jsAlertConfirm">确定</span>';
                if(_param.showCancelButton){
                    str +='<span class="Popbtn_kxin_62 ml10 jsAlertClose">取消</span>';
                }
                str +="</div></div>";
				var obj = $(str);
				$('body').append(obj);
				var width = parseInt($('#content').css('width'));
				if (_param.width){
					width = _param.width;
				}

				width = width - parseInt(obj.css('paddingLeft')) - parseInt(obj.css('paddingRight')) - parseInt(obj.css('marginLeft')) - parseInt(obj.css('marginRight'));
				obj.css({
					boxShadow : '3px 3px 20px #000',
					textAlign : 'center',
					position : "fixed",
					top : "0%",
					left : "0%",
					fontSize : '16px',
					width : width + 'px',
					marginBottom : '0px',
					marginLeft : parseInt($('#content').css('marginLeft')) + 'px',
					opacity : 0
				});
				setPosition(obj);
				if (_param.type == 'error'){
					obj.css({
						background : '#f74d4d',
						color : '#ffffff'
					});
				}
				
				//绑定事件
				obj.find('.jsAlertClose').click(function(){
					closeMessage(obj);
				});
				obj.find('.jsAlertConfirm').unbind('click').click(function(){
					if (typeof _param.onConfirm == 'function')
					{
						 _param.onConfirm();
					}else{
                        closeMessage(obj);
                    }
					
				});
				//弹出遮罩
				if (_param.showShadow){
					var shadowId = showShadow();
					obj.attr('shadowId',shadowId);
				}
				
				obj.css('z-index',cto.utility.getPopZindex() + 1);				
				
				//显示
				obj.fadeTo('slow',1,function(){
					if (typeof _param.onShown == 'function'){
						_param.onShown();
					}
					if (_param.closeTime){
						setTimeout(function (){
							closeMessage(obj);
						},_param.closeTime);
					}
				});
				
				return id;
			},
			close : function (){
                var matchObj = '';
                if (!arguments.length){
                    matchObj = $('.jsMessage');
                }
                else if (typeof arguments[0] == 'string'){
                    matchObj = $('#' + arguments[0]);
                }
                else if (arguments[0] === -1){
                    matchObj = $('.jsMessage:last');
                }

                if (!matchObj){                  
                    return;
                }

                matchObj.each(function (){
                    var shadowId = $(this).attr('shadowId');
                    if (shadowId){
                        closeShadow(shadowId);
                    }
                    $(this).remove();
                });
			}
		},
		alert : {
			show : function (){
				if (!arguments.length){					
					return false;
				}
				
				var _param = {
					type : 'info',
					title : '',
					text : '',
					obj : '',
					html : '',
					showShadow : true,
					closeOnConfirm : false,
					showCancelButton : false,
					isHasClose:true,
					showButton : false,
					showBottom : false,
					closeTime : null,
					onConfirm : null,
					onCancel : null,
					onShown : null,
					onClose : null,
					width :380,
					confirmButtonText : '确定',
					cancelButtonText : '取消',
					buttomSize:82,
					hasButtomBackground:false,
					inputClassBind:null
				};
				
				if (typeof arguments[0] == 'string'){
					_param.text = arguments[0];
				}
				else{
					$.extend(_param,arguments[0]);
				}
				return alertVoid(_param);
			},
			close : function (){
				var matchObj = '';
				if (!arguments.length){
					matchObj = $('.jsAlertContainer');
				}
				else if (typeof arguments[0] == 'string'){
					matchObj = $('#' + arguments[0]);
				}
				else if (arguments[0] === -1){
					matchObj = $('.jsAlertContainer:last');
				}
				
				if (!matchObj){					
					return;
				}
				
				matchObj.each(function (){
					var shadowId = $(this).attr('shadowId');
					if (shadowId){
						closeShadow(shadowId);
					}
					$(this).remove();
				});
			},
			reSetPosition : function (param){
				if (typeof param == 'string'){
					var obj = $('#'+param);
					if (obj.length){
						setPosition(obj);
					}
				}
				else if (typeof param == 'object'){
					setPosition(param);
				}
			}
		},
		shadow : {
			show : function (){
				return showShadow();
			},
			close : function (param){
				if (typeof param == 'undefined'){
					param = null;
				}
				
				closeShadow(param);
			}
		}
	});
	
	function closeMessage(param){
		if (typeof param == 'string'){
			var obj = $('#'+param);
			if (obj.length){
				obj.remove();
			}
		}
		else if (typeof param == 'object'){
			param.fadeTo('slow',0,function(){
				var shadowId = param.attr('shadowId');
				if (shadowId){
					closeShadow(shadowId);
				}
				param.remove();
			});
		}
	}
	
	function alertVoid(param){
		var str = '';
		var id = cto.utility.getObjectId();
		if (param.html){
			str = param.html;
		}
		else{
			str = getAlertDivStr(param);
		}
		if (!str){			
			return;
		}
		str = '<div class="jsAlert jsAlertContainer" id="' + id + '" style="display:none;">' + str + '</div>';
		var obj = $(str);
		$('body').append(obj);
		if (param.width){
			obj.css('width',param.width + 'px');
		}
		//定位
		setPosition(obj);
	
		//绑定事件
		obj.find('.jsAlertConfirm').unbind('click').click(function(){
			if (typeof param.onConfirm == 'function')
			{
				 param.onConfirm();
			}
			if (param.closeOnConfirm){
				closeAlert(obj);
			}
		});
	
		obj.find('.jsAlertCancel').unbind('click').click(function(){
			if (typeof param.onCancel == 'function')
			{
				param.onCancel();
			}
			closeAlert(obj);
		});
		
		obj.find('.jsAlertClose').click(function(){
			if (typeof param.onClose == 'function')
			{
				param.onClose();
			}
			closeAlert(obj);
		});

		//文本框绑定focus事件
		if(param.inputClassBind){
			obj.find(param.inputClassBind).focus(function(){
				if($(this).val() == this.defaultValue){
					$(this).val('');
				}
			})

			obj.find(param.inputClassBind).blur(function(){
				if($(this).val().replace(/ /g,'') == ''){
					$(this).val(this.defaultValue);
				}
			})
		}

		obj.find('.cre_group').click(function(){
			showCreGroupInp($(this));
		})


		//弹出遮罩
		if (param.showShadow){
			var shadowId = showShadow();
			obj.attr('shadowId',shadowId);
		}
		obj.css('z-index',cto.utility.getPopZindex() + 1);
		//显示
		obj.fadeTo(0,1,function (){
			if (typeof param.onShown == 'function'){
				param.onShown();
			}
			
			if (param.closeTime){
				setTimeout(function (){
					closeAlert(obj);
				},param.closeTime);
			}
		});
		return id;
	}
	
	function closeAlert(obj){
		obj.fadeTo(300,0,function (){
			var shadowId = obj.attr('shadowId');
			if (shadowId){
				closeShadow(shadowId);
			}
			obj.remove();
		});
	}
	
	function closeShadow(param){
		if ($('.jsAlertShadow').length){
			if (!param){
				$('.jsAlertShadow').remove();
			}
			else if (typeof param == 'string' && $('#' + param).length){
				$('#' + param).remove();
			}
			else if (param === -1){
				$('.jsAlertShadow:last').remove();
			}
		}
	}
	
	function getAlertDivStr(param){
        var str = '';
		var text = '';
		if (param.obj){
			if (!$(param.obj).length){
				
			}
			else{
				text = $(param.obj).html();
			}
		}
		else{
			text = param.text;
		}
		
		if (text){
			var buttonStr = '';
			var title = '';
			var titleIconClass = '';
			
			if (param.title){
				title +=  param.title;
			}
			
			switch (param.type){
				case 'success':
					titleIconClass = 'poptite';
					break;
				case 'info':
					titleIconClass = 'poptite';
					break;
			}

		    var size = param.buttomSize;
			if(param.showButton){
				if(param.hasButtomBackground){
					buttonStr +='<div class="bg_gray_f1 cl_6 pt15 pb15">';
				}
				buttonStr +='<div class="Pop_btns pl96 tl">';
		    	buttonStr += '<span class="Popbtn_blue_'+size+' mr10 jsAlertConfirm">' + param.confirmButtonText + '</span>';
	            if (param.showCancelButton){
					buttonStr += '<span class="Popbtn_kxin_'+size+' ml10 jsAlertCancel">' + param.cancelButtonText + '</span>';
				}
	            buttonStr += "</div>"
				if(param.hasButtomBackground){
					buttonStr +='</div>';
				}
			}
			var width = param.width;
			var str = '<div class="PopBox PopBox_'+width+'">';
			str += '<div class="PopBoxin pb20" >';
			if(param.isHasClose){
				str += '<span class="pop_offbtn_white jsAlertClose">×</span>';
			}
            str += '<div class="' + titleIconClass + ' pl20 t14 mb25">';
			str += title+'</div>'+text;
			str += buttonStr;
			str +="</div></div>";

		}
		return str;
	}
	
	function showShadow(){
		//var heightOut = $(document.body).outerHeight(true);
		var widthOut = $(document.body).outerWidth(true);		
		var styleStr = 'filter:alpha(opacity=40);-moz-opacity:0.3;opacity:0.4;background-color:#000;position:fixed;left:0;top:0;display:block;overflow: hidden;';
		var id = cto.utility.getObjectId();
		
		var shadeObj = $('<div id="' + id + '" class="jsAlert jsAlertShadow" style="'+styleStr+'width:'+widthOut+'px;height:100%;"></div>');			
		shadeObj.css('z-index',cto.utility.getPopZindex() + 1);
		$('body').append(shadeObj);
		
		return id;
	}
	
	function setPosition(obj)
	{
		var marginLeft = -parseInt(obj.css("width"))/2;
		var marginTop = -parseInt(obj.css('height'))/2;
		obj.css({
			position : "fixed",
			top : "50%",
			left : "50%",
			marginTop : marginTop,
			marginLeft : marginLeft
		});
	}

	//收藏显示添加分类
	function showCreGroupInp(obj){
		$(obj).hide();
		$(obj).next(".cre_group_inp").show();
	}


})(jQuery);

