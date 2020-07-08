function del(index){
	if ($("#userid").val()!=undefined || $("#userid").val()!=null) {
		if (confirm("确定删除此条游记吗?")) {
			$.ajax({
				url:"delTravel",
				type:"post",
				data:{
					id:index
				},
				success:function(data){
					if (data=='true') {
						alert("删除成功");
						location.reload();
					}
					else {
						alert("删除失败");
					}
				},
				error:function(){
					alert("删除失败！");
				}
			})
		}
	}
	else {
		alert("没有登录");
	}
}
function edit(){
	if ($("#userid").val()!=undefined || $("#userid").val()!=null) {
		$.ajax({
			url:"editTravel",
			type:"post",
			data:{
				id:$("#travelid").val()
			},
			success:function(data){
				if (data=='true') {
					alert("修改成功");
					location.reload();
				}
				else {
					alert("修改失败");
				}
			},
			error:function(){
				alert("修改失败！");
			}
		})
	}
	else {
		alert("没有登录");
	}
}
/*function youji(index){
	if (index==1) {
		$("#youji"+1).attr("class","active");
		$("#youji"+2).attr("class","");
		$("#youji"+3).attr("class","");
		
	}
	else if(index==2){
		$("#youji"+1).attr("class","");
		$("#youji"+2).attr("class","active");
		$("#youji"+3).attr("class","");
	}
	else {
		$("#youji"+1).attr("class","");
		$("#youji"+2).attr("class","");
		$("#youji"+3).attr("class","active");
	}
}*/
$(function(){
	if ($("#type").val()=='myTravel') {
		$("#youji"+1).attr("class","active");
		$("#youji"+2).attr("class","");
		$("#youji"+3).attr("class","");
	}
	else if ($("#type").val()=='dWrite') {
		$("#youji"+1).attr("class","");
		$("#youji"+2).attr("class","active");
		$("#youji"+3).attr("class","");
	}
	else {
		$("#youji"+1).attr("class","");
		$("#youji"+2).attr("class","");
		$("#youji"+3).attr("class","active");
	}
})