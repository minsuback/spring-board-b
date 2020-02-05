<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>구디북스-공지사항</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
		<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

		<!-- all css here -->
		<!-- bootstrap v3.3.6 css -->
        <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
		
    	<script src="/goodibooks/resources/js/vendor/modernizr-2.8.3.min.js"></script>
    	
    </head>

<body class="blog">
		<!-- header-area-start -->
        <header>
		
			<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
		
		
		</header>
		<div class="breadcrumbs-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumbs-menu">
							<ul>
								<li><a href="/goodibooks/">Home</a></li>
								<li><a href="/goodibooks/board/notice.action">공지사항</a></li>
								<li><a href="#" class="active">${ board.title }</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		 <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid" style="width: 60%; margin: auto;">

          <h1 class="h3 mb-2 text-gray-800">NOTICE</h1>
          <br>
          
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <span class="m-0 font-weight-bold text-dark">공지사항</span>
            </div>
            
            <div class="card-body">
               	  <div class="form-group">
		            <label>글번호</label> 
		            <input class="form-control" id='no' name='no' value='${ board.no }'>
		          </div>
		          
		          <div class="form-group">
		            <label>제목</label> 
		            <input class="form-control" id='title' name='title' value='${ board.title }'>
		          </div>
		
		          <div class="form-group">
		            <label>내용</label>
		            <textarea style="height:300px;" class="form-control" rows="3" id='content' name='content'>${ board.content }</textarea>
		          </div>

		          <div class="form-group">
		            <label>작성일자</label> 
		            <input class="form-control" id='regDate' value='${ board.regDate }'>
		          </div>
		          
		          <div class="form-group">
		            <label>수정일자</label> 
		            <input class="form-control" id='updateDate' value='${ board.updateDate }'>
		          </div>
		          <c:if test="${ loginuser.userType == true }">
		          <button id="edit-button" type="button" class="btn btn-dark">수정</button>
		          <button id="delete-button" type="button" class="btn btn-dark">삭제</button>
		          </c:if>
		          <button id="tolist-button" type="button" class="btn btn-dark">목록</button>
		       
            </div>
          </div>

		
		<br><br><br><br><br>

        </div>


  <%@include file="/WEB-INF/views/modules/common-js.jsp" %>
  
  <script type="text/javascript">
  $(function() {
	  $('input, textarea').attr({'readonly': 'readonly'})
		$('#tolist-button').on('click', function(event) {
			location.href = "notice.action";
		});
		$('#delete-button').on('click', function(event) {

			var yes = confirm("${ board.no }번 글을 삭제할까요?");
			if (!yes) {
				return;
			}
			location.href = 'delete2.action?no=${ board.no }';
		});
		$('#edit-button').on('click', function(event) {
			location.href = "update.action?no=${ board.no }";
			
		});
  });
  </script>
  
</body>

</html>