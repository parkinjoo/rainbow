<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<form name="viewForm" method="post" action="/shoppingmall/itemboard/itemPurchaseForm.do">
	<input type="hidden" name="imgName" value="${itemboardDTO.img1}" >
	<input type="hidden" name="itemCode" value="${itemCode }" >
	<input type="hidden" name="itemName" value="">
	<input type="hidden" name="csName" value="" >
	<input type="hidden"  name="csVal" value="" >
	<input type="hidden"  name="initQty" value="" >
	<input type="hidden"  name="salePrice" value="" >
	<input type="hidden" name="sumPrice" value="" >
	
</form>
  <head>
    <meta charset="utf-8">
    <title>아이템 페이지</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/index-style.css">
    <link rel="stylesheet" href="../css/itemPage-style.css">
    <link rel="stylesheet" href="../css/review.css">

  </head>
  <body>
  <div id="item-box-itemPage">
    <div class="left-box-itemPage" style="background-image:url('../storage/${itemboardDTO.img1}')">
     
    </div>
    <div class="right-box-itemPage">
      <div class="topDiv-itemPage">
     <div id="itemCodeDiv"></div>
        <h6 class="itemName-itemPage"><b></b></h6>
        <c:if test="${itemboardDTO.col1f eq 0}">
           <p class="sizeTop-itemPage">S~XL</p>
        </c:if>
        <c:if test="${itemboardDTO.col1f > 0}">
           <p class="sizeTop-itemPage">FREE</p>
        </c:if>
      </div>
      <div class="middleDiv1">
        <p class="itemText-itemPage"></p>
          <table class="table-itemPage">
            <tr class="tr-itemPage">
              <td class="title-itemPage td-itemPage">판매가</td>
              <td class="itemPrice-itemPage"><b></b></td>
            </tr>
            <tr class="tr-itemPage">
              <td class="title-itemPage td-itemPage">색상</td>
              <td class="td-itemPage">
                  <select id="color_option" style="width: 110px;">
                           
            </select>
              </td>
            </tr>
            <tr class="tr-itemPage">
              <td class="title-itemPage td-itemPage">사이즈</td>
              <td class="td-itemPage">
                  <c:if test="${itemboardDTO.col1f eq 0}">
                        <select id="size_option" style="width: 110px;" onchange="">
                           
                     </select>
                  </c:if>
                  <c:if test="${itemboardDTO.col1f > 0}">               
                     Free
                  </c:if>
              </td>
            </tr>
            <tr class="tr-itemPage">
              <td class="title-itemPage">배송정보</td>
              <td class="td-itemPage"><a href="#" class="showItem-itemPage">실시간 재고 보기</a></td>
            </tr>
          </table>
      </div>
      <hr class ="itemList">
       <div class="middleDiv2">
        <!-- <p class="colorAndSize-itemPage"></p><br>
        <input type="text" class="itemAccount-itemPage" value="1">

        <button type="button" class="accountBtn-itemPage plus">+</button>
        <button type="button" class="accountBtn-itemPage minus">-</button>

        <p class="price-ietemPage"></p>  -->
      </div>
      <hr>
      <p class="totalPrice-itemPage"><span class="totalPriceText-itemPage"></span> &nbsp;&nbsp;&nbsp;</p>
      <hr>
      <div class="btnDiv-itemPage">
        <button type="button" class="purchaseBtn-itemPage">BUY NOW</button>
        <button type="button" class="btn-itemPage cartBtn-itemPage">
          <img src="../images/basket.gif" class="cartImg-itemPage">
        </button>
        <button type="button" class="btn-itemPage likeBtn-itemPage">
          <img src="" class="likeImg-itemPage">
        </button>
      </div>
    </div>
  </div>
  <div class="withItemDiv-itemPage ">
    <div id="carouselExampleFade" class="carousel slide carousel-fade withItemDiv1-itemPage" data-ride="carousel">
      <div class="carousel-inner withItemDiv2-itemPage">
        <h3 class="withItem-itemPage">추천 코디</h3>
        <div class="carousel-item active withItemDiv3-itemPag">

          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,901</p>
            </div>
          </div>

          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,900</p>
            </div>
          </div>

          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,900</p>
            </div>
          </div>

          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,900</p>
            </div>
          </div>

        </div>

        <div class="carousel-item withItemDiv3-itemPag">

          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,902</p>
            </div>
          </div>



          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,900</p>
            </div>
          </div>


          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,900</p>
            </div>
          </div>


          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,900</p>
            </div>
          </div>
        </div>

        <div class="carousel-item withItemDiv3-itemPage">

          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,900</p>
            </div>
          </div>

          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,900</p>
            </div>
          </div>

          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,900</p>
            </div>
          </div>

          <div class="card innerDivTest1-itemPage" style="width: 14rem;">
            <img src="" class="card-img-top cardImg-itemPage" alt="...">
            <div class="card-body card-body-itemPage">
              <h5 class="card-title card-title-itemPage">슬랙스 9부 팬츠</h5>
              <p class="card-text card-text-itemPage">15,903</p>
            </div>
          </div>

        </div>

      </div>
      <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
    <hr>
  <div class="itemPictureDiv">
     <img src="../storage/${itemboardDTO.img2 }">
     <img src="../storage/${itemboardDTO.img3 }">
     <img src="../storage/${itemboardDTO.img4 }">
  
  </div>
  
  <div class="manager-managerPage"><!-- 전체 영역 감싸고 있음 -->
	<!-- 최상단 메뉴 [회원 관리(사용자 목록, 탈퇴 회원 관리), 상품 관리(??), 매출 관리(보류)]-->
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#user-management">리뷰 작성</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#item-management" role="tab">리뷰 보기 </a></li>
	</ul>
	
	<div class="tab-content" id="myTabContent">
	
	</div>
