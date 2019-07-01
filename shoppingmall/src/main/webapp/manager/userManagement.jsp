<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<!-- ���м�(ȸ������ ����) -->
<div class="tab-pane fade show active" id="user-management">

	<!-- ȸ�� ���� ���� �޴� -->
	<ul class="nav nav-pills mb-3 bottomNav-managerPage">
		<li class="nav-item"><a class="nav-link active"
			data-toggle="pill" href="#pills-home" aria-selected="true">����� ���</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="pill"
			href="#pills-profile" aria-selected="false">Ż�� ȸ�� ����</a></li>
	</ul>
	<!-- ȸ�� ���� ���� �޴� -->

	<div class="tab-content" id="pills-tabContent">

		<!--����� ��� ����-->
		<div class="tab-pane fade show active listDiv-managerPage"
			id="pills-home">
			<div class="deleteBtnDiv-managerPage">
				<input type="button" class="deleteBtn-managerPage" name="deleteBtn"
					value="���� ��� ����" id="selectedItemDeleteBtn">
			</div>
			<form>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">�̸�</th>
							<th scope="col">���̵�</th>
							<th scope="col">�̸��� �ּ�</th>
							<th scope="col"></th>
							<th scope="col"><input type="checkbox" id="selectAll">
							</th>
						</tr>
					</thead>
					<tbody id="userList">
						<!-- ajax�� ȣ��Ǵ� �κ� -->
					</tbody>
				</table>
			</form>
			<!-- �� �κп� ����¡ ó�� -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="">1</a></li>
					<li class="page-item"><a class="page-link" href="">2</a></li>
					<li class="page-item"><a class="page-link" href="">3</a></li>
					<li class="page-item"><a class="page-link" href=""
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
			<!-- ����¡ -->
		</div>
		<!-- ����� ��� ���� -->

		<div class="tab-pane fade" id="pills-profile">
			<!-- Ż��ȸ�� ��� ���� -->
		</div>


	</div>
	<!-- ���м� -->
</div>
<script>
//---------------�������� �߸� ����Ǵ� �Լ�-----------------------

$(document).ready(function(){	
	
	//-------------����� ����� �ѷ��ִ� �Լ�-------------------
	$.ajax({
		type : 'POST' ,
		url : '/shoppingmall/manager/getUserList.do',
		dataType : 'json',
		success : function(data){			
			$.each(data.list, function(index,items){
				$('#userList').append("<tr>"+
									  "<th scope='row'>"+(index+1)+
									  "</th>"+
									  "<td>"+items.name+"</td>"+
									  "<td>"+items.id+"</td>"+
									  "<td>"+items.email+"</td>"+
									  "<td><button type='button'"+ 
									  			  "class='btn btn-secondary modifyBtn-managerPage'"+
									  			  "name=id"+
									  			  "value='jinsol'"+
									  			  "id='modifyBtn"+index+
									  			  "'>����</button></td>"+
									  "<td>"+
									  "<input type='checkbox' name='deleteCheck'"+
									  		 "class='deleteCheck-managerPage'"+
									  		 "value="+items.id+">"+
									  "<input value='"+items.id+
									  	   "' type='hidden' class='hiddenId' id='modifyHidden"+index+"'>"+
									  "</td>"+
									  "</tr>");		
				
			});//each;
		}
	});
	//---------------------------------------------------	
});

//-----------------------------------------------------------------
//üũ�ڽ� ��ü���� ���
	$('#selectAll').click(function(){
		if($('#selectAll').prop("checked")) {
			$('.deleteCheck-managerPage').prop("checked", true);
		}else {
			$('.deleteCheck-managerPage').prop("checked", false);
		}
	});
//------------------------------------------------------------


//���õ� ��� �����ϱ�
$('#selectedItemDeleteBtn').click(function(){
	
	var checkArr = [];
	
	$('.deleteCheck-managerPage:checked').each(function(i){
		checkArr.push($(this).val());
	});
	
	if(checkArr.length==0){
		alert("���õ� ����� �����ϴ�");
	}else {
		var deleteConfirm = confirm("������ ���̵�� Ż��ó�� �˴ϴ�. �����Ͻðڽ��ϱ�?");
		if(deleteConfirm){
			
			$.ajax({
				type: 'POST',
				url : "/shoppingmall/manager/userDelete.do",
				data : {
					chkbox : checkArr
				},
				success: function(){
					alert("�����Ǿ����ϴ�");
					location.href = "/shoppingmall/manager/managerPage.do";
				}
			});
			
		}else {
			//����
		}
	}
});
//-----------------------------
</script>