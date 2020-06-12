<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      
<!DOCTYPE html>
<html lang="ko">


<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
 <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	

   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   

   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <style>
		body {
            padding-top : 50px;
        }
    </style>
    
    <script type="text/javascript">
    
    
    

function fncUpdatePurchase() {
	
	$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo=${param.tranNo }").submit();
}

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncUpdatePurchase();
	});
});	

	
$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		
		
$( function() {
    $("#divyDate").datepicker({
    	dateFormat: 'yy-mm-dd'
  });  
});		


</script>

</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">


<div class="page-header text-center">
 <h3 class=" text-info">구매정보수정</h3>
 </div>


<form class="form-horizontal">

 <div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="buyerId" name="buyerId" value="${purchase.buyer.userId }" readonly="readonly">
	   	<strong class="text-danger">아이디는 수정불가</strong>
   </div>
  </div>

	<div class="form-group"> 
 			<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label> 
 			<div class="col-sm-4"> 
 				<select name="paymentOption" class="form-control"> 
 					<option value="1" selected="selected">현금구매</option> 
					<option value="2">신용구매</option> 
 				</select> 
 			</div> 
 		</div> 
 		 
 		 
 <div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName }">
   </div>
  </div>
  
 <div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
   </div>
  </div>
   	 
 		 
 <div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="receiverAddr" name="receiverAddr" value="${purchase.divyAddr }">
   </div>
  </div>


   <div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="receiverRequest" name="receiverRequest" value="${purchase.divyRequest }">
   </div>
  </div>
  
 <div class="form-group">
 <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="divyDate" name="divyDate" readonly="readonly" >
   </div>
  </div>
  
	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
	  </div>
	 </div>
</form>
</div>

</body>
</html>