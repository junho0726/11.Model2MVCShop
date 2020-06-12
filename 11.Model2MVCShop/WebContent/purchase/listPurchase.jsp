<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.*"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="/css/animate.min.css" rel="stylesheet">
  <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
  <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   	
   	
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    

<script type="text/javascript">
	

function fncGetUserList(currentPage) {
	//document.getElementById("currentPage").value = currentPage;
	$("#currentPage").val(currentPage)
   	//document.detailForm.submit();
	$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
}


$(function() {
	$(".ct_list_pop td:nth-child(1)" ).on("click" , function() {
		self.location ="/purchase/getPurchase?tranNo="+$(this).attr("value")
	});
	
	$( ".ct_list_pop td:nth-child(1)" ).css("color" , "red");
	$("h7").css("color" , "red");

	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
});


$(function() {	
$( ".ct_list_pop td:nth-child(2)" ).on("click" , function() {
	self.location ="/user/getUser?userId="+$(this).text().trim();
	});
});


$(function() {
$("a:contains('물건도착')").on("click" , function() {
	self.location ="/purchase/updateTranCode?tranNo="+$(this).attr("value")
	});
});	


$(function() {
	$("td:nth-child(7) > i" ).on("click" , function() {
		var tranNo = $(this).next().val();;
		$.ajax( 
				{
					url : "/purchase/json/getPurchase/"+tranNo ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},	
					success : function(JSONData , status) {
					var displayValue = "<h6>"
						    +"구매자아이디:"+ JSONData.buyer.userId +"<br/>"
						    +"물품번호:"+ JSONData.purchaseProd.prodNo+"<br/>"
							+"받는사람:"+ JSONData.receiverName+"<br/>"
							+"받는사람연락처:"+ JSONData.receiverPhone+"<br/>"
							+"배송지:"+ JSONData.divyAddr+"<br/>"
							+"구매요청사항:"+ JSONData.divyRequest+"<br/>"
							+"배송희망일:"+ JSONData.divyDate+"<br/>"
							+"</h6>";
					$("h6").remove();
					$( "#"+tranNo+"" ).html(displayValue);
				}
		});
	});
});
</script>
</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp" />
  
	
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>구매 목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
<div class="col-md-6 text-left">
<p class="text-primary">
전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
</p>
</div>
  
 <table class="table table-hover table-striped" >
 
   <thead>
        <tr>
		<th align="center">No</th>
		<th align="left">회원ID</th>
		<th align="left">회원명</th>
		<th align="left">전화번호</th>
		<th align="left">배송현황</th>
		<th align="left">정보수정</th>
		<th align="left">간략정보</th>
	</tr>
      </thead>
 
 	<tbody>
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items= "${list}" >
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
		<td align="left" name="tranNo" value="${purchase.tranNo}">${i}</td>
		<td align="left">${purchase.buyer.userId }</td>
		<td align="left">${purchase.receiverName}</td>
		<td align="left">${purchase.receiverPhone}</td>		
		<td align="left">
			<c:choose>
				<c:when test="${purchase.tranCode.charAt(0)=='3'.charAt(0) }">배송완료</c:when>
				<c:when test="${purchase.tranCode.charAt(0)=='2'.charAt(0) }">배송중</c:when>
				<c:otherwise>구매완료</c:otherwise>
			</c:choose>
			</td>
	 		<td align="left">
			<c:choose>
				<c:when test="${purchase.tranCode.charAt(0)=='3'.charAt(0) }"/>
				<c:when test="${purchase.tranCode.charAt(0)=='2'.charAt(0) }">
				<a value ="${purchase.tranNo}&tranCode=3">물건도착	</a>
				</c:when>
			</c:choose>
			</td>
			<td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${purchase.tranNo }"></i>
			  	<input type="hidden" value="${purchase.tranNo }">
			  </td>
			</tr>	
		</c:forEach>
		</tbody>
</table>
</div>
				<jsp:include page="../common/pageNavigator_new.jsp"/>
</body>
</html>