</div>
  
	<table border="0" cellpading="0" cellpacing="0" width="1200">
		<tr id="review_name">
			<td colspan="1" align="center">
				<font color="black" size="2" face="돋움">작성자</font>
			</td>
			<td align="left" colspan="1">
				<input type="text" id="re_input_name" >
			</td>
		</tr>
		<tr id="review_content">
			<td align="center" colspan="1" height="30">
				<font color="black" size="2" face="돋움">리뷰 내용</font>
			</td>
			<td height="10" colspan="2">
				<textarea class="review_txt" id="review_txt" placeholder="로그인후 작성가능합니다"></textarea>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="1" height="20">
				<font color="black" size="2" face="돋움">사진 등록</font>
			<td height="10" colspan="2">
				<input type="file"  name="img" id="img1">
				
		</tr>
		<tr>
			<td align="center" colspan="1" height="20">
				<font color="black" size="2" face="돋움">사진 등록</font>
			<td height="10" colspan="2">
				<input type="file" class="custom-file-input" name="img" id="img2">
		</tr>
		<tr>
			<td align="right" colspan="3">
				<input type="button" id="sb_review" value="리뷰 등록하기">
			</td>
		</tr>	
	</table>

  </body>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
   $.ajax({
      type: 'post',
      url: '/shoppingmall/itemboard/getItemboardView.do',
      data: 'itemCode=${itemCode}&pg=${pg}&categoryCode=${categoryCode}',
      dataType: 'json',
      success: function(data){
    	  $('#itemCodeDiv').text(data.itemboardDTO.itemCode);
          $('.itemName-itemPage').text(data.itemboardDTO.itemName);
          $('.itemText-itemPage').text(data.itemboardDTO.itemContent);
          $('.itemPrice-itemPage').text(data.itemboardDTO.salePrice);
          
          var itemName = data.itemboardDTO.itemName;
          document.viewForm.itemName.value=itemName;
         /*$('#salePrice').text(data.itemboardDTO.salePrice);
         $('#costPrice').text(data.itemboardDTO.costPrice);
         $('.itemcontent').text(data.itemboardDTO.itemContent);
         $('.saleprice_right').text(data.itemboardDTO.salePrice);
         
         
         $('#totQty').text(data.itemboardDTO.totQty);

         $('#itemContent').text(data.itemboardDTO.itemContent);
         
         $('#img1').prop('src', '../storage/'+data.itemboardDTO.img1);
         $('#img2').prop('src', '../storage/'+data.itemboardDTO.img2);
         $('#img3').prop('src', '../storage/'+data.itemboardDTO.img3);
         $('#img4').prop('src', '../storage/'+data.itemboardDTO.img4);
         
         $('#itemKeyword').text(data.itemboardDTO.itemKeyword);
         */
         
         //컬러 셀렉트박스 유동적 변경
         $('#color_option').empty();
         $('<option/>',{
            value : '0',
            text : '색상선택'
         }).appendTo($('#color_option'));
         $('<option/>',{
            id : data.itemboardDTO.col1,
            value : 'col1',
            text : data.itemboardDTO.col1
         }).appendTo($('#color_option'));
         $('<option/>',{
            value : 'col2',
            text : data.itemboardDTO.col2
         }).appendTo($('#color_option'));
         $('<option/>',{
            value : 'col3',
            text : data.itemboardDTO.col3
         }).appendTo($('#color_option'));
         $('<option/>',{
            value : 'col4',
            text : data.itemboardDTO.col4
         }).appendTo($('#color_option')); 
      } 
   });
});

