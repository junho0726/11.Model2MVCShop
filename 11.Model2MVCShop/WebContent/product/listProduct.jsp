<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.*"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>��ǰ �����ȸ</title>

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
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu }").submit();
}

$(function() {
	
	 $( "button.btn.btn-default" ).on("click" , function() {
		fncGetUserList(1);
	});
});


$(function() {

$("a:contains('����ϱ�')").on("click" , function() {
	self.location ="/purchase/updateTranCodeByProd?prodNo="+$(this).attr("value")
});

$(".ct_list_pop td:nth-child(2)[name='manage']" ).on("click" , function() {
	self.location ="/product/updateProductView?prodNo="+$(this).attr("value")
});

$(".ct_list_pop td:nth-child(2)[name='search']" ).on("click" , function() {
	self.location ="/product/getProduct?prodNo="+$(this).attr("value")
});


$( ".ct_list_pop td:nth-child(2)" ).css("color" , "red");
$("h7").css("color" , "red");

$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
});	

$(function() {
$("td:nth-child(6) > i" ).on("click" , function() {
	var prodNo = $(this).next().val();

	$.ajax( 
			{
				url : "/product/json/getProduct/"+prodNo ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},	
				success : function(JSONData , status) {
				
				var displayValue = "<h6>"
						+"��ǰ��ȣ: "+JSONData.prodNo+"<br/>"
						+"��ǰ�� : "+JSONData.prodName+"<br/>"
						+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
						+"�������� : "+JSONData.manuDate+"<br/>"
						+"���� : "+JSONData.price+"<br/>"
						if (JSONData.fileName != null) {
							displayValue += "��ǰ �̹���:<br>"
						for ( var i = 0; i < JSONData.fileNameList.length; i++) {
							displayValue += "<img src='../images/uploadFiles/"+JSONData.fileNameList[i]+"' width=150px/>"
						}
				} else {
					displayValue += "��ǰ �̹���:<img src='../images/uploadFiles/"+JSONData.fileName+"' width=150/>"

				}
						+"</h6>";
				
				$("h6").remove();
				$( "#"+prodNo+"" ).html(displayValue);
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
<c:if test="${!empty param.menu}">
	<c:choose>
	<c:when test="${param.menu == 'search' }">
	<h3>��ǰ�����ȸ</h3>
	</c:when>
	<c:when test="${param.menu == 'manage' }">
	<h3>��ǰ����</h3>
	</c:when>
	</c:choose>
	</c:if>
</div>



<div class="row">
<div class="col-md-6 text-left">
<p class="text-primary">
��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
</p>
</div>
  
 	<div class="col-md-6 text-right">
	 <form class="form-inline" name="detailForm">
	
     <div class="form-group">
	    <select class="form-control" name="searchCondition" >
	    <c:if test="${!empty search}" >
				<option value="0" ${search.searchCondition==0 ? "selected":"" }>��ǰ��ȣ</option>
				<option value="1" ${search.searchCondition==1 ? "selected":"" }>��ǰ��</option>
				<option value="2" ${search.searchCondition==2 ? "selected":"" }>��ǰ����</option>
				</select>
		</c:if>
	  </div> 
		
		 <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		

 <table class="table table-hover table-striped" >
      
        <thead>
        <tr>
		<th align="center">No</th>
		<th align="left">��ǰ��</th>
		<th align="left">����</th>
		<th align="left">�����</th>
		<th align="left">�������</th>
		<th align="left">��������</th>
	</tr>
      </thead>

     
		<tbody>
		<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
 		<c:if test="${!empty param.menu }">
				<c:if test="${param.menu == 'manage' }">
					<c:choose>
						<c:when test="${product.proTranCode =='0' }">
						<td align="left" name ="manage" title="Click : ��ǰ���� Ȯ��"  value ="${product.prodNo }"/>
						${product.prodName }
						</c:when>
						<c:otherwise>
						<td align="left">
						${product.prodName }</a></td>		
						</c:otherwise>
					</c:choose>	
				</c:if>
				<c:if test="${param.menu == 'search' }">
					<c:choose>
						<c:when test="${product.proTranCode== '0' }">
				<td align="left" name="search" value ="${product.prodNo }">
						${product.prodName }
						</c:when>
						<c:otherwise>
						<td align="left">${product.prodName }</td>
						</c:otherwise>
					</c:choose>
				</c:if>
				<td align="left">${product.price }</td>
				<td align="left">${product.regDate }</td>
				<td align="left">
				<c:if test="${param.menu == 'manage' }">
					<c:choose>
						<c:when test="${product.proTranCode.charAt(0) == '1'.charAt(0) }">
							���� �Ϸ�<a value ="${product.prodNo }&tranCode=2">����ϱ�</a>
						</c:when>
						<c:when test="${product.proTranCode.charAt(0) == '2'.charAt(0) }">�����</c:when>
						<c:when test="${product.proTranCode.charAt(0) == '3'.charAt(0) }">��ۿϷ�</c:when>
						<c:otherwise>
							�Ǹ���
						</c:otherwise>
					</c:choose>
				</c:if>	
				<c:if test="${param.menu == 'search' }">
					<c:choose>
						<c:when test="${product.proTranCode == '0' }">
							�Ǹ���
						</c:when>
						<c:otherwise>
							�������
						</c:otherwise>
					</c:choose>
				</c:if>	
				<td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
			  </td>
				</tr>
			</c:if>  
		</c:forEach>
		 </tbody>
      </table>
       	</div>

			 
			<jsp:include page="../common/pageNavigator_new.jsp"/>

<!--  ������ Navigator �� -->



</body>
</html>