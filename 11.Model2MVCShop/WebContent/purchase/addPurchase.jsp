<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html> 
<html> 
head> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 

 
<link rel="stylesheet" href="/css/theme.min.css" > 
<link rel="stylesheet" href="/css/custom-theme.css" > 
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> 

 

 
<!-- Bootstrap Dropdown Hover CSS --> 
<link href="/css/animate.min.css" rel="stylesheet"> 
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> 

<script src="/javascript/bootstrap-dropdownhover.min.js"></script> 

 

 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 

 
 
 <script type="text/javascript"> 
 $(function() {
 $( "button.btn.btn-primary" ).on("click" , function() {
		self.location = " /product/listProduct?menu=search"
		}); 
 $("a[href='#' ]").on("click" , function() {
		self.location = "/purchase/listPurchase"
	});
 }); 

 </script> 
  </head> 
 
 <body> 

 <jsp:include page="/layout/toolbar.jsp" /> 


 <div class="container"> 
 	<div class="page-header text-center"> 
 			<h3 class=" text-info">��ǰ ���� �Ϸ�</h3> 
 			<h5 class="text-muted">������ ���� <strong class="text-info">����</strong>�Ǿ����ϴ�.</h5> 
 		</div> 
 	<div class="form-horizontal"> 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label> 
 			<div class="col-sm-4"> 
 				${purchase.buyer.userId} 
 			</div> 
 		</div> 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label> 
 			<div class="col-sm-4"> 
 				${purchase.paymentOption} 
 			</div> 
 		</div> 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label> 
 			<div class="col-sm-4"> 
 				${purchase.receiverName} 
			</div> 
		</div> 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label> 
 			<div class="col-sm-4"> 
 				${purchase.receiverPhone} 
			</div> 
 		</div> 
 		<div class="form-group"> 
			<label class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label> 
			<div class="col-sm-4"> 
 				${purchase.divyAddr }
			</div> 
 		</div> 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label> 
 			<div class="col-sm-4"> 
				${purchase.divyRequest }
 			</div> 
		</div> 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">����������</label> 
			<div class="col-sm-4"> 
 				${purchase.divyDate }
 			</div> 
		</div> 
 		 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��ǰ������� �̵�</button>
			  <a class="btn btn-primary btn" href="#" role="button">�ֹ�������� �̵�</a>
		    </div>
		  </div>	
 	</div> 
 </div> 
 
 </body> 
 </html> 
