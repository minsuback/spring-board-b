<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Koparion – Book Shop HTML5 Template</title>
<style>
	.error { 
		color: red; 
		font-weight: bold; 
	}
</style>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/goodibooks/resoures/img/favicon.png">

<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

<script src="/goodibooks/resources/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body class="register">
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
							<li><a href="#" class="active">회원가입</a></li>
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
						<h2>회원가입</h2>
						<p>구디북스 회원가입을 환영합니다</p>
					</div>
				</div>
				<div class="offset-lg-2 col-lg-8 col-md-12 col-12">
					<!-- <div class="billing-fields"> -->
					
					<!-- form 변경 -->
					<form id="register-form" action="register.action" method="post">
						  
						  <label for="inputAddress">아이디</label>
						  <div class="form-row align-items-center">
						    <div class="col-auto" style="width:360px;">
						      <input type="text" id="id" name="id" class="form-control mb-2">
						    </div>
						    <div class="col-auto">
						      <button type="button" class="btn btn-primary mb-2" id="id-check">중복 확인</button><p id="id-check-result" style="display: inline; margin-left: 20px;"></p>
						    </div>
						  </div>
						    
						  <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputEmail4">패스워드</label>
						      <input type="password" class="form-control" id="passwd" name="passwd">
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputPassword4">패스워드 확인</label>
						      <input type="password" class="form-control" id="confirm" >
						      <p id="pw-check-result" style="display: inline;"></p>
						    </div>
						    
						  </div>
						  
						  <div class="form-group" style="width:360px;">
						    <label for="inputAddress">이름</label>
						    <input type="text" class="form-control" id="name" name="name" placeholder="">
						  </div>
						  <div class="form-group" style="width:360px;">
						    <label for="inputAddress">이메일</label>
						    <input type="email" class="form-control" id="email" name="email" placeholder="">
						  </div>
						  <div class="form-group" style="width:360px;">
						    <label for="inputAddress2">핸드폰</label>
						    <input type="text" class="form-control" id="phone" name="phone" placeholder="-빼고 입력">
						  </div>
						  
						  <label for="inputAddress">우편번호</label>
						  <div class="form-row align-items-center">
						    <div class="col-auto" style="width:360px;">
						      <input type="text" id="addr1" name="addr1" class="form-control mb-2">
						    </div>
						    <div class="col-auto">
						      <button type="button" class="btn btn-primary mb-2" id="btn">우편번호 찾기</button>
						    </div>
						  </div>
						  
						  <div class="form-group" style="width:360px;">
						    <label for="inputAddress2">도로명 주소</label>
						    <input type="text" class="form-control" id="addr2" name="addr2" placeholder="">
						   </div>
						   <div class="form-group" style="width:360px;">
						    <label for="inputAddress2">상세 주소</label>
						    <input type="text" class="form-control" id="addr3" name="addr3" placeholder="">
						  </div>
						  <br>
						  <button type="button" id="register" class="btn btn-primary">회원가입</button>
						</form>
					
					
					<!--  form 변경 전 -->
						<!-- <form action="register.action" method="post">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<div class="single-register">
										<label>ID<span>*</span></label> <input type="text" name="id" />
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<div class="single-register">
										<label>패스워드<span>*</span></label> <input type="password"
											placeholder="Password" name='passwd' />
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="single-register">
										<label>패스워드 확인<span>*</span></label> <input type="password"
											placeholder="Password" />
									</div>
								</div>
							</div>

							<div class="single-register">
								<label>이름<span>*</span></label> <input type="text" name="name" />
							</div>

							<div class="single-register">
								<label>핸드폰<span>*</span></label> <input type="text" name="phone" />
							</div>

							<div class="single-register">
								<label>이메일<span>*</span></label> <input type="email" name="email" />
							</div>

							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<div class="single-register">
										<label>우편번호<span>*</span></label> 
										<input type="text" id="addr1" name='addr1' />
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="single-register">
										<button type="button" id="btn" >우편번호 찾기</button>
									</div>
								</div>
							</div>

							<div class="single-register" style="width:100%">
								<label>도로명 주소<span>*</span></label> 
								<input type="text" id="addr2" name="addr2"/>
							</div>
							<div class="single-register">
								<label>상세 주소<span>*</span></label> 
								<input type="text" id="addr3" name="addr3" />
							</div>
							
							<div class="single-register">
								<button id="register" type="submit">회원가입</button>
							</div>
						</form> -->
					<!-- </div> -->


				</div>
			</div>
		</div>
	</div>
	<!-- user-login-area-end -->
	<!-- footer-area-start -->
	<footer>

		<jsp:include page="/WEB-INF/views/modules/footbar.jsp" />

	</footer>
	<!-- footer-area-end -->


	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

	<!-- 다음 주소 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript">
	$(function(){

		$("#addr1, #addr2").attr({"readonly": "readonly" });

		$("#btn").on("click", function(event) {
			 new daum.Postcode({
			        oncomplete: function(data) {

						$("#addr1").val(data.postcode);
						$("#addr2").val(data.roadAddress);
						//$("#jibunAddress").val(data.jibunAddress);
	                   	
			        }
			    }).open();
		});

		$("#register").on("click" , function(event) {
			
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
			if($("#confirm").val() == '' ){
				alert("패스워드 확인을 입력하세요!");
				$("#confirm").focus();
				return;
			}
			if($("#name").val() == '' ){
				alert("이름을 입력하세요!");
				$("#name").focus();
				return;
			}
			if($("#email").val() == '' ){
				alert("이메일을 입력하세요!");
				$("#email").focus();
				return;
			}
			if($("#phone").val() == '' ){
				alert("핸드폰을 입력하세요!");
				$("#phone").focus();
				return;
			}if($("#addr1").val() == '' ){
				alert("우편번호를 입력하세요!");
				return;
			}
			if($("#addr3").val() == '' ){
				alert("상세주소를 입력하세요!");
				$("#addr3").focus();
				return;
			}
			
			// 2. 오류가 없다면 서버로 전송
			$("#register-form").submit();
		});

		// id 중복체크
		$("#id-check").on("click", function(event) {
			
			$.ajax({
				"url" : "checkId.action",
				"method" : "get",
				"data" : { "id" : $("#id").val() },
				"success" : function(result, status, xhr) {
					if (result == "success") $("#id-check-result").text("사용 가능한 아이디 입니다.");
					else {
						$("#id-check-result").text("중복된 아이디 입니다.");
						$("#id").focus().val("");
					}
				},
				"error" : function(xhr, status, err) { alert("아이디 중복체크 실패"); }
			});

		});

		// 비밀번호 confirm
		$("#confirm").change(function(event) {
			var pw = $("#passwd").val();
			if ($(this).val() != pw) $("#pw-check-result").text("비밀번호가 일치하지 않습니다.");
			else $("#pw-check-result").text("");
		});
		
		
	});
	</script>

</body>

</html>