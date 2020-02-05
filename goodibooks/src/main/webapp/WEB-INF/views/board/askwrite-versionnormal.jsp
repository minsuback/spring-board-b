<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

	<div class="container pay">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<span class="m-0 font-weight-bold text-default">글 쓰기</span>
			</div>
			<div class="card-body">
				<form id="write-form" role="form" action="askwrite.action" method="post">
					<div class="form-group">
						<label>제목</label> <input class="form-control" id='title'
							name='title'>
					</div>
					<div class="form-group">
						<label>문의유형</label> 
						<select id="qnaType" name="qnaType" aria-controls="dataTable" class="form-control" style="width:150px">
							<option selected>선택</option>
							<option id="acc">계정문의</option>
							<option id="sys">시스템장애</option>
							<option id="pay">결제, 환불문의</option>
							<option id="eve">이벤트문의</option>
							<option id="sug">건의</option>
							<option id="etc">기타문의</option>
						</select>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" id='content'
							name='content'></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label>
						<input class="form-control fixed" id='id' name='id' value="${ loginuser.id }">
					</div>

					<button id="askwrite-button" type="button" class="btn btn-light">등록</button>
					&nbsp
					<button type="reset" class="btn btn-light">다시쓰기</button>
					&nbsp
					<button id="toask-button" type="button" class="btn btn-light">목록</button>
				</form>
			</div>
		</div>
	</div>


	<!-- all js here -->
	<!-- jquery latest version -->
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	
	<script type="text/javascript">
		$(function() {
			$('#toask-button').on('click', function(event) {
				location.href = "ask.action";
			});

			$('#askwrite-button').on('click', function(event) {
				if ($('#title').val() == '') {
					alert('제목을 입력하세요.');
					$('#title').focus();
					return;
				}
				if ($('#content').val() == '') {
					alert('내용을 입력하세요');
					$('#content').focus();
					return;
				}

				$('#write-form').submit();
			})

			$('.fixed').attr({'readonly': 'readonly'})

			//var target = document.getElementById("askType");
			//alert('선텍된 옵션 text값 = ' + target.options[target.selectedIndex].text);
			//alert('선텍된 옵션 value값 = ' + target.options[target.selectedIndex].value);

			$('#qnaType').change(function(event) {
				//alert(this.value);
				var qnaType = $('#qnaType').val();
				if (qnaType == '결제, 환불문의') {

					$.ajax({
						"url" : "/goodibooks/board/askwrite-versionpayment.action",
						"method" : "get",
						"success" : function(data, status, xhr) {
							$(".pay").load("/goodibooks/board/askwrite-versionpayment.action");
						},
						"error" : function(xhr, status, err) {
							alert("실패")
						}

					});
				}
				
			})
		})
	</script>

</body>
</html>
