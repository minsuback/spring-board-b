<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

</head>
<body class="blog">

	<!-- mainsection : 1:1 문의 답변작성 -->
	
	<c:choose>
	<c:when test="${ loginuser.userType == true }">
	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<span class="m-0 font-weight-bold text-default">답변 작성</span>
			</div>
			<div class="card-body">
				<form id="answerwrite-form" role="form">
						<input type="hidden" name='no' value="${ askdetail.no }"></input>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" id='ans_content'
							name='ans_content'></textarea>
					</div>
					<button id="answerwrite-button" type="button" class="btn btn-light">
						답변등록
					</button>
				</form>
			</div>
		</div>
	</div>
	</c:when>
	</c:choose>

	<br>
	<br>
	<br>

	<!-- end of mainsection -->

</body>
</html>
