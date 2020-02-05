<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
							<li><a href="#" class="active">1대1 문의</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	
	
	<!-- mainsection : 1:1 문의 -->
	<div class="container">
	<table class="table table-hover">
		<thead>
		<tr>
			<th>번호</th>
			<th>문의유형</th>
			<th>제목</th>
			<th>작성자</th>
			<th>문의일시</th>
			<th>답변여부</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${ askList }" var="ask">
		<c:if test="${ loginuser.id == ask.id || loginuser.userType == true }">
		<tr>
			<td>${ ask.no }</td>
			<td>${ ask.qnaType }</td>
			<td><a href="askdetail.action?no=${ask.no}" style="color:black"> ${ ask.title }</a></td>
			<td>${ ask.id }</td>
			<td><fmt:formatDate value="${ ask.regDate }" pattern="yyyy-MM-dd"/></td>
			<td>${ ask.ans_check == true ? "답변완료" : "답변대기" }</td>
		</tr>
		</c:if>
		</c:forEach>
		</tbody>
	</table>
	<hr/>
	
	<c:choose>
	<c:when test="${ loginuser.userType == false }">
	<a href="/goodibooks/board/askwrite.action" class="btn btn-light pull-right">
		<span class="text">글쓰기</span>
	</a>
	</c:when>
	</c:choose>
	</div>
	
	
	<br><br><br>
	
	<!-- end of mainsection -->
	
	

	<!-- footer-area-start -->
	<footer>

		<jsp:include page="/WEB-INF/views/modules/footbar.jsp" />

	</footer>
	<!-- Modal end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

</body>
</html>
