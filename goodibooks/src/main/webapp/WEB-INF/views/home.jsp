<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="ko">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>구디북스</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="/goodibooks/resources/img/favicon.png">

	<!-- all css here -->
	<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
		
    <script src="/goodibooks/resources/js/vendor/modernizr-2.8.3.min.js"></script>
    
</head>

<body class="home-4">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	<header>
		
		<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
		
		
	</header>
	<!-- header-area-end -->
	<!-- slider-group-start -->
	<div class="slider-group  mt-30">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 col-md-12 col-12">
					<!-- slider-area-start -->
					<div class="slider-area">
						
						<div class="slider-active owl-carousel">
						<c:choose>
						<c:when test="${not empty events}">
							<c:forEach var="e" items="${events}">
								<c:if test="${e.active}">
								<div class="single-slider pt-154 pb-154 bg-img" style="background-image:url(resources/file/eventImg/${e.img});">
									<div class="slider-content-4 slider-animated-1 pl-40">
										<h1></h1>
										<h2></h2>
									</div>
								</div>
								</c:if> 
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="single-slider pt-154 pb-154 bg-img" style="background-color:lightgray">
							<div class="slider-content-4 slider-animated-1 pl-40">
								<h1 style="color:black">진행중인 이벤트가 없습니다.</h1>
							</div>
							</div>
						</c:otherwise>
						</c:choose>
						</div>
						
					</div>
					<!-- slider-area-end -->
				</div>
				<div class="col-lg-3 col-md-12 col-12">
					<!-- banner-static-2-start -->
					<div class="banner-static-2">
						<div class="row">
							<div class="col-lg-12 col-md-6 col-12">
								<div class="banner-img-2">
									<a href="#"><img src="/goodibooks/resources/img/banner/banner1.png" alt="banner" /></a>
								</div>
							</div>
							<div class="col-lg-12 col-md-6 col-12">
								<!-- banner-area-3-start -->
								<div class="banner-area-3">
									<div class="row">
										<div class="col-12">
											<!-- single-banner-2-start -->
											<div class="single-banner-2 mt-16">
												<div class="single-icon-2">
													<a href="#">
														<img class="service-blue-img" src="/goodibooks/resources/img/icon-img/service-1.png" alt="banner" />
														<img class="service-white-img" src="/goodibooks/resources/img/icon-img/service-1-white.png" alt="banner" />
													</a>
												</div>
												<div class="single-text-2">
													<h2>배송 이벤트</h2>
													<p>모든제품 무료배송</p>
												</div>
											</div>
											<!-- single-banner-2-end -->
										</div>
										<div class="col-12">
											<!-- single-banner-2-start -->
											<div class="single-banner-2 mt-16">
												<div class="single-icon-2">
													<a href="#">
														<img class="service-blue-img" src="/goodibooks/resources/img/icon-img/service-2.png" alt="banner" />
														<img class="service-white-img" src="/goodibooks/resources/img/icon-img/service-2-white.png" alt="banner" />
													</a>
												</div>
												<div class="single-text-2">
													<h2>페이백 이벤트</h2>
													<p>결제금액 10% 페이백</p>
												</div>
											</div>
											<!-- single-banner-2-end -->
										</div>
									</div>
								</div>
								<!-- banner-area-3-end -->
							</div>
						</div>

					</div>
					<!-- banner-static-2-end -->
				</div>
			</div>
		</div>
	</div>
	<!-- slider-group-end -->
	
	<!-- home-main-area-start -->
	<div class="home-main-area mt-30">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-12">
					
					<div class="shop-left">
						<div class="left-title mb-20">
							<h4>카테고리</h4>
						</div>
						<div class="left-menu mb-30">
							<ul>
									<li><a href="book/list.action">전체 보기<span>${totalBook}</span></a></li>
								<c:forEach var="c" items="${categorys}">
									<li><a href="book/list.action?searchType=C&searchKey=${c.category_name}">${c.category_name}<span>${c.book_count}</span></a></li>
								</c:forEach>
							</ul>
						</div>

					</div>
					
					<!-- banner-area-start -->
					<div class="banner-area mb-30">
						<div class="banner-img-2">
							<a href="#"><img src="/goodibooks/resources/img/banner/phy1.png" alt="banner" /></a>
						</div>
					</div>
					
					
				</div>
				<div class="col-lg-9 col-md-8 col-12">
					<!-- banner-area-5-start -->
					<div class="banner-area-5">
						<div class="single-banner-4 xs-mb">
							<div class="banner-img-2">
								<a href="#"><img src="/goodibooks/resources/img/banner/banner4.png" alt="banner" /></a>
							</div>
						</div>
						<div class="single-banner-5">
							<div class="banner-img-2">
								<a href="#"><img src="/goodibooks/resources/img/banner/banner3.png" alt="banner" /></a>
							</div>
						</div>
					</div>
					<!-- banner-area-5-end -->
					
					
					<!-- new-book-area-start -->
					<div class="new-book-area ptb-50">
						<div class="section-title-2 mb-30">
							<h3>New Arrivals</h3>
						</div>
						
						<div class="tab-active-3 owl-carousel">
							
							<c:set var="idx" value="0"></c:set>
							<c:forEach var="i" begin="0" end="4">
							
							<!-- tab-total start -->
							<div class="tab-total">
								<c:forEach var="j" begin="0" end="1">
								
									<!-- single-product-start -->
									<div class="product-wrapper mb-40">
										<div class="product-img">
											<a href="/goodibooks/book/detail.action?book_no=${books[idx].book_no}">
												<img style="height:270px" src="/goodibooks/resources/file/bookImg/${books[idx].imgs[0].img}" alt="book" class="primary" />
											</a>
											<div class="product-flag">
												<ul>
													<li><span class="sale">new</span></li>
												</ul>
											</div>
										</div>
										<div class="product-details text-center">
											<h4><a href="/goodibooks/book/detail.action?book_no=${books[idx].book_no}">
											<c:choose>
												<c:when test="${fn:length(books[idx].name) > 11 }">
													${fn:substring(books[idx].name, 0, 11)}....
												</c:when>
												<c:otherwise>
												${books[idx].name}
												</c:otherwise>
											</c:choose>
											</a></h4>
											<p>${books[idx].writer}</p>
											<div class="product-price">
												<ul>
													<li>${books[idx].price}</li>
												</ul>
											</div>
										</div>
										<div class="product-link">
											<div class="product-button">
												Show Detail
											</div>
											<div class="add-to-link">
												<ul>
													<li><a href="/goodibooks/book/detail.action?book_no=${books[idx].book_no}" title="Details"><i class="fa fa-external-link"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<!-- single-product-end -->
									<input type="hidden" value="${idx = idx + 1}" >
								</c:forEach>
								
								<c:if test="${idx >= books.size()}">
								<input type="hidden" value="${i = 5}">
								</c:if>
								
							</div>
							<!-- tab-total end -->
							</c:forEach>
							
							

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- home-main-area-end -->
	<!-- banner-area-start
	<div class="banner-area-5 mtb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="banner-img-2 for-height">
						<a href="#"><img src="/goodibooks/resources/img/banner/5.jpg" alt="banner" /></a>
						<div class="banner-text">
							<h3>G. Meyer Books & Spiritual Traveler Press</h3>
							<h2>Sale up to 30% off</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	banner-area-end -->
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
	<!-- Modal end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	
<script type="text/javascript">
$(function() { 
	//topbar 장바구니 가져오기
	if (${not empty loginuser}) {
		$('#topbar-cart').load("/goodibooks/mypage/cartlist/${loginuser.id}");
	}

	var newOrderInfoNo = '${ newOrderInfoNo }'; 
	var purchasefail = '${ purchasefail }';

	if (newOrderInfoNo && !history.state) {
		$('#messageModal .modal-body').text("결제가 완료되었습니다.")
		$('#messageModal').modal('show');
		$('#topbar-cart').reload("/goodibooks/mypage/cartlist/${loginuser.id}");
	} else if( purchasefail && !history.state ){
		$('#messageModal .modal-body').text("결제 실패.")
		$('#messageModal').modal('show');
	}
	history.replaceState({}, null, null);
});
</script>
</body>

</html>