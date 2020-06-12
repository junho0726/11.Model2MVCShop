<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	

	<style>
	
.thumbnail { 
  transform: scale(1); 
  -webkit-transform: scale(1); 
  -moz-transform: scale(1); 
  -ms-transform: scale(1); 
  -o-transform: scale(1); 
  transition: all 0.5s ease-in-out;
  overflow : hidden;
  cursor: porinter;
} 

 .a{
  position:absolute;
  bootom:150%;
  z-index:2;
  font-size:23px;
  font-weight:900;
  text-decoration : none;
  display: none;
  color:#000000;
}

.thumbnail:hover .a{
   display: block;
}

.thumbnail { 
  transform: scale(1); 
  -webkit-transform: scale(1); 
  -moz-transform: scale(1); 
  -ms-transform: scale(1); 
  -o-transform: scale(1); 
  transition: all 0.5s ease-in-out;
} 

.thumbnail:hover{ 
  transform: scale(1.2); 
  -webkit-transform: scale(1.2); 
  -moz-transform: scale(1.2); 
  -ms-transform: scale(1.2); 
  -o-transform: scale(1.2); 
}


 	body {
         padding-top : 50px;
       }
     </style>
     
<script type="text/javascript">

$(function() {

$( "button.btn.btn-primary" ).on("click" , function() {
	self.location = "/purchase/addPurchaseView?prod_no=${ product.prodNo}"
	}); 
$("a[name='reset']").on("click" , function() {
	history.go(-1);
	});
if(${product.proTranCode == '0' && user.role=='user'}){	
$(".thumbnail").on("click" , function() {
	self.location = "/purchase/addPurchaseView?prod_no=${ product.prodNo}"
	});	
}
});

</script>

</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

	<div class="page-header">
	     <h3 class=" text-info">상품상세조회</h3>
	</div>

	<div class="row">
	  	<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodNo}</div>
	</div>
	
	<hr/>
	
	
	<div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
		<div class="col-xs-8 col-md-4">${ product.prodName}</div>
	</div>
	
	<hr/>
	
    <div class="row">
	<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
	<c:forEach var="file" items="${product.fileNameList}">
	<div class="col-xs-6 col-md-3">
	<c:if test="${!empty file}"> 
    <a href="#" id="image" class="thumbnail">
         <div class="a">주문하기</div>
     	<img class ="images" src="../images/uploadFiles/${file}" style="width: 200px; height: 200px"/>
    </a>
  </div>
 </c:if>
</c:forEach>	
</div>
   
   <hr/>
   
 	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div> 
 		<div class="col-xs-8 col-md-4">${product.prodDetail}</div> 
	</div> 
   <hr/>
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>가격</strong></div> 
		<div class="col-xs-8 col-md-4">${product.price }</div> 
 	</div> 
	
	<hr/>	
	
	<div class="row"> 
 		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div> 
 		<div class="col-xs-8 col-md-4">${product.regDate}</div> 
 	</div> 
	

	<br/>
	
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 			<c:if test="${product.proTranCode == '0' && user.role=='user'}"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구&nbsp;매</button>
			</c:if>  
				  <a class="btn btn-primary btn" href="#" name = "reset" role="button">취 &nbsp;소</a>
 		</div> 
	</div>
</div>

</body>

</html>