$('#color_option').change(function(){
   
    $.ajax({
      type : 'post',
      url : '/shoppingmall/itemboard/getSize.do',
      data : {'itemCode': '${itemCode}',
            'color': $('#color_option').val()},
      dataType : 'json',
      success : function(data){
         
         var color= $('#color_option').val();
         
         $('#size_option').empty();
         $('<option/>',{
            value : '0',
            text : '사이즈선택'
         }).appendTo($('#size_option')); 
         
          if(color=='col1'){
            $('<option/>',{
               value : '11',
               text : 'S'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '12',
               text : 'M'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '13',
               text : 'L'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '14',
               text : 'XL'
            }).appendTo($('#size_option'));
         }else if(color=='col2'){
            $('<option/>',{
               value : '21',
               text : 'S'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '22',
               text : 'M'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '23',
               text : 'L'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '24',
               text : 'XL'
            }).appendTo($('#size_option'));
            
         }else if(color=='col3'){
            
            $('<option/>',{
               value : '31',
               text :'S'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '32',
               text : 'M'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '33',
               text : 'L'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '34',
               text : 'XL'
            }).appendTo($('#size_option'));
         }else if(color=='col4'){
            $('<option/>',{
               value : '41',
               text : 'S'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '42',
               text : 'M'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '43',
               text : 'L'
            }).appendTo($('#size_option'));
            $('<option/>',{
               value : '44',
               text : 'XL'
            }).appendTo($('#size_option'));
         }   
      }
         
   });    
});

var csName = new Array();//선택된 컬러와 사이즈 이름을 담을 배열 *없어질 수 있음*

var csVal = new Array(); //선택된 컬러와 사이즈의 값을 담을 배열 

var optionCnt = 0;//각 태그의 고유값을 주기위한 값 1씩 증가함

var salePrice = ${itemboardDTO.salePrice }; 

var sumPrice = 0; //선택한 물품의 수량의 총 가격을 담을 변수 

$('#size_option').change(function(){	
	var color= $('#color_option').val();
    var size = $('#size_option').val();
	var colorText = $('#color_option option:selected').text();
 	var sizeText = $('#size_option option:selected').text();
    var comCS =colorText+'/'+sizeText; //추가시 비교할 비교군
   if(sizeText=='사이즈선택'){
 	   alert('다시선택해주세요');
    }
   else if(csName.length==0){
	   listTagAdd();
   }
   else{
	   var count = 0; //구분자
	   for(i=0;i<csName.length;i++){//중복으로 리스트를 추가하려는지 
		   
		   if(csName[i] == comCS){
		      alert('이미 선택되었습니다.');
		      count++;
		   }
	   }
	   if(count==0){ //선택이 안되어있을때 추가
		   listTagAdd();
	   }
   }
});

function listTagAdd(){
	var colorText = $('#color_option option:selected').text();
 	var sizeText = $('#size_option option:selected').text();
    var color= $('#color_option').val();
    var size = $('#size_option').val();
	//수량 선택을 할 태그 생성
    csName.push(colorText+'/'+sizeText);
    csVal.push(color+'/'+size);
     $('<p/>',{
        class : 'colorAndSize-itemPage '+optionCnt,
        text : colorText+'  '+sizeText,    
        style : 'border : 1px solid blue;'
     }).appendTo($('.middleDiv2'));
     
     $('<input/>',{
        type : 'text',
        class : 'itemAccount-itemPage',
        id : 'itemAccount-itemPage'+optionCnt,
        step : '1',
        min: '1',
        max: '0',
        size: '2',
        value : '1'
     }).appendTo($('.middleDiv2'));
     
     $('<button/>',{
        type : 'button',
        id : 'plus'+optionCnt,
        class : 'accountBtn-itemPage plus',
        text : '+'
     }).appendTo($('.middleDiv2'));
     
     $('<button/>',{
        type : 'button',
        id : 'minus'+optionCnt,
        class : 'accountBtn-itemPage minus',
        text : '-'
     }).appendTo($('.middleDiv2'));
     
     $('<p/>',{
        id : 'price-itemPage'+optionCnt,
        class : 'price-itemPage',
        text : salePrice
     }).appendTo($('.middleDiv2'));
     
     optionCnt++; //고유번호 증가
     sumPrice = sumPrice + salePrice; //새로운 항목 추가될때마다 최종합계 추가
     $('.totalPriceText-itemPage').text(sumPrice);
};

