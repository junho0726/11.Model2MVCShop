<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>��ǰ ����</title>



<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<style>
 body > div.container{
           padding-top : 50px;
 }
</style> 

<script type="text/javascript">

function fncAddPurchase() {
	var paymentOption=$("input[name='paymentOption']").val();
	var receiverName=$("input[name='receiverName']").val();
	var receiverPhone=$("input[name='receiverPhone']").val();
	var receiverAddr=$("input[name='receiverAddr']").val();
	var receiverRequest=$("input[name='receiverRequest']").val();
	var receiverDate=$("input[name='receiverDate']").val();

 $("form").attr("method", "POST").attr("action", "/purchase/addPurchase").submit();
}

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddPurchase();
	});
});	

	
$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
			
$( function() {
    $("#dlvyDate").datepicker({
    	dateFormat: 'yy-mm-dd'
  });  
});		

</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container"> 
 	<div class="page-header text-center"> 
 		<h3 class="text-info">��ǰ ����</h3> 
</div> 

	<form class="form-horizontal">
	<input type="hidden" name="prod_no" value="${param.prod_no}" />
		
		
			<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label> 
 			<div class="col-sm-4"> 
 				${param.prod_no}
 			</div> 
 		</div> 

	<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label> 
			<div class="col-sm-4"> 
 				${purchase.purchaseProd.prodName} 
 			</div> 
		</div> 
 		 
 		 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label> 
 			<div class="col-sm-4"> 
 				${purchase.purchaseProd.prodDetail } 
 			</div> 
 		</div> 
 		 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">��������</label> 
 			<div class="col-sm-4"> 
			${purchase.purchaseProd.manuDate }
 			</div> 
 		</div> 
		 
		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">����</label> 
			<div class="col-sm-4"> 
 			${purchase.purchaseProd.price }
 			</div> 
 		</div> 
 		 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�������</label> 
 			<div class="col-sm-4"> 
			${purchase.purchaseProd.regDate }
 			</div> 
		</div> 
 		 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label> 
 			<div class="col-sm-4"> 
 				${user.userId} 
 			</div> 
 		</div> 
 		 
 		<div class="form-group"> 
 			<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label> 
 			<div class="col-sm-4"> 
 				<select name="paymentOption" class="form-control"> 
 					<option value="1" selected="selected">���ݱ���</option> 
					<option value="2">�ſ뱸��</option> 
 				</select> 
 			</div> 
 		</div> 
 		 
 		<div class="form-group"> 
 			<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label> 
 			<div class="col-sm-4"> 
 				<input type="text" class="form-control" name="receiverName" maxLength="20" value="${purchase.buyer.userName}" /> 
			</div> 
 		</div> 
 		 
 		<div class="form-group"> 
 			<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label> 
 			<div class="col-sm-4"> 
 				<input 	type="text" class="form-control" name="receiverPhone" maxLength="20" value="${purchase.buyer.phone }" /> 
 			</div> 
 		</div> 
 	 
 		<div class="form-group"> 
 			<label for=divyAddr class="col-sm-offset-1 col-sm-3 control-label">�������ּ� </label> 
 			<div class="col-sm-4"> 
 				<input type="text" class="form-control" name="divyAddr" maxLength="20" 	value="${purchase.buyer.addr}" /> 
 			</div> 
 		</div> 
 		 
 		<div class="form-group"> 
 			<label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label> 
 			<div class="col-sm-4"> 
 				<input type="text" class="form-control" name="divyRequest" maxLength="20" /> 
 			</div> 
		</div> 
	
	
	
	<div class="form-group"> 
			<label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label> 
 			<div class="col-sm-4"> 
 				<input type="text" class="form-control" id="dlvyDate" name="dlvyDate" readonly="readonly"/> 
 			</div> 
 		</div> 

	 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
				
</div>

</body>
</html>