<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="/spring-board-b/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/spring-board-b/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
        
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">자유 게시판</h1>
          <br>
          
          <div class="card shadow mb-4">
          
            <div class="card-header py-3">
              <span class="m-0 font-weight-bold text-primary">글 상세 보기</span>
            </div>
            <div class="card-body">
               
               	  <div class="form-group">
		            <label>글번호</label> 
		            <input class="form-control" id='bno' name='bno' value='${ board.bno }'>
		          </div>
		          
		          <div class="form-group">
		            <label>제목</label> 
		            <input class="form-control" id='title' name='title' value='${ board.title }'>
		          </div>
		
		          <div class="form-group">
		            <label>내용</label>
		            <textarea class="form-control" rows="3" id='content' name='content'>${ board.content }</textarea>
		          </div>
		
		          <div class="form-group">
		            <label>작성자</label> 
		            <input class="form-control" id='writer' name='writer' value='${ board.writer }'>
		          </div>
		          
		          <div class="form-group">
		            <label>작성일자</label> 
		            <input class="form-control" id='regDate' value='${ board.regDate }'>
		          </div>
		          
		          <div class="form-group">
		            <label>수정일자</label> 
		            <input class="form-control" id='updateDate' value='${ board.updateDate }'>
		          </div>
		          
		          <div class="form-group">
		            <label>조회수</label> 
		            <input class="form-control" id='readCount' value='${ board.readCount }'>
		          </div>
		          
		          <c:if test="${ loginuser.email == board.writer }" >
		          <button id="edit-button" type="button" class="btn btn-success">수정</button>
		          <button id="delete-button" type="button" class="btn btn-success">삭제</button>
		          </c:if>
		          <button id="tolist-button" type="button" class="btn btn-success">목록</button>
		       
            </div>
          </div>
						
		<div class='rowx'>

			<div class="col-lg-12">

				<div class="panel panel-default">

					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i>
						<h2 class="d-inline">Reply</h2>
						<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right float-right'>New Reply</button>
					</div>
					<br>
					<div id="reply-list-container" class="panel-body">
					
						<jsp:include page="reply-list.jsp" />

					</div>

					<div class="panel-footer">
					</div>

				</div>
			</div>

		</div>
		<br><br><br><br><br>

        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->
  </div>
  <!-- End of Page Wrapper -->
  	<!-- Modal -->
	<div class="modal fade" id="reply-modal" tabindex="-1" role="dialog" aria-labelledby="reply-modal-label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reply-modal-label">댓글 쓰기</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
            			<span aria-hidden="true">×</span>
          			</button>					
				</div>
				<div class="modal-body">
				<form id="reply-form">
					<div class="form-group">
						<label>Reply</label>
						<input class="form-control" name='reply' id="modal-reply" value=''>
					</div>
					<div class="form-group">
						<label>Replyer</label>
						<input class="form-control" name='replyer' id="modal-replyer" value=''>
					</div>
						<input type="hidden" name="bno" value='${ board.bno }'>
						<input type="hidden" name="rno">
						<input type="hidden" name="action"> <!-- 댓글 or 댓글의 댓글인지 구분하는 표식 -->
				</form>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-success">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-success">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-success">Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-success">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

  <%@include file="/WEB-INF/views/modules/common-js.jsp" %>
  
  <script type="text/javascript">
	$(function() {
		
		$('input, textarea').attr({'readonly': 'readonly'})
		
		$('#tolist-button').on('click', function(event) {
			location.href = "list.action?pageNo=${ param.pageNo }&searchType=${ param.searchType }&searchKey=${ param.searchKey }";
		});

		$('#delete-button').on('click', function(event) {

			var yes = confirm("${ board.bno }번 글을 삭제할까요?");
			if (!yes) {
				return;
			}
			
			//location.href = 'delete.action?bno=${ board.bno }&pageNo=${ param.pageNo }';
			var form =
				makeForm('delete.action', ${ board.bno }, ${ param.pageNo }, '${ param.searchType }', '${ param.searchKey }');
			form.submit();
		});

		$('#edit-button').on('click', function(event) {
			//location.href = "update.action?bno=${ board.bno }";
			var form =
				makeForm('update.action', ${ board.bno }, ${ param.pageNo }, '${ param.searchType }', '${ param.searchKey }');
				// searchType 과 searchKey 에 '' 을 안넣으면 변수로 인식되기때문에 , 
			form.submit();
		});

		function makeForm(action, bno, pageNo, searchType, searchKey, method="get") {
			var form = $('<form></form>');
			form.attr({
				'action': action,
				'method': method
			});
			form.append($('<input>').attr({
				"type": "hidden",
				"name": "bno",
				"value" : bno })
			);
			form.append($('<input>').attr({
				"type": "hidden",
				"name": "pageNo",
				"value" : pageNo })
			);
			form.append($('<input>').attr({
				"type": "hidden",
				"name": "searchType",
				"value" : searchType })
			);
			form.append($('<input>').attr({
				"type": "hidden",
				"name": "searchKey",
				"value" : searchKey })
			);
			
			form.appendTo("body");
			
			return form;
		}

	});
	///////////////////////////////////////////////////////////////////////////////////////////////////
	// 댓글 관련 구현
	
	$(function(){

		$("#addReplyBtn").on("click", function(event){

			//$("#modal-reply").attr({ "readonly" : false }).val("");
			$("#reply-form input[name!=bno]").attr({ "readonly" : false }).val("");
			// .val() 을 해주지않으면 모달에서 글을 작성하다가 모달 하이드 한뒤, 다시 모달에 진입하면 전에 쓰던 글이 남아있음 -> 이걸 클린 해줌
			
			//$("#modalModBtn").css({ "display" : "none" });
			$("#modalRemoveBtn, #modalModBtn").css({ "display" : "none" });
			$("#modalRegisterBtn").css({ "display" : "inline" });

			$("#reply-form input[name=rno]").val("0");			// 이거 없으면 reply 등록할 때, 못함
			$("#reply-form input[name=action]").val("reply");
			
			// show boot-strap modal
			$("#reply-modal").modal('show');
		});

		$("#modalCloseBtn").on("click", function(event){
			$("#reply-modal").modal('hide');
		});


		$("#modalRegisterBtn").on("click", function(event){

			if($("#modal-reply").val().lenth == 0 ) {
				alert("댓글 내용을 입력하세요");
				return;
			}

			// .serialize() : form의 모든 입력요소의 데이터를 전송 형식으로 변환
			//var values = $("#reply-form").serialize();		// 문자열 형식으로 저장
			var values = $("#reply-form").serializeArray();		// jQuery 형식으로 배열 저장
			//console.log(values); return;

			$.ajax({
				"url" : "/spring-board-b/reply/write" ,
				"method" : "post" ,
				"data" : values ,
				"success" : function(data, status, xhr){
					$("#reply-modal").modal("hide");

					// 1. 비동기 목록 요청 1 - 정석 방법인데 책에 나와있음
					// 댓글 목록 조회
					// 데이터를 사용해서 javascript로 화면 생성
					
					// 2. 비동기 목록 요청 2 - 정석방법은 아니지만, 편리함
					// 댓글 목록을 사용해서 만들어진 HTML을 수신해서 화면에 적용 
					$("#reply-list-container").load("/spring-board-b/reply/list-by/${ board.bno }");

					
				},
				"error" : function(xhr, status, err){
					alert("댓글 쓰기 실패");
				}	
			})
			
		});

		// 페이지가 로딩되면 즉시 댓글 목록을 비동기 방식으로 요청해서 화면에 적용 -> 1대1 매핑 사용으로 주석처리
		//$("#reply-list-container").load("/spring-board-b/reply/list-by/${ board.bno }");

		
		//$('.reply-delete').on('click', function(event) {
		$('#reply-list-container').on('click', '.reply-delete', function(event) {
			var rno = $(this).attr('data-rno'); // this : 이벤트 발생 객체

			var yes = confirm(rno + "번 댓글을 삭제할까요?");
			if (!yes) return;

			$.ajax({
				"url": "/spring-board-b/reply/delete/" + rno,
				"method": "delete",
				//"data": { "rno" : rno },					// 2줄위에처럼 data를 경로로 보낼 수 있음
				"success": function(data, status, xhr) {
					//댓글 목록 갱신
					$('#reply-list-container').load("/spring-board-b/reply/list-by/${ board.bno }");
				},
				"error": function(xhr, status, err) {
				}
			});
		});

		/////////////////////////////////////////////////////////
		// 업데이트
		
		$('#reply-list-container').on('click', '.reply-update', function(event) {

			var rno = $(this).attr("data-rno");				// 수정버튼에 설정된 rno 를 가져옴
			var li = $("li[data-rno=" + rno + "]")			// rno 와 일치하는 li 를 가져옴
			//var li = $("li[data-rno" + rno + "] p")			// rno 와 일치하는 li 중에 p를 가져옴
			var p = li.find('p');

			$("#reply-form input[name!=action]").attr({ "readonly" : false }).val("");
			$("#modal-replyer").attr({ "readonly" : true }).val("");
			$("#modal-reply").val($.trim(p.text()));		// $.trim() : 양쪽 끝 공백을 제거하는 Jquery 함수
			
			$("#modalRegisterBtn, #modalRemoveBtn").css({ "display" : "none" });
			$("#modalModBtn").css({ "display" : "inline" });

			$("#reply-form input[name=rno]").val(rno);
			
			$("#reply-modal").modal('show');
			
		});

		$("#modalModBtn").on("click", function(event){

			//var data = $("#reply-form").serializeArray();
			var data = {			
			"rno" : $("#reply-form input[name=rno]").val() , 
			"reply" : $("#reply-form input[name=reply]").val()
			};
			
			$.ajax({
				"url" : "/spring-board-b/reply/update" ,
				"method" : "put" ,
				"data" : JSON.stringify(data) ,					// JSON Object -> JSON String
				"contentType" : "application/json" ,			// put 메소드 처리를 위해서 설정
				"success" : function(result, stauts, xhr){
					$("#reply-modal").modal('hide');
					$('#reply-list-container').load("/spring-board-b/reply/list-by/${ board.bno }");
				},
				"error" : function(xhr, status, err){
					alert("수정하는데 실패해버렸지 뭐얌?");
				}
			});

		});

		/////////////////////////////////////////////////
		// 댓글 답글
		
		$('#reply-list-container').on('click', '.reply-reply', function(event) {

			var rno = $(this).attr("data-rno");				// 수정버튼에 설정된 rno 를 가져옴

			$("#reply-form input[name!=bno]").attr({ "readonly" : false }).val("");

			$("#modal-replyer , modal-reply").attr({ "readonly" : false }).val("");
			
			$("#modalModBtn, #modalRemoveBtn").css({ "display" : "none" });
			$("#modalRegisterBtn").css({ "display" : "inline" });

			$("#reply-form input[name=rno]").val(rno);
			$("#reply-form input[name=action]").val("re-reply");
			
			$("#reply-modal").modal('show');
			
		});

		// 댓글의 댓글 등록 이벤트 처리기는 위의 댓글 등록 이벤트 처리기로 대체 한다

		 

	});
  </script>
  
</body>

</html>
