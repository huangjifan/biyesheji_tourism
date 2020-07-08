$(function(){
	//替换手机号码
	var phone = $('#phonereplace').text();
	phone = plusXing(phone,3,4,'*');
	$('#phonereplace').text(phone);
	//替换邮箱
	var email = $('#emailreplace').text();
	if (email != '') {
		email = plusXing(email,email.split('@')[0].length - 4,email.split('@')[1].length + 1,'*'); 
		$('#emailreplace').text(email);
	}
	//点击显示弹出框
	$("#editUserNameId").click(function(){
		$(".overlay").show();
		$("#tone").show();
	})
	//关闭按钮
	$(".dialog-close").click(function(){
		$("#newUserName").val("")
		$(".overlay").hide();
		$("#tone").hide();
	})
	//取消按钮
	$(".btn_cal").click(function(){
		$("#newUserName").val("")
		$(".overlay").hide();
		$("#tone").hide();
	})
	//失去焦点验证
	$("#newUserName").mouseout(function(){
		if ($("#newUserName").val()=='') {
			$("#newUserNameTip").show();
		}
		else {
			$("#newUserNameTip").hide();
		}
	})
	
	//保存用户名
	$(".btn_yel").click(function(){
		var newname=$("#newUserName").val();
		if (newname=='') {
			$("#newUserNameTip").show();
			return;
		}
		else {
			if (newname==$("#oldname").val()) {
				alert("新用户名不能和旧用户名一样");
				return;
			}
			$.ajax({
				url:"editUserName",
				type:"post",
				data:{
					newname:newname
				},
				success:function(data){
					if (data=='true') {
						alert("修改成功");
						$("#newUserName").val("")
						$(".overlay").hide();
						$("#tone").hide();
						location.reload();
					}
					else if (data=='ycz') {
						alert("用户名已存在");
					}
					else {
						alert("用户名已经修改过了");
						$("#newUserName").val("")
						$("#newUserNameTip").show();
					}
				},
				error:function(){
					$("#newUserName").val("")
					alert("修改失败");
				}
			})
		}
	})
	/* 实现省份下拉菜单  */
	$.ajax({
		url:'queryProvinceAll',
		dataType:'json',
		type:'post',
		success:function(data){
			//遍历传过来的数组
		    $.each(data,function(index,item){
		    	//判断是否为父节点（省份）
		    	$('#provinceId').append(new Option(item.area,item.id));//往下拉菜单里添加元素
		    })
			
		}
	})
	/* 获取省份下拉框的值 */
	 $('#provinceId').change(function(data){
		 //获取省份的id
		 var id = $('#provinceId').val();
		 //实现城市下拉菜单
		 $.getJSON("queryCitiAll?upid="+id, function(data){
             var optionstring = "";
             $.each(data, function(i,item){
            		 optionstring += "<option value=\"" + item.id + "\" >" + item.area + "</option>";
             });
             $("#cityId").html(optionstring);
         });
	 })
	 //保存用户信息
	 $("#savaPersonalInformation").click(function(){
		 var index="";
		 var realName=$("#realName").val();
		 var sex = $("input[name='gender']:checked").val();
		 var selYear = document.getElementById("selYear"); //定位id
		  index = selYear.selectedIndex; // 选中索引
		 var valueYear = selYear.options[index].value; // 选中值
		 var selMonth = document.getElementById("selMonth"); //定位id
		  index = selMonth.selectedIndex; // 选中索引
		 var valueMonth = selMonth.options[index].value; // 选中值
		 var selDay = document.getElementById("selDay"); //定位id
		  index = selDay.selectedIndex; // 选中索引
		 var valueDay = selDay.options[index].value; // 选中值
		 var ymd=valueYear+"-"+valueMonth+"-"+valueDay
		 var cityid=$("#cityId option:selected").val();
		 var job = $("input[name='career']:checked").val();
		 var marriage=$('input[name="married"]:checked').val();
		 $.ajax({
			 url:"editUserInfo",
			 type:"post",
			 data:{
				 realname:realName,
				 sex:sex,
				 ymd:ymd,
				 cityid:cityid,
				 job:job,
				 marriage:marriage
			 },
			 success:function(data){
				 if (data=='true') {
					alert("修改成功");
				 }
				 else {
					alert("修改失败");
				}
			 },
			 error:function(){
				 alert("修改错误");
			 }
		 })
	 })
})
function DateSelector(selYear, selMonth, selDay) {//定义函数
  this.selYear = selYear;
  this.selMonth = selMonth;
  this.selDay = selDay;
  this.selYear.Group = this;
  this.selMonth.Group = this;
// 给年份、月份下拉菜单添加处理onchange事件的函数
  if (window.document.all != null) // IE
  {
    this.selYear.attachEvent("onchange", DateSelector.Onchange);
    this.selMonth.attachEvent("onchange", DateSelector.Onchange);
  }
  else // Firefox
  {
    this.selYear.addEventListener("change", DateSelector.Onchange, false);
    this.selMonth.addEventListener("change", DateSelector.Onchange, false);
  }
  if (arguments.length == 4) // 如果传入参数个数为4，最后一个参数必须为Date对象
    this.InitSelector(arguments[3].getFullYear(), arguments[3].getMonth() + 1, arguments[3].getDate());
  else if (arguments.length == 6) // 如果传入参数个数为6，最后三个参数必须为初始的年月日数值
    this.InitSelector(arguments[3], arguments[4], arguments[5]);
  else // 默认使用当前日期
  {
    var dt = new Date();
    this.InitSelector(dt.getFullYear(), dt.getMonth() + 1, dt.getDate());
  }
}
// 增加一个最小年份的属性--最老年份
DateSelector.prototype.MinYear = 1960;
// 增加一个最大年份的属性--最新年份，即当前时期getFullYear()
DateSelector.prototype.MaxYear = (new Date()).getFullYear();
// 初始化年份
DateSelector.prototype.InitYearSelect = function () {
// 循环添加OPION元素到年份select对象中
  for (var i = this.MaxYear; i >= this.MinYear; i--) {
// 新建一个OPTION对象
    var op = window.document.createElement("OPTION");
// 设置OPTION对象的值
    op.value = i;
// 设置OPTION对象的内容
    op.innerHTML = i;
// 添加到年份select对象
    this.selYear.appendChild(op);
  }
}
// 初始化月份
DateSelector.prototype.InitMonthSelect = function () {
// 循环添加OPION元素到月份select对象中
  for (var i = 1; i < 13; i++) {
// 新建一个OPTION对象
    var op = window.document.createElement("OPTION");
// 设置OPTION对象的值
    op.value = i;
// 设置OPTION对象的内容
    op.innerHTML = i;
// 添加到月份select对象
    this.selMonth.appendChild(op);
  }
}
// 根据年份与月份获取当月的天数
DateSelector.DaysInMonth = function (year, month) {
  var date = new Date(year, month, 0);
  return date.getDate();
}
// 初始化天数
DateSelector.prototype.InitDaySelect = function () {
// 使用parseInt函数获取当前的年份和月份
  var year = parseInt(this.selYear.value);
  var month = parseInt(this.selMonth.value);
// 获取当月的天数
  var daysInMonth = DateSelector.DaysInMonth(year, month);
// 清空原有的选项
  this.selDay.options.length = 0;
// 循环添加OPION元素到天数select对象中
  for (var i = 1; i <= daysInMonth; i++) {
// 新建一个OPTION对象
    var op = window.document.createElement("OPTION");
// 设置OPTION对象的值
    op.value = i;
// 设置OPTION对象的内容
    op.innerHTML = i;
// 添加到天数select对象
    this.selDay.appendChild(op);
  }
}
// 处理年份和月份onchange事件的方法，它获取事件来源对象（即selYear或selMonth）
// 并调用它的Group对象（即DateSelector实例，请见构造函数）提供的InitDaySelect方法重新初始化天数
// 参数e为event对象
DateSelector.Onchange = function (e) {
  var selector = window.document.all != null ? e.srcElement : e.target;
  selector.Group.InitDaySelect();
}
// 根据参数初始化下拉菜单选项
DateSelector.prototype.InitSelector = function (year, month, day) {
// 由于外部是可以调用这个方法，因此我们在这里也要将selYear和selMonth的选项清空掉
// 另外因为InitDaySelect方法已经有清空天数下拉菜单，因此这里就不用重复工作了
  this.selYear.options.length = 0;
  this.selMonth.options.length = 0;
// 初始化年、月
  this.InitYearSelect();
  this.InitMonthSelect();
// 设置年、月初始值
  this.selYear.selectedIndex = this.MaxYear - year;
  this.selMonth.selectedIndex = month - 1;
// 初始化天数
  this.InitDaySelect();
// 设置天数初始值
  this.selDay.selectedIndex = day - 1;
}