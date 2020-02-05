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
								<li><a href="/goodibooks/">Home</a></li>
								<li><a href="#" class="active">이벤트리스트</a></li>
								<li><a href="#" class="active">이벤트 등록</a></li>
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
					
					<form id="register-form" action="/goodibooks/admin/eventBoard-write.action" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="${loginuser.id}" />
						
						 <div class="form-group" style="width:360px;">
							  <label for="inputAddress">제목</label>
							  <input type="text" class="form-control" id="title" name="title">
						  </div>
						  
						  <div class="form-group" style="width:250px; float:left;">
							  <label for="inputAddress">이벤트 시작일자</label>
							  <input type="date" class="form-control" id="beginDate" name="beginDate">
						  </div>
						  &nbsp;&nbsp;
						  <div class="form-group" style="width:250px; display:inline-block">
						    <label for="inputAddress">이벤트 끝일자</label>
						    <input type="date" class="form-control" id="endDate" name="endDate">
						  </div>
						  
						   <div class="form-group">
						    <label for="exampleFormControlFile1">이벤트 배너 이미지</label>
						    <input type="file" class="form-control-file" id="eventImg" name="eventImg">
						  </div>
						  <div class="form-group">
						    <label for="exampleFormControlTextarea1">내용</label>
						    <textarea class="form-control" id="content" name="content" rows="8"></textarea>
						  </div>

						  <br><br>
						  <button id="formSubmit" type="submit" class="btn btn-primary">이벤트 등록</button>
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

	});
	</script>
	
    </body>
</html>
