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
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu }").submit();
}

$(function() {
	
	 $( "button.btn.btn-default" ).on("click" , function() {
		fncGetUserList(1);
	});
});


$(function() {

$("a:contains('배송하기')").on("click" , function() {
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
						+"상품번호: "+JSONData.prodNo+"<br/>"
						+"상품명 : "+JSONData.prodName+"<br/>"
						+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
						+"제조일자 : "+JSONData.manuDate+"<br/>"
						+"가격 : "+JSONData.price+"<br/>"
						if (JSONData.fileName != null) {
							displayValue += "상품 이미지:<br>"
						for ( var i = 0; i < JSONData.fileNameList.length; i++) {
							displayValue += "<img src='../images/uploadFiles/"+JSONData.fileNameList[i]+"' width=150px/>"
						}
				} else {
					displayValue += "상품 이미지:<img src='../images/uploadFiles/"+JSONData.fileName+"' width=150/>"

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
	<h3>상품목록조회</h3>
	</c:when>
	<c:when test="${param.menu == 'manage' }">
	<h3>상품관리</h3>
	</c:when>
	</c:choose>
	</c:if>
</div>



<div class="row">
<div class="col-md-6 text-left">
<p class="text-primary">
전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
</p>
</div>
  
 	<div class="col-md-6 text-right">
	 <form class="form-inline" name="detailForm">
	
     <div class="form-group">
	    <select class="form-control" name="searchCondition" >
	    <c:if test="${!empty search}" >
				<option value="0" ${search.searchCondition==0 ? "selected":"" }>상품번호</option>
				<option value="1" ${search.searchCondition==1 ? "selected":"" }>상품명</option>
				<option value="2" ${search.searchCondition==2 ? "selected":"" }>상품가격</option>
				</select>
		</c:if>
	  </div> 
		
		 <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		

 <table class="table table-hover table-striped" >
      
        <thead>
        <tr>
		<th align="center">No</th>
		<th align="left">상품명</th>
		<th align="left">가격</th>
		<th align="left">등록일</th>
		<th align="left">현재상태</th>
		<th align="left">간략정보</th>
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
						<td align="left" name ="manage" title="Click : 상품정보 확인"  value ="${product.prodNo }"/>
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
							구매 완료<a value ="${product.prodNo }&tranCode=2">배송하기</a>
						</c:when>
						<c:when test="${product.proTranCode.charAt(0) == '2'.charAt(0) }">배송중</c:when>
						<c:when test="${product.proTranCode.charAt(0) == '3'.charAt(0) }">배송완료</c:when>
						<c:otherwise>
							판매중
						</c:otherwise>
					</c:choose>
				</c:if>	
				<c:if test="${param.menu == 'search' }">
					<c:choose>
						<c:when test="${product.proTranCode == '0' }">
							판매중
						</c:when>
						<c:otherwise>
							재고없음
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

<!--  페이지 Navigator 끝 -->



</body>
</html>