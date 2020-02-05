<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>구디북스-${book.name}</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
		<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

		<!-- all css here -->
		<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
		
    </head>
    <body class="product-details">
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
								<li><a href="/goodibooks/">Home</a></li>
								<li><a href="/goodibooks/book/list.action">책 리스트</a></li>
								<li><a href="#" class="active">${book.name}</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumbs-area-end -->
		<!-- product-main-area-start -->
		<div class="product-main-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-12 col-12 order-lg-1 order-1">
						<!-- product-main-area-start -->
						<div class="product-main-area">
							<div class="row">
								<div class="col-lg-5 col-md-6 col-12">
									<div class="flexslider">
									
										<!-- 사진 슬라이드 -->
										<ul class="slides">
										<%-- <c:forEach var="b" items="${book.imgs}">
											<li data-thumb="/goodibooks/resources/file/bookImg/${b.img}">
											  <img src="/goodibooks/resources/file/bookImg/${b.img}" />
											</li>
										</c:forEach> --%>
										
											<li data-thumb="/goodibooks/resources/file/bookImg/${book.imgs[0].img}">
											  <img src="/goodibooks/resources/file/bookImg/${book.imgs[0].img}" />
											</li>
											<li data-thumb="/goodibooks/resources/file/bookImg/${book.imgs[1].img}">
											  <img src="/goodibooks/resources/file/bookImg/${book.imgs[1].img}" />
											</li>
											<li data-thumb="/goodibooks/resources/file/bookImg/${book.imgs[2].img}">
											  <img src="/goodibooks/resources/file/bookImg/${book.imgs[2].img}" />
											</li>
											<li data-thumb="/goodibooks/resources/file/bookImg/${book.imgs[3].img}">
											  <img src="/goodibooks/resources/file/bookImg/${book.imgs[3].img}" />
											</li>

										</ul>
									</div>
								</div>
								<div class="col-lg-7 col-md-6 col-12">
									<div class="product-info-main">
										<div class="page-title">
											<h1>${book.name}</h1><hr>
										</div>
										<div class="product-info-stock-sku">
											<div class="product-attribute">
												<span>카테고리명 &nbsp;&nbsp; <a href="list.action?searchType=C&searchKey=${book.category_name}">${book.category_name}</a></span><br><br>
												<span>출판사 &nbsp;&nbsp; <a href="list.action?searchType=P&searchKey=${book.pub_name}">${book.pub_name}</a></span><br><br>
												<span>저자 &nbsp;&nbsp; <a href="list.action?searchType=W&searchKey=${book.writer}">${book.writer}</a></span>
											</div>
										</div>
										<div class="product-reviews-summary">
											<div class="rating-summary">
												<c:if test="${reviews.size() > 0}">
													<!-- 별점평균 -->
													<c:set var="aver" value="0"></c:set>
													<c:forEach var="i" begin="0" end="${reviews.size() - 1}">
														<input type="hidden" value="${aver = aver + reviews[i].rate}">
													</c:forEach>
													
													<h6>별점 평균 : <fmt:formatNumber value="${aver/reviews.size()}" pattern=".00"/></h6>
													
												</c:if>
											</div>
											<div class="reviews-actions">
												<a href="#Reviews">${reviewCount} Reviews</a>
											</div>
										</div>
										<div class="product-info-price">
											가격 : 
											<div class="price-final">
												<span> ${ book.price } 원 &nbsp;</span>
												<%-- <span class="old-price">${book.price} 원</span> --%>
											</div>
										</div>
										<div class="product-add-form">
											<form>
												<div class="quality-button">
													<input id="bookCount" class="qty" type="number" value="1" name="book_cnt">
												</div>
												<a id="cartBtn" href="">장바구니</a>
												<!-- <a id="buyBtn" href="/goodibooks/purchase/purchase.action?book_no=${book.book_no}">바로 구매하기</a> -->
												
												<a id="buyBtn" href="">바로 구매하기</a>
												
												<c:choose>
													<c:when test="${ loginuser.userType == true }">
														<a id="editBtn" href="/goodibooks/admin/editBook?book_no=${book.book_no}">수정</a>
													</c:when>
												</c:choose>
											</form>
										</div>
									</div>
								</div>
							</div>	
						</div>
						<!-- product-main-area-end -->
						<!-- product-info-area-start -->
						<div class="product-info-area mt-80">
							<!-- Nav tabs -->
							<ul class="nav">
								<li><a class="active" href="#Details" data-toggle="tab">책 상세 정보</a></li>
								<li><a href="#Reviews" data-toggle="tab">리뷰 ${reviewCount}</a></li>
							</ul>
							<div class="tab-content">
                                <div class="tab-pane fade show active" id="Details">
                                    <div class="valu">
                                    	<h4>책 소개</h4><hr>
                                      <p>${book.intro}</p><br><br>
                                      
                                      <h4>목차</h4><hr>
                                      <p>${book.contents}</p>

                                    </div>
                                </div>
                                
                                <!-- 한줄평 -->
                                <div class="tab-pane fade" id="Reviews">
                                
                                 <jsp:include page="/WEB-INF/views/book/reviews.jsp" />
                                 
                                </div>
                            
                            
                            </div>	
						</div>
						<!-- product-info-area-end -->
						
					</div>
					<div class="col-lg-3 col-md-12 col-12 order-lg-2 order-2">
						<div class="shop-left">
							<div class="left-title mb-20">
								<h4>이 책과 함께 구매한 책</h4>
							</div>
							<div class="random-area mb-30">
								<div class="product-active-2 owl-carousel">

									<div class="product-total-2">
									
										 <c:forEach var="product" items="${products}" varStatus="status"> 
										 	<c:if test="${status.index < 4}">
											<div class="single-most-product bd mb-18">
												<div class="most-product-img">
													<a href="/goodibooks/book/detail.action?book_no=${product.book_no}">
													<img src="/goodibooks/resources/file/bookImg/${product.imgs[0].img}" alt="book" /></a>
												</div>
												<div class="most-product-content">
	
													<h4><a href="/goodibooks/book/detail.action?book_no=${product.book_no}">${product.name}</a></h4>
													<div class="product-price">
														<ul>
															<li>${product.price}</li>
														</ul>
													</div>
												</div>
											</div>
		
											</c:if>

										</c:forEach> 
										</div>	
									</div>	 
								</div>

							<div class="left-title-2">
								<h2>My Wish List</h2>
								<p>You have no items in your wish list.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- product-main-area-end -->
		<!-- footer-area-start -->
			<footer>
	
		<jsp:include page="/WEB-INF/views/modules/footbar.jsp" />
		
	</footer>
	<!-- Modal end -->
	<input type="hidden" id="loginuser">

									<div class="modal fade" id="review-modal" tabindex="-1" role="dialog" aria-labelledby="reply-modal-label" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="reply-modal-label">한줄평 수정하기</h5>
													<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								            			<span aria-hidden="true">×</span>
								          			</button>					
												</div>
												<div class="modal-body">
												<form id="edit-form">
									                <input type="hidden" name="id" value="${ loginuser.id }">
									                <label for="exampleInputEmail1">점수</label><br>
								                   &nbsp;<div class="form-check form-check-inline">
														  <input class="form-check-input" type="radio" name="rate" value="1">
														  <!-- <label class="form-check-label" for="inlineRadio1">좋음</label> -->
														  <i class="fa fa-star"></i>
														</div>
														<div class="form-check form-check-inline">
														  <input class="form-check-input" type="radio" name="rate" value="2">
														  <i class="fa fa-star"></i><i class="fa fa-star"></i>
														</div>
														<div class="form-check form-check-inline">
														  <input class="form-check-input" type="radio" name="rate" value="3">
														  <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
														</div>
														<div class="form-check form-check-inline">
														  <input class="form-check-input" type="radio" name="rate" value="4">
														  <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
														 </div>
														  <div class="form-check form-check-inline">
														  <input class="form-check-input" type="radio" name="rate" value="5">
														  <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
														</div>
													<br><br>
												
													<div class="form-group">
														<label>제목</label>
														<input class="form-control" name='title' id="re_title">
													</div>
													<div class="form-group">
														<label>내용</label>
														<textarea class="form-control" name="content" id="re_content" rows="3"></textarea>
													</div>
								 						<input type="hidden" name="book_no" value="${ book.book_no }">
														<input type="hidden" id="review_re_no" name="re_no">
												</form>
												</div>
												<div class="modal-footer">
													<button id='modalModBtn' type="button" class="btn btn-success" data-dismiss="modal">수정</button>
													<!-- <button id='modalRemoveBtn' type="button" class="btn btn-success">Remove</button>
													<button id='modalRegisterBtn' type="button" class="btn btn-success">Register</button> -->
													<button id='modalCloseBtn' type="button" class="btn btn-success">취소</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
	
	
	<!-- Modal end -->
	<input type="hidden" id="loginuser">

	<!-- all js here -->
	<!-- jquery latest version -->
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	
	<script type="text/javascript">
	$(function() {
		$("#buyBtn").on("click", function(event) {
			if (!confirm("바로 구매하시겠습니까?")) return;

			$(this).attr("href",  "/goodibooks/purchase/purchase.action?book_no=${book.book_no}&book_cnt=" + $("#bookCount").val());
		});

		
		$("#cartBtn").on("click", function(event) {

			if (!confirm("장바구니에 넣을까요?")) {
				preventDefault(); return;
			}

			if (${empty sessionScope.loginuser}) {
				alert("로그인이 필요합니다."); preventDefault(); return;
			} 
	
			else {
				$.ajax({
					"url" : "/goodibooks/mypage/mycart-insert.action",
					"method" : "post",
					"data" : {
						"cart_count" : $("#bookCount").val(),
						"book_no" : ${book.book_no},
						"id" : "${ empty sessionScope.loginuser ? '' : sessionScope.loginuser.id }"
					},
					"success" : function(data, status, xhr) {
						alert("상품을 장바구니에 담았습니다.");
	
						$('#topbar-cart').load("/goodibooks/mypage/cartlist/${loginuser.id}");
						location.reload();// 새로고침
					},
					"error" : function(xhr, status, err) {
						alert("장바구니 추가 실패");
					}
				});
			}		
		});

		$("#bookCount").change(function(event) {
			if ($(this).val() < 1) $(this).val("1");
		});
		

		// 리뷰 등록
		$("#register").on("click", function(event) {

			var values = $("#reviewRegister-form").serializeArray();

			$.ajax({
				"url" : "/goodibooks/review/reviewRegister.action" ,
				"method" : "post" ,
				"data" : values ,
				"success" : function(data, status, xhr) {
					$("#Reviews").load("/goodibooks/review/reviewContent/${ book.book_no }");
				},
				"error" : function(xhr, status, err) {
					alert("실패");
				}
			})
		});

		$().priceTotal();

		// 모달 창 닫기
		/* $("#Reviews").on("click", "#modalCloseBtn", function(event){
			$("#review-modal").modal('hide');
		}); */
		$("#modalCloseBtn").on("click", function(event){
			$("#review-modal").modal('hide');
		});

		$('#Reviews').on('click', '.review-edit', function(event) {
			// 수정버튼을 눌렀을때, 해당되는 re_no을 저장시킨다
			
			$("#edit-form input[name=title]").val("");
			$("#edit-form input[name=content]").val("");
			
			var re_no = $(this).attr("data-reno");

			$("#edit-form input[name=re_no]").val(re_no);
			
			$("#review-modal").modal("show");
		});

		// 리뷰 수정 버튼으로 모달 팝업발생시 데이터 저장
		//$("#Reviews").on("click", "#modalModBtn", function(event){
		$("#modalModBtn").on("click", function(event){

			/* event.preventDefault();
			event.stopPropagation(); */
			
			// 수정버튼을 눌렀을 때, 저장된 re_no 을 불러온드아~~
			var data = {			
			"re_no" : $("#edit-form input[name=re_no]").val() , 
			"rate" : $("#edit-form input[name=rate]").val() , 
			"title" : $("#edit-form input[name=title]").val() , 
			"content" : $("#edit-form textarea[name=content]").val()
			};
			
			$.ajax({
				"url" : "/goodibooks/review/editReview",
				"method" : "put",
				"data" : JSON.stringify(data),
				"contentType" : "application/json",
				"success" : function(result, status, xhr){
					$("#review-modal").modal("hide");
					$("#Reviews").load("/goodibooks/review/reviewContent/${ book.book_no }");
				},
				"error" : function(xhr, status, err){
					alert("수정하는데 실패해버렸지 뭐얌?");
				}
			});
			
		});
		

		// 리뷰 삭제
		$('#Reviews').on('click', '.review-delete', function(event) {

			//var re_no = $(this).attr('data-re_no');
			var re_no = $(this).attr('data-reno');

			if (!confirm("후기를 삭제할까요?")) return;

			$.ajax({
				"url": "/goodibooks/review/delete/" + re_no,
				"method": "delete",
				"data": { "re_no" : re_no },
				"success": function(data, status, xhr) {
					$("#Reviews").load("/goodibooks/review/reviewContent/${ book.book_no }");
				},
				"error": function(xhr, status, err) {
					alert("삭제에 실패해버렸지뭐얌?");
				}
			});
			
		});

	});
			
	</script>
    </body>
</html>
