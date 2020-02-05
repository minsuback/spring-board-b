<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<!doctype html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>구디북스-1대1문의</title>
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
							<li><a href="/goodibooks/board/ask.action">1대1 문의</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->


	<!-- mainsection : 1:1 문의 작성 -->
	
	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<span class="m-0 font-weight-bold text-default">수정하기</span>
			</div>
			<div class="card-body">
				<form id="askupdate-form" role="form" action="askupdate.action" method="post">
					<div class="form-group"> 
						<input class="form-control" type="hidden" id='no'
							name='no' value='${ askupdate.no }'>
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" id='title'
							name='title' value='${ askupdate.title }'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" id='content'
							name='content'>'${ askupdate.content }'</textarea>
					</div>

					<div class="form-group">
						<label>작성자</label>
						<input class="form-control fixed" id='id' name='id' value="${ loginuser.id }">
					</div>

					<button id="askupdate-button" type="button" class="btn btn-light">수정</button>
					&nbsp
					<button id="cancel-button" type="button" class="btn btn-light">취소</button>
					&nbsp
					<button id="toask-button" type="button" class="btn btn-light">목록</button>
				</form>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>

	<!-- end of mainsection -->



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
			$('#toask-button').on('click', function(event) {
				location.href = "ask.action";
			});

			$('#askupdate-button').on('click', function(event) {
				$('#askupdate-form').submit();
			})
			
			$('#cancel-button').on('click', function(event) {
				history.back();
			});

			$('.fixed').attr({'readonly': 'readonly'})
		})
	</script>

</body>
</html>
