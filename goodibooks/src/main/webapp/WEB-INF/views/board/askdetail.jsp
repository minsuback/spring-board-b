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
							<li><a href="/goodibooks/board/ask.action">1대1 문의</a></li>
							<li><a href="#" class="active">${ askdetail.title }</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	
	
	<!-- mainsection : 1:1 문의 게시글 상세-->
	
	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<span class="m-0 font-weight-bold text-default">글 상세 보기</span>
			</div>
			<div class="card-body">
				<form id="write-form" role="form" action="askwrite.action"
					method="post">
					<div class="form-group">
						<label>글 번호</label> <input class="form-control fixed" id='no'
							name='no' value='${ askdetail.no }'>
					</div>
 					<div class="form-group">
						<label>문의유형</label>
						<textarea class="form-control fixed" rows="3" id='qnaType'
							name='qnaType'>${ askdetail.qnaType }</textarea>
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control fixed" id='title'
							name='title' value='${ askdetail.title }'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control fixed" rows="3" id='content'
							name='content'>${ askdetail.content }</textarea>
					</div>

					<div class="form-group">
						<label>작성자</label>
						<textarea class="form-control fixed" rows="3" id='id'
							name='id'>${ askdetail.id }</textarea>
					</div>
					
					<div class="form-group">
		            	<label>작성일자 : </label> 
		            	<fmt:formatDate value="${ askdetail.regDate }" pattern="yyyy-MM-dd"/>
		            </div>
		            
		            <div class="form-group">
		            	<label>수정일자 : </label> 
		            	<fmt:formatDate value="${ askdetail.updateDate }" pattern="yyyy-MM-dd"/>
		            </div>
		            
		            <div class="form-group">
		            	<label>답변여부</label> 
		            	<input class="form-control fixed" id='ans_check' value='${ askdetail.ans_check == true ? "답변완료" : "답변대기" }'>
		            </div>
		            <br>

					<button id="askwriteedit-button" type="button" class="btn btn-light">수정하기</button>
					&nbsp
					<button id="delete-button" type="reset" class="btn btn-light">삭제</button>
					&nbsp
					<button id="toask-button" type="button" class="btn btn-light">목록</button>
				</form>
			</div>
		</div>
	</div>
	
	<br><hr><br><br>
	
	<div id="reply-list-container Answers" class="panel-body">
	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<span class="m-0 font-weight-bold text-default">답변</span>
			</div>
			<div class="card-body">
					<div class="form-group">
						<input type="hidden" class="form-control fixed" rows="3" id='ans_no'
							name='ans_no' value="${ answers.ans_no }">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control fixed" rows="3" id='ans_content'
							name='ans_content'>${ answers.ans_content }</textarea>
					</div>
			</div>
		</div>
	</div>
	</div>
	
		<jsp:include page="/WEB-INF/views/board/answerwrite.jsp" />
	
	
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
	
	<script type="text/javascript">
		$(function() {
			$('.fixed').attr({'readonly': 'readonly'})

			$('#toask-button').on('click', function(event) {
				location.href = "ask.action";
			});
			$('#delete-button').on('click', function(event) {

				var yes = confirm("${ askdetail.no }번 글을 삭제할까요?");
				if (!yes) {
					return;
				}
				//location.href = 'delete.action?no=${ askdetail.no }';
				var form =
					makeForm('askdelete.action', ${ askdetail.no });
				form.submit();
			});
			$('#askwriteedit-button').on('click', function(event) {
				//location.href = "update.action?no=${ askdetail.no }";
				var form =
					makeForm('askupdate.action', ${ askdetail.no });
				form.submit();
			});

			function makeForm(action, no, method="get") {
				var form = $('<form></form>');
				form.attr({
					'action': action,
					'method': method
				}); 
				form.append($('<input>').attr({
					"type": "hidden",
					"name": "no",
					"value": no })
				);
				form.appendTo("body");

				return form;
			}

			$('#answerwrite-button').on('click', function(event) {

				/* event.preventDefault();
				event.stopPropagation(); */
				
				if ($('#content').val() == '') {
					alert('답변 내용을 입력하세요');
					$('#content').focus();
					return;
				}

				var values = $('#answerwrite-form').serialize();

				$.ajax({
					"url" : "/goodibooks/board/answerwrite",
					"method" : "post",
					"data" : values,
					"success" : function(data, status, xhr) {
						$("#Answers").load("/goodibooks/board/answerContent/${ askdetail.no }");
					},
					"error" : function(xhr, status, err) {
						alert("답변 등록 실패")
					}

				});
			})

			/* function changeItem() {
				var itemidSelect = document.getElementById("ITEM_ID");

				var itemID = itemidSelect.options[itemidSelect.selectedIndex].value;
				console.log("itemID : " + itemID);

				var itemName = itemidSelect.options[itemidSelect.selectedIndex].text;
				console.log("itemName : " + itemName);
			}

			$.ajax({
				"url" : "/goodibooks/board/answerwrite",
				"method" : "post",
				"data" : { askcho, accask, sysask, payask, eveask, sugask, etcask },
				"success" : function(data, status, xhr) {
					item = res.data;
				}

				var selectItems = [];
				$("#ITEM_ID").append($('<option value="' + '0' + '">' + 전체 + '</option>'));
				sitelist = $.map(item, function (p, c) {
					var obj = {};
					obj.label = p.NAME;
					obj.value = p.ITEM_ID;
					selectItems.push(obj);
					$('#ITEM_ID').append($('<option value="' + p.ITEM_ID + '">' + p.NAME + '</option>')); 
				});
			}) */

			
		});

	</script>

</body>
</html>
