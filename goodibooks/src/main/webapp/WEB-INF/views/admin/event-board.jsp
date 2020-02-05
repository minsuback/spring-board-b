<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

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
							<li><a href="#" class="active">이벤트리스트</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	
	<div class="container">
		<jsp:include page="/WEB-INF/views/admin/event-board-list.jsp"></jsp:include>
	
	<c:if test="${loginuser.userType == true}">
	<a href="/goodibooks/admin/eventBoard-write.action" class="btn btn-light pull-right">
		<span class="text">글쓰기</span>
	</a>
	</c:if>
	</div>
	<br><br><br>

	<footer>

		<jsp:include page="/WEB-INF/views/modules/footbar.jsp" />

	</footer>
	<!-- Modal end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

<script type="text/javascript">
$(function(){
	$(".activeBtn").on("click", function(event) {
		var confirmTxt = "배너를 " + (($(this).text() == "활성화") ? "비활성화" : "활성화") + " 하시겠습니까?";
		if (!confirm(confirmTxt)) return;
		
		else {
			$.ajax({
				"url" : "eventActive.action",
				"method" : "post",
				"data" : {
					"no" : $(this).attr("no"),
					"active" : ($(this).text() == "활성화") ? false : true
				},
				"success" : function(data, status, xhr) { $(".container").load("/goodibooks/admin/event-board-list.jsp"); },
				"error" : function(xhr, status, err) { alert(err); }
			});
		}
	});
});
</script>
</body>
</html>
