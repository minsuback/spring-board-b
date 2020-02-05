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
								<li><a href="#" class="active">공지사항-수정</a></li>
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
              <span class="m-0 font-weight-bold text-dark">글 수정</span>
            </div>
            
            <div class="card-body">
               <form id="update-form" role="form" action="update.action" method="post">
		          <input type="hidden" name="no" value="${ board.no }">
		          <div class="form-group">
		            <label>제목</label> 
		            <input class="form-control" id='title' name='title' value='${ board.title }'>
		          </div>
		
		          <div class="form-group">
		            <label>내용</label>
		            <textarea class="form-control" rows="3" id='content' name='content'>${ board.content }</textarea>
		          </div>

		          <button id="update-button" type="button" class="btn btn-dark">수정</button>
		          <button type="reset" class="btn btn-dark">다시쓰기</button>
		          <button id="cancel-button" type="button" class="btn btn-dark">취소</button>
		          <button id="tolist-button" type="button" class="btn btn-dark">목록</button>
		        </form>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->


  <%@include file="/WEB-INF/views/modules/common-js.jsp" %>
  
  <script type="text/javascript">
	$(function() {
		$('#tolist-button').on('click', function(event) {
			location.href = "notice.action";
		});

		$('#update-button').on('click', function(event) {
			
			if ($('#title').val() == '') {
				alert('제목을 입력하세요');
				$('#title').focus();
				return;
			}
			if ($('#contet').val() == '') {
				alert('내용를 입력하세요');
				$('#content').focus();
				return;
			}

			$('#update-form').submit();
		});

		$('#cancel-button').on('click', function(event) {
			location.href = 'detail.action?no=${ board.no }';
		});
	});
  </script>
  
</body>

</html>












