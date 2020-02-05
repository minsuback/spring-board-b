<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

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
  <link href="/spring-board-a/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/spring-board-a/resources/css/sb-admin-2.min.css" rel="stylesheet">

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
		          
		          <button id="edit-button" type="button" class="btn btn-success">수정</button>
		          <button id="delete-button" type="button" class="btn btn-success">삭제</button>
		          <button id="tolist-button" type="button" class="btn btn-success">목록</button>
		       
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->
  </div>
  <!-- End of Page Wrapper -->

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
  </script>
  
</body>

</html>
