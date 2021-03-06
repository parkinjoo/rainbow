<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="manager-managerPage"><!-- 전체 영역 감싸고 있음 -->
	<!-- 최상단 메뉴 [회원 관리(사용자 목록, 탈퇴 회원 관리), 상품 관리(??), 매출 관리(보류)]-->
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#user-management">회원 관리</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#item-management" role="tab">상품 관리</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#sales-management" role="tab" id="clickTest">매출 관리</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#order-management" role="tab">주문 관리</a></li>
	</ul>
	
	<div class="tab-content" id="myTabContent">
	
		<!-- userManagement.jsp Include Area -->
			<jsp:include page="${managerUserDisplay }"/>
		<!-- userManagement.jsp Include Area -->
		
		<!-- itemManagement.jsp Include Area -->
			<jsp:include page="${managerItemDisplay }"/>
		<!-- itemManagement.jsp Include Area -->	
		
		<!-- salesManagement.jsp Include Area -->
			<jsp:include page="${managerSalesDisplay }"/>

		<!-- itemManagement.jsp Include Area -->
			<jsp:include page="${managerOrderDisplay }"/>

			
	</div>
</div>


		<!-- modalPage.jsp Include Area  -->
			<jsp:include page="${userModalPageDisplay }"/>
		<!-- modalPage.jsp Include Area  -->
		
		<!-- modalPage.jsp Include Area  -->
			<jsp:include page="${itemModalPageDisplay }"/>
		<!-- modalPage.jsp Include Area  -->
		
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>		
<script>
$(document).ready(function(){
	var managerPageOk = '${managerPageOk}';
	if (managerPageOk=='') {
		location.href="/shoppingmall/manager/managerPageForm.do";
	}else {
		return false;
	}
});
</script>


