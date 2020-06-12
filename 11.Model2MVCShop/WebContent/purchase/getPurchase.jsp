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
 		body {
            padding-top : 50px;
        }
     </style>
     
<script type="text/javascript">



$(function() {
	$( "button.btn.btn-primary" ).on("click" , function() {
		self.location = "/purchase/updatePurchaseView?tranNo=${param.tranNo}"
		}); 
	$($("a:contains('Ȯ��')")[0]).on("click" , function() {
		history.go(-1);
		});
	$($("a:contains('Ȯ��')")[1]).on("click" , function() {
		self.location = "/purchase/listPurchase"
		});
	});


</script>	
</head>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

	<div class="page-header">
	   <h3 class=" text-info">���Ż���ȸ</h3>
	</div>

<div class="row">
	  	<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
		<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo }</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>�����ھ��̵�</strong></div>
		<div class="col-xs-8 col-md-4">${purchase.buyer.userId }</div>
	</div>
	
	<hr/>
	
	<div class="row"> 
	   <div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div> 
 	   <div class="col-xs-8 col-md-4">${purchase.paymentOption.charAt(0)=='1'.charAt(0) ? "���ݱ���":"�ſ뱸��" }</div> 
	</div> 
 	
   <hr/>
	
	
	<div class="row"> 
	   <div class="col-xs-4 col-md-2 "><strong>�޴»��</strong></div> 
	   <div class="col-xs-8 col-md-4">${purchase.receiverName }</div> 
 	</div> 
 	
	<hr/>
	   
    <div class="row"> 
	   <div class="col-xs-4 col-md-2 "><strong>�޴»������ó</strong></div> 
	   <div class="col-xs-8 col-md-4">${purchase.receiverPhone }</div> 
 	</div> 
 	
	<hr/>
	
	 <div class="row"> 
	   <div class="col-xs-4 col-md-2 "><strong>�����</strong></div> 
	   <div class="col-xs-8 col-md-4">${purchase.divyAddr }</div> 
 	</div> 
 	
	<hr/>
	
	
	<div class="row"> 
	   <div class="col-xs-4 col-md-2 "><strong>���ſ�û����</strong></div> 
	   <div class="col-xs-8 col-md-4">${purchase.divyRequest }</div> 
 	</div> 
 	
	<hr/>
	
	
	
	<div class="row"> 
	   <div class="col-xs-4 col-md-2 "><strong>��������</strong></div> 
	   <div class="col-xs-8 col-md-4">${purchase.divyDate }</div> 
 	</div> 
 	
	<hr/>

	
	
	
	<div class="row"> 
	   <div class="col-xs-4 col-md-2 "><strong>�ֹ���</strong></div> 
	   <div class="col-xs-8 col-md-4">${purchase.orderDate }</div> 
 	</div> 
 	
	<hr/>
	
	
	<div class="row"> 
 		<div class="col-md-12 text-center"> 
			<c:if test="${purchase.tranCode.charAt(0) != '2'.charAt(0) && purchase.tranCode.charAt(0)!='3'.charAt(0)}">
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >����</button>
			</c:if>  
			<c:if test="${!empty param.currentPage }">
				  <a class="btn btn-primary btn" href="#" role="button">Ȯ��</a>
			</c:if>
			<c:if test="${empty param.currentPage }">
				<a class="btn btn-primary btn" href="#" role="button">Ȯ��</a>
			</c:if>
 		</div> 
	</div>
</div>
					
</body>
</html>