//증가
$(document).on('click','.plus',function(){
   var id = $(this).attr('id');
   var num = id.charAt(id.length-1);
   var qty = $('#itemAccount-itemPage'+num).val();
   qty++;          
   $('#itemAccount-itemPage'+num).val(qty);
   $('#price-itemPage'+num).text(qty * salePrice);
   sumPrice = sumPrice+salePrice;
   $('.totalPriceText-itemPage').text(sumPrice);
});

//감소
$(document).on('click','.minus',function(){
   var id = $(this).attr('id');
   var num = id.charAt(id.length-1);
   var qty = $('#itemAccount-itemPage'+num).val();
   if(qty > 1){
      qty--;   
      $('#itemAccount-itemPage'+num).val(qty);
      $('#price-itemPage'+num).text(qty * salePrice);
      sumPrice = sumPrice-salePrice;
   }             
   $('#itemAccount-itemPage'+num).val(qty);
   $('.totalPriceText-itemPage').text(sumPrice);
   
});


// 장바구니 회원

$('.cartImg-itemPage').click(function(){
	if('${userDTO}'!=''){
      
      var itemCode = $('#itemCodeDiv').text();
      var itemName = $('.itemName-itemPage').text();
      var itemCol = $('#color_option option:selected').text();
      var itemQty = 1;
      var itemSize = $('#size_option option:selected').text();
      var id = '${userDTO.id }';
      //건들지마세요
      var stus = 'cart';
      //alert(itemCol+','+itemSize);
      if(itemCol!='색상선택' && itemSize!='사이즈선택'){
	      $.ajax({
	         type: 'post',
	         url: '/shoppingmall/itemboard/itemBasket.do',
	         data: 'itemCode='+itemCode+'&itemName='+itemName+'&itemCol='+itemCol+'&itemQty='+itemQty+'&itemSize='+itemSize+'&id='+id+'&stus='+stus+'&categoryCode=${categoryCode}&pg=${pg}',
	         success: function(){
	            if(confirm("상품이 저장되었습니다. 장바구니로 가시겠습니까?")){
	               location.href="/shoppingmall/itemboard/itemBasketList.do";
	            }else{
					location.reload();
	            }
	            
	         } 
	      });
      }else{
    	  alert("색상과 사이즈를 선택해주세요.");
      }
   
   }else {
         if(confirm('비회원으로 구매를 진행하시겠습니까?')){
            location.href = "/shoppingmall/itemboard/itemBasketList.do";
         }else
            location.href = "/shoppingmall/user/loginForm.do";
   }
});

//buy now 버튼
$('.purchaseBtn-itemPage').click(function(){
	var initQty = new Array(); //추가해준 옵션들의 수량을 담을 배열
	
	for(i=0; i<csVal.length;i++)
		initQty.push($('#itemAccount-itemPage'+i).val());
	
	//히든 버튼에 값을 넣어 보내주기 
	var csNameRe = csName.join(',');
	var csValRe = csVal.join(',');
	var initQtyRe = initQty.join(',');
	document.viewForm.csName.value=csNameRe;
	document.viewForm.csVal.value=csValRe;
	document.viewForm.initQty.value=initQtyRe;
	document.viewForm.salePrice.value=salePrice;
	document.viewForm.sumPrice.value=sumPrice;
	document.viewForm.submit();
});




$('#review_txt').click(function(){

	if(${userDTO == null}){
		alert('로그인후 작성가능합니다 ')
		this.blur();
	}		
});

/*
$(document).ready(function(){ 
	var fileTarget = $('#img1'); 
	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name; 
		} else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} 
	
	// 추출한 파일명 삽입 
	
	//$("label[id='img1']").text(filename);
	});
	
	
	var fileTarget = $('#img2'); 
	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name; 
		} else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} 
	
	// 추출한 파일명 삽입 
	
	//$("label[id='img2']").text(filename);
});
	
	
$('#sb_review').click(function(){
	if($('.review_txt').val()== null || $('.review_txt').val()=="로그인후 작성가능합니다"){
		alert('리뷰를 작성해주세요')
	}else{
		$.ajax({
			type: 'POST',
			url: '/shoppingmall/itemboard/review.do',
			data: {'name': ${'#re_input_name'}.val(),
					'review': ${'.review_txt'}.val(),
					'img1':${'#img1'}.val(),
					'img2':${'#img2'}.val()},
			dataType : 'text',
			success : function(data){
				alert('성공')
			}
			})
	}
})
*/
</script>
</html>



















