<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>구디북스-이벤트관리</title>
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
		<!-- header-area-end -->
		<!-- breadcrumbs-area-start -->
		<div class="breadcrumbs-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumbs-menu">
							<ul>
								<li><a href="#">Home</a></li>
								<li><a href="#" class="active">이벤트 상세보기</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumbs-area-end -->
		
		
		<div class="user-login-area mb-70">
		<div class="container">
			<div class="row">
				<div class="offset-lg-2 col-lg-8 col-md-12 col-12">
					<!-- <div class="billing-fields"> -->
						 <div class="form-group" style="width:360px;">
							  <label for="inputAddress">제목</label>
							  <input type="text" class="form-control" id="title" value="${event.title}">
						  </div>
						  
						  <div class="form-group" style="width:250px; float:left;">
							  <label for="inputAddress">이벤트 시작일자</label>
							  <input type="date" class="form-control" id="beginDate" value="${event.beginDate}">
						  </div>
						  &nbsp;&nbsp;
						  <div class="form-group" style="width:250px; display:inline-block">
						    <label for="inputAddress">이벤트 끝일자</label>
						    <input type="date" class="form-control" id="endDate" value="${event.endDate}">
						  </div>
						   <div class="form-group">
						   	 <label for="inputAddress">배너 이미지</label>
						   	 <div  style="border:1px solid gray; height:400px; background-size:cover; background-image:url('/goodibooks/resources/file/eventImg/${event.img}')"></div>
						  </div>
						  <div class="form-group">
						    <label for="exampleFormControlTextarea1">이벤트 내용</label>
						    <p class="form-control" id="content" style="height:auto">${event.content}</p>
						  </div>

						  <br><br>
						  <a id="listBtn" href="eventBoard.action" class="btn btn-primary">목록으로</a>
						  <a id="modBtn" href="eventBoard-update.action?no=${event.no}" class="btn btn-primary">수정</a>
						  
						  <form id="delform" action="eventBoard-delete.action" method="post" style="display:inline-block">
						  <a id="delBtn" href="" class="btn btn-primary">삭제</a>
						  <input type="hidden" name="no" value="${event.no}">
						  </form>
						  
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- footer-area-start -->
		<footer>
	
		<jsp:include page="/WEB-INF/views/modules/footbar.jsp" />
		
	</footer>
	<!-- Modal end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	<script type="text/javascript">
	$(function() {
		$(".row input").attr("readonly", "readonly");
		
		$("#delBtn").on("click", function(event) {
			if (!confirm("정말 삭제하시겠습니까?")) return;
			else $("#delform").submit();
		});
	});
	</script>
	
    </body>
</html>
