<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>��ǰ���</title>


<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<style>
 body > div.container{
           padding-top : 50px;
 }
</style> 

<script type="text/javascript">


function fncAddProduct(){

	
	
	var name = $("input[name='prodName']").val();
	var detail =$("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	
	
	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

	//document.detailForm.action='/product/addProduct';
	
	$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
	
	//document.detailForm.submit();
}

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddProduct();
	});
});	

	

$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	


$( function() {
    $("#manuDate").datepicker({
    	dateFormat: 'yy-mm-dd'
  });  
});
</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />
<div class="container">	

<div class="page-header text-center">
  <h3 class=" text-info">��ǰ���</h3>
  <h5 class="text-muted">��ǰ�� <strong class="text-danger">���</strong>�� �ּ���.</h5>
	    </div>	

<form class="form-horizontal" enctype="multipart/form-data">

 <div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ��">
   </div>
  </div>

 <div class="form-group">
 <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ������">
   </div>
  </div>
		
 <div class="form-group">
 <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="manuDate" name="manuDate" readonly="readonly">
   </div>
  </div>
  
  <div class="form-group">
 <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="price" name="price" placeholder="����">
   </div>
  </div>
  
 <div class="form-group">
 <label for="file" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
	<div class="col-sm-4">
	   <input type="file" class="form-control"  multiple="multiple" id="file" name="file" placeholder="�̹���">
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