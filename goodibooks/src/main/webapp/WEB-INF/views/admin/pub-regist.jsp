<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>구디북스-출판사등록</title>
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
								<li><a href="#" class="active">출판사 등록</a></li>
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
							<h2>출판사 관리</h2>
						</div>
					</div>
					
					<div class="offset-lg-2 col-lg-8 col-md-12 col-12">
					
						<div id="pub-list-container">

							<%-- <jsp:include page="/WEB-INF/views/admin/pub-list.jsp"></jsp:include> --%>
							<div class="login-title text-center mb-30">
							<p>추가할 출판사명을 입력해주세요</p>
							</div>
							
							<form class="form-inline" id="pub-form" action="/goodibooks/admin/pubRegist" method="post">
							  <p>출판사명</p>&nbsp;&nbsp;&nbsp;
							  <input type="text" class="form-control mb-2 mr-sm-2" id="pub_name" name="pub_name" style="width:550px;">
							
							  <button type="submit" id="pubRegister-btn" class="btn btn-primary mb-2">등록하기</button>
							</form>
							<br><br>
							
							<table class="table table-hover">
								<thead>
								<tr>
									<th>출판사 번호</th>
									<th>출판사 이름</th>
									<th></th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${ publishers }" var="publisher">
								<tr>
									<td>${ publisher.pub_no }</td>
									<td>${ publisher.pub_name }</td>
									<td><button type="button" class="btn btn-outline-dark delete-button" data-pubNo="${ publisher.pub_no }">삭제</button></td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
							
							<!-- pagination-area-start -->
							<div class="pagination-area mt-50">
								<div class="page-number">
		 							<ul>
		 								${ pager }
									</ul>
								</div> 
							</div>
							<!-- pagination-area-end -->
							
							<form class="form-inline" action="toPubRegist" method="get">
							  <div class="form-group mx-sm-3 mb-2">
							    <label for="inputPassword2" class="sr-only">Pub_name</label>
							    <input type="search" name="searchKey" class="form-control" id="inputPassword2" placeholder="검색할 출판사명">
							  </div>
							  <button type="submit" class="btn btn-primary mb-2">검색</button>
							</form>
						
						</div>	
					
					</div>
					
				</div>
			</div>
		</div>
		
		
		<!-- footer-area-start -->
		<footer>
	
		<jsp:include page="/WEB-INF/views/modules/footbar.jsp" />
		
	</footer>

	

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

			// 출판사 삭제
			$("#pub-list-container").on("click", ".delete-button", function(event){

				var pub_no = $(this).attr("data-pubNo");
				
				if(!confirm("출판사를 삭제할까요?")) return;

				location.href="/goodibooks/admin/deletePub?pageNo=${param.pageNo}&searchKey=${param.searchKey}&pub_no=" + pub_no;
			});

			// 출판사 등록 - ajax 미사용
			/* $("#pubRegister-btn").on("click", function(event) {
				var data = $("#pub-form input[name=pub_name]").val()
				$.ajax({
					"url" : "/goodibooks/admin/pubRegist",
					"method" : "post",
					"data" : { "pub_name": data },
					"success" : function(data, status, xhr){
						$("#pub-list-container").load("/goodibooks/admin/showPub");
					},
					"error" : function(xhr, status, err){
						alert("실패해버렸지 뭐얌?")
					}
				})
			}); */

			// 출판사 삭제 - ajax 미사용
			/* $("#pub-list-container").on("click", ".delete-button", function(event){
				var pub_no = $(this).attr("data-pubNo");
				if(!confirm("출판사를 삭제할까요?")) return;
				$.ajax({
					"url" : "/goodibooks/admin/deletePub/" + pub_no,
					"method" : "delete",
					"data" : { "pub_no" : pub_no },
					"success" : function(data, status, xhr){
						$("#pub-list-container").load("/goodibooks/admin/showPub");
					},
					"error" : function(xhr, status, err){
						alert("삭제하는데 실패했지 뭐얌?");
					}
				})
			}); */
			

		});
	</script>
	
    </body>
</html>
