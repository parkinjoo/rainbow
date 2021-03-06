<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<header>
  <div class="header1-index">
    <div class="headerDiv-index">
      <ul class="nav justify-content-end justify-content-end-index">
       <c:if test="${userDTO != null }">
       	<li class="nav-item">
          <a class="nav-link nav-link2-index" id="userId-index">${userDTO.id }님 환영합니다</a>
        </li>
      	<li class="nav-item">
          <a class="nav-link nav-link2-index" id="logout" href="/shoppingmall/user/logout.do">LOGOUT</a>
        </li>
        <li class="nav-item">
          <a class="nav-link nav-link2-index" href="/shoppingmall/user/myPageForm.do">MY PAGE</a>
        </li>
      </c:if>
      <c:if test="${userDTO == null }">
      	<li class="nav-item">
          <a class="nav-link nav-link2-index active " href="/shoppingmall/user/loginForm.do">LOGIN</a>
        </li>      
        <li class="nav-item">
          <a class="nav-link nav-link2-index" href="/shoppingmall/user/joinForm.do">JOIN</a>
        </li>
      </c:if>

        <li class="nav-item">
          <a class="nav-link nav-link2-index"  tabindex="-1" aria-disabled="true" href="/shoppingmall/itemboard/itemBasketList.do">CART</a>
        </li>
        
      	<c:if test="${userDTO.userCode == 1 }">
	        <li class="nav-item">
	          <a class="nav-link nav-link2-inde nav-link3" id="managerPage" href="/shoppingmall/manager/managerPage.do" >관리자 페이지</a>
	        </li>
        </c:if>        
      </ul>
    </div>
  </div>
  <br/><br/>
  <div class="logoArea-index header2">
    <img src="../images/logo_img.png" id="logoImg-index" style="cursor: pointer;">
  </div>

  <div class="navbar1">
      <div class="testDivNav">
        <div class="dropdown1">
          <button class="dropbtn" id="topGoBtn">TOP</button>
          <div class="dropdown-content">
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MT00" class="aTag">반팔 티셔츠</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MT01" class="aTag">긴팔 티셔츠</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MT02" class="aTag">나시</a>
          </div>
        </div>
        <div class="dropdown1">
          <button class="dropbtn" id="pantsGoBtn">PANTS</button>
          <div class="dropdown-content">
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MP00" class="aTag">청바지</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MP01" class="aTag">반바지</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MP02" class="aTag">슬렉스</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MP03" class="aTag">정장바지</a>
          </div>
        </div>
        <div class="dropdown1">
          <button class="dropbtn" id="shirtsGoBtn">SHIRTS</button>
          <div class="dropdown-content">
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MS00" class="aTag">와이 셔츠</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MS01" class="aTag">캐쥬얼 셔츠</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MS02" class="aTag">반팔 셔츠</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MS03" class="aTag">린넨 셔츠</a>
          </div>
        </div>
        <div class="dropdown1">
          <button class="dropbtn" id="shoesGoBtn">SHOES</button>
          <div class="dropdown-content">
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MF00" class="aTag">운동화</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MF01" class="aTag">구두</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MF02" class="aTag">슬리퍼</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MF03" class="aTag">샌들</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MF04" class="aTag">하이힐</a>
          </div>
        </div>
        <div class="dropdown1">
          <button class="dropbtn" id="outerGoBtn">OUTER</button>
          <div class="dropdown-content">
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MO00" class="aTag">자켓</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MO01" class="aTag">야상</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MO02" class="aTag">오리털 점퍼</a>
          </div>
        </div>
        <div class="dropdown1">
          <button class="dropbtn" id="etcGoBtn">ETC</button>
          <div class="dropdown-content">
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=ME00" class="aTag">시계</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=ME01" class="aTag">팔찌</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=ME02" class="aTag">반지</a>
            <a href="/shoppingmall/itemboard/itemboardList.do?categoryCode=ME03" class="aTag">목걸이</a>
          </div>
        </div>
      </div>

    </div>
</header>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script> 
 
 //중앙 상단 로고 이미지 버튼을 누르면 메인페이로 회귀
 $('#logoImg-index').click(function(){	
	  location.href="/shoppingmall/main/index.do";
 });
 
 //로그아웃
 $('#logout').click(function(){
	 if(confirm("로그아웃 하시겠습니까?")) {
		 location.href="/shoppingmall/user/logout.do";
	  }else {
		  return false;
	  }
 });
 
$(document).ready(function(){
	var jboffset = $('.header1-index').offset();	
	$(window).scroll(function(){
		if($(document).scrollTop() > jboffset.top)
			$('.header1-index').addClass('jbFixed');
		else
			$('.header1-index').removeClass('jbFixed');
	});	
});

$('#topGoBtn').click(function(){
	location.href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MT";
});

$('#pantsGoBtn').click(function(){
	location.href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MP";
});

$('#shirtsGoBtn').click(function(){
	location.href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MS";
});

$('#shoesGoBtn').click(function(){
	location.href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MF";
});

$('#outerGoBtn').click(function(){
	location.href="/shoppingmall/itemboard/itemboardList.do?categoryCode=MO";
});

$('#etcGoBtn').click(function(){
	location.href="/shoppingmall/itemboard/itemboardList.do?categoryCode=ME";
});
 </script>
