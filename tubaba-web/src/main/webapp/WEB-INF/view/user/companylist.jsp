<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/poplogin.css">
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
<title>定制订单</title>
</head>
<link rel="stylesheet" href="css/newcommon.css" >
<link rel="stylesheet" href="css/buttons.css" >
<body>
  <jsp:include page="head.jsp"></jsp:include>
 <div class="inquiry-details" id="mycous" >
 <c:if test="${empty list}">
	<table class="order_table">
 		<tr class="sep-row">
            <td colspan="7">
                <div class="no_order">
                    <a href="index" class="noimg"><img src="http://pic.lvmama.com/img/v6/myspace/noorder.png"></a>
                    <div class="content">
                        <p>最近您没有下过订单哦~</p>
                        <a href="index" class="gohome">去首页看看</a>
                    </div>
                </div>
            </td>
        </tr>
	</table>
 </c:if>
 <c:forEach items="${list}" var="coust">
 	
 	
     <ul class="inquiry-list js-inquiry-list">
        <li class="active" >
            <div class="inquiry-title-box">
                <!-- <a href="javascript:;" onclick="showtype()" class="inquiry-function-box">
					
                    <i class="inquiry-common-icon inquiry-up-icon up-down"></i></a> -->
                <p class="tips">个人定制</p>
                <p class="tips">订单编号：${coust.ordernumber}</p>
                <h3 class="title">${coust.startcity}－${coust.endcity}  ${coust.people}人 定制游</h3>
            </div>
            <div class="inquiry-content-box"  id="type" >
          
                <dl class="inquiry-content">
                    <dt></dt>
                    <dd><span>定制类型：</span>个人定制</dd>
                    <dd><span>出发地：${coust.startcity}</span></dd>
                    <dd><span>目的地：${coust.endcity}</span></dd>
                    <dd><span>往返时间：</span>
                  	<fmt:formatDate pattern="yyyy-MM-dd"  value="${coust.starttime}"/>至
					<fmt:formatDate pattern="yyyy-MM-dd"  value="${coust.endtime}"/>
					</dd>
                    <dd><span>出行人数：${coust.people}人</span></dd>
                    <dd><span>人均预算：${coust.budget}元</span></dd>
                </dl>
                <dl class="inquiry-content">
                    <dt><span>联系人信息</span></dt>
                    <dd><span>联系人员：${coust.name}</span></dd>
                    <dd><span>联系方式：${coust.phone}</span></dd>
                    <dd><span>邮箱地址：${coust.email}</span></dd>
                </dl>
              
            </div>
        </li>
    </ul>
    </c:forEach>
</div>
<!-- <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">
	function showtype(){		
		var node= $('#type');
		if(node.is(':hidden')){　　//如果node是隐藏的则显示node元素，否则隐藏
		　　node.show();　
		}else{
		　　node.hide();
		}		
	}
</script> -->

</body>
</html>