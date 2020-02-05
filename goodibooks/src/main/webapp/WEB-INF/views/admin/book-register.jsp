<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>구디북스-책등록</title>
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
							<li><a href="#" class="active">책 등록</a></li>
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
				<div class="col-lg-12">
					<div class="login-title text-center mb-30">
						<h2>책 등록</h2>
					</div>
				</div>
				<div class="offset-lg-2 col-lg-8 col-md-12 col-12">
					<!-- <div class="billing-fields"> -->
					
					<!-- form 변경 -->
					<form id="register-form" action="/goodibooks/admin/bookRegister" method="post" enctype="multipart/form-data">
						
						<!-- <div class="form-group" style="width:360px;">
					      <label for="inputState">카테고리</label>
					      <select id="category_no" name="category_no" class="form-control">
					        <option value="9">경제/경영</option>
					        <option value="10">과학</option>
					        <option value="11">만화</option>
					        <option value="12">소설</option>
					        <option value="13">수험서/자격증</option>
					        <option value="14">예술</option>
					        <option value="15">자기계발</option>
					        <option value="16">컴퓨터</option>
					        <option value="17">에세이/시</option>
					      </select>
					    </div> -->
					    
					    <div class="form-group" style="width:360px;">
					      <label for="inputState">카테고리</label>
					      <select id="category_no" name="category_no" class="form-control">
							<c:forEach items="${ categorys }" var="category">
							<option value="${ category.category_no }">${ category.category_name }</option>				        
					        </c:forEach>
					      </select>
					    </div>
					    
						<!-- <div class="form-group" style="width:360px;">
					      <label for="inputState">출판사</label>
					      <select id="pub_no" name="pub_no" class="form-control">
					        <option value="1">웨일북</option>
					        <option value="2">샘터사</option>
					        <option value="3">사이언스북스</option>
					        <option value="4">열린책들</option>
					      </select>
						</div> -->
						
						<div class="form-group" style="width:360px;">
					      <label for="inputState">출판사</label>
					      <select id="pub_no" name="pub_no" class="form-control">
							<c:forEach items="${ publishers }" var="publisher">
							<option value="${ publisher.pub_no }">${ publisher.pub_name }</option>				        
					        </c:forEach>
					      </select>
					    </div>
						
						 <div class="form-group" style="width:360px;">
							  <label for="inputAddress">책이름</label>
							  <input type="text" class="form-control" id="name" name="name">
						  </div>
						  <div class="form-group" style="width:360px;">
							  <label for="inputAddress">가격</label>
							  <input type="text" class="form-control" id="price" name="price">
						  </div>
						  <div class="form-group" style="width:360px;">
						    <label for="inputAddress">지은이</label>
						    <input type="text" class="form-control" id="writer" name="writer">
						  </div>
						  <div class="form-group">
						    <label for="exampleFormControlTextarea1">책소개</label>
						    <textarea class="form-control" id="intro" name="intro" rows="8"></textarea>
						  </div>
						  <div class="form-group">
						    <label for="exampleFormControlTextarea1">목차</label>
						    <textarea class="form-control" id="contents" name="contents" rows="8"></textarea>
						  </div>
						  <div class="form-row">
						    <label for="exampleFormControlFile1">책 이미지1</label>
						    <input type="file" class="form-control-file" name="bookImg" data-idx="1">
							<label for="exampleFormControlFile1">책 이미지2</label>
						    <input type="file" class="form-control-file" name="bookImg" data-idx="2">
						    <label for="exampleFormControlFile1">책 이미지3</label>
						    <input type="file" class="form-control-file" name="bookImg" data-idx="3">
						    <label for="exampleFormControlFile1">책 이미지4</label>
						    <input type="file" class="form-control-file" name="bookImg" data-idx="4">
						  </div>
						  
						  <br><br>
						  <button id="formSubmit" type="submit" class="btn btn-primary">책등록</button>
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
		$('input[name=bookImg]').on('change', function(event) {
			var idx = $(this).attr('data-idx');

			if (this.files && this.files[0]) { //파일선택기의 파일 선택 확인
				var reader = new FileReader();

				//파일을 다 읽었을 때 호출할 함수 지정
				reader.onload = function(e) {
					$('#bookImg' + idx).attr('src', e.target.result);
				};

				reader.readAsDataURL(this.files[0]); // 파일 읽기
			}
			
		});

	});
	</script>
	
    </body>
</html>
