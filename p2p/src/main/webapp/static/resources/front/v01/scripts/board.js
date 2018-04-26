$(function(){
	$.ajax({
		url:'front/recommendInvestRank.do',
		dataType: "json",
		data:{},
		success:function(result){
			if(result.error=='0'){
				var ehinvestRankList = result.ehinvestRankList;
				
				var investRank = result.investRank;
				console.log(investRank);
				var commend = result.recommendUserRank;
				console.log(commend);
				var bayueinvest = $('#bayueinvest');
				var invest = $('#invest');
				var oCommend = $('#commend');
				var oMonth =$('#rankMonth');
				oMonth.text(result.month);
				for(var i =0;i<10;i++){
					$('<li class="list'+i+'"><div><p class="one">'+investRank[i].rank+'</p><p class="two">'+investRank[i].mobilePhone+'</p><p class="three">'+formatCurrency(investRank[i].investAmount)+'</p></div></li>')
					.appendTo(invest);
					$('<li class="list'+i+'"><div><p class="one">'+commend[i].rank+'</p><p class="two">'+commend[i].mobilePhone+'</p><p class="three">'+commend[i].num+'</p></div></li>')
					.appendTo(oCommend); 
				}
				for(var i =0;i<10;i++){ 
					$('<li class="list'+i+'"><div><p class="one">'+ehinvestRankList[i].rank+'</p><p class="two">'+ehinvestRankList[i].mobilePhone+'</p><p class="three">'+formatCurrency(ehinvestRankList[i].investAmount)+'</p></div></li>')
					.appendTo(bayueinvest);
				}
			}
		}
	})
});

function formatCurrency(value) {
	value = parseFloat(value).toFixed(2);
	var sb = '',ls = value.substring(value.indexOf('.'));
	for (var i=0, len=value.length-3; i<len; i++) {
		sb += value.charAt(i);
		if ((i+1) % 3 == len % 3 && (i+1) != len) {
			sb += ',';
		}
	}
	return sb+ls;
};