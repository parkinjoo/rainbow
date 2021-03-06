<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- Large modal/수정 버튼을 누르면 상세 정보가 모달창으로 확대 (hidden으로 잡혀 있어서 버튼 누르기 전에는 안보임)-->
<div class="modal fade bd-example-modal-lg" id="userModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content modalSample-managerPage">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">회원 정보 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body modal-body-managerPage">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
					</div>
					<input type="text" id="modal-name" class="form-control" readonly>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
					</div>
					<input type="text" id="modal-id" class="form-control" value="" readonly>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
					</div>
					<input type="text" id="modal-email" class="form-control" value="" readonly>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">회원 가입일</span>
					</div>
					<input type="text" id="modal-joinday" class="form-control" value="" readonly>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">연락처</span>
					</div>
					<input type="text" id="modal-tel" class="form-control" value="" readonly>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">우편 번호</span>
					</div>
					<input type="text" id="modal-zipcode" class="form-control" value="" readonly>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">집주소</span>
					</div>
					<input type="text" id="modal-addr1" class="form-control" value="" readonly>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">상세주소</span>
					</div>
					<input type="text" id="modal-addr2" class="form-control" value="" readonly>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">보유 포인트</span>
					</div>
					<input type="text" id="modal-point" class="form-control" value="">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">보유 캐쉬</span>
					</div>
					<input type="text" id="modal-cash" class="form-control" value="">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">총 구매 금액</span>
					</div>
					<input type="text" id="modal-totalPay" class="form-control" value="" readonly>
				</div>
				<div class="input-group">
					<input type="text" class="form-control gradeArea" id="modal-grade">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary dropdown-toggle"
							type="button" data-toggle="dropdown">회원 등급</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" id="general-grade">General</a> 
							<a class="dropdown-item" id="vip-grade">VIP</a> 
							<a class="dropdown-item" id="vvip-grade">VVIP</a>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- Large modal/수정 버튼을 누르면 상세 정보가 모달창으로 확대 -->

<script type="text/javascript">
	//회원 등급 조정 기능 (--> modal popup 모음 페이지로 이동)
	$('#general-grade').click(function(){
		$('.gradeArea').empty();
		$('.gradeArea').val('general');
	});
	
	$('#vip-grade').click(function(){
		$('.gradeArea').empty();
		$('.gradeArea').val('VIP');
	});
	
	$('#vvip-grade').click(function(){
		$('.gradeArea').empty();
		$('.gradeArea').val('VVIP');
	});
	//------------------------------------------------------------
	

</script>