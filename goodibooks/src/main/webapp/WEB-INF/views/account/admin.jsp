<%@ page import="com.goodibooks.vo.MemberVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>구디북스-회원관리</title>
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
								<li><a href="#" class="active">모든 회원 조회</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumbs-area-end -->
		
		<!-- 200114 -->
		
		<div class="container">
		<h4>모든 회원정보</h4>
		<table class="table table-striped">
			<thead>
			<tr>
				<td>ID</td>
				<td>이름</td>
				<td>전화번호</td>
				<td>E-mail</td>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="member" items="${ list }">
			<tr>
				<td>${ member.id }</td>
				<td>${ member.name }</td>
				<td>${ member.phone }</td>
				<td>${ member.email }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<br><br><br>
		</div>
		<!-- 200114 -->
		
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
