<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Koparion – Book Shop HTML5 Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
		<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

		<!-- all css here -->
		
		<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
		
        <script src="/goodibooks/resources/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body class="login">
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
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
								<li><a href="#" class="active">로그인</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumbs-area-end -->
		<!-- user-login-area-start -->
		<div class="user-login-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="login-title text-center mb-30">
							<h2>로그인</h2>
						</div>
					</div>
					<div class="offset-lg-3 col-lg-6 col-md-12 col-12">
						<form id="login-form" action="login.action" method="post">
							<div class="login-form">
								<div class="single-login">
									<label>ID<span>*</span></label>
									<input type="text" id="id" name="id"/>
								</div>
								<div class="single-login">
									<label>패스워드 <span>*</span></label>
									<input type="password" id="passwd" name="passwd"/>
								</div>
								<div class="single-login single-login-2">
									<button type="button" id="login" class="btn btn-primary">로그인</button>
									<!-- <button type="submit" >로그인</button> -->
								</div>
								<!-- <a href="#">Lost your password?</a> -->
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- user-login-area-end -->
		
		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h5 class="modal-title" id="modalTitle">알림</h5>
		          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">×</span>
		          </button>
		        </div>
		        <div class="modal-body"></div>
		        <div class="modal-footer">
		          <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
		        </div>
		      </div>
		    </div>
		  </div>
		
		<!-- footer-area-start -->
		<footer>

			<jsp:include page="/WEB-INF/views/modules/footbar.jsp" />

		</footer>
		<!-- footer-area-end -->
		
		<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
		
		<script type="text/javascript">
	$(function(){

		var newId = '${ newId }'; 
		var loginFalse = '${ loginFalse }'; 
		
		if (newId && !history.state) {
			$('#messageModal .modal-body').text("회원가입이 완료 되었습니다.")
			$('#messageModal').modal('show');
		} else if( loginFalse && !history.state ){
			$('#messageModal .modal-body').text("로그인 실패 하였습니다.")
			$('#messageModal').modal('show');
		}
		history.replaceState({}, null, null);


		$("#login").on("click" , function(event) {
			// 1. 유효성 검사
			if($("#id").val() == '' ){
				alert("아이디를 입력하세요!");
				$("#id").focus();
				return;
			}
			if($("#passwd").val() == '' ){
				alert("패스워드를 입력하세요!");
				$("#passwd").focus();
				return;
			}
			
			// 2. 오류가 없다면 서버로 전송
			$("#login-form").submit();
		});

		


	});
	</script>
    </body>
</html>
