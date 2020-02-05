<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>구디북스-장바구니</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
		<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

		<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
		
        <script src="/goodibooks/resources/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body class="cart">
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
								<li><a href="#" class="active">장바구니</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumbs-area-end -->
		<!-- entry-header-area-start -->
		<div class="entry-header-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="entry-header-title">
							<h2>Cart</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- entry-header-area-end -->
		<!-- cart-main-area-start -->
		<div class="cart-main-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<form action="#">
							<div class="table-content table-responsive mb-15 border-1">
								<table>
									<thead>
										<tr>
											<th class="product-thumbnail">Image</th>
											<th class="product-name">Product</th>
											<th class="product-price">Price</th>
											<th class="product-quantity">Quantity</th>
											<th class="product-subtotal">Total</th>
											<th class="product-remove">Remove</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty cartlist}">
											<c:forEach var="c" items="${cartlist}">
											<tr class="cart-products"  cartNo="${c.cart_no}">
												<td class="product-thumbnail"><img src="/goodibooks/resources/file/bookImg/${c.book.imgs[0].img}" style="height:120px !important;" /></td>
												<td class="product-name"><a href="#">${c.book.name}</a></td>
												<td class="product-price" ><span class="amount">${c.book.price}</span></td>
												<td class="product-quantity"><input cartNo="${c.cart_no}" price="${c.book.price} "type="number" value="${c.cart_count}"></td>
												<td class="product-subtotal">${total = (c.book.price * c.cart_count)}원</td>
												<td class="deleteCartBtn" cartNo="${c.cart_no}"><a href=""><i class="fa fa-times"></i></a></td>
												
											</tr>
											</c:forEach>	
											</c:when>
											<c:otherwise>
											<tr>
												<td colspan="6">담긴 상품이 없습니다.</td>
											</tr>
											</c:otherwise>
										</c:choose>
										
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
                    <div class="col-lg-8 col-md-6 col-12">
                        <div class="buttons-cart mb-30">
                            <ul>
                                <li><a href="javascript:history.back()">쇼핑 계속하기</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="cart_totals">
                            <h2>Cart Totals</h2>
                            <table>
                                <tbody>
                                    <tr class="cart-subtotal">
                                        <th>Subtotal</th>
                                        <td>
                                            <span  class="amount subtotal"></span>
                                        </td>
                                    </tr>
                                    <tr class="shipping">
                                        <th>Shipping</th>
                                        <td>
                                        	<ul id="shipping_method">
                                                <li>
                                                    <label>
                                                        	배송비:
                                                        <span class="amount">무료</span>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label> Free Shipping </label>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    
                                    <tr class="order-total">
                                        <th>Total</th>
                                        <td>
                                            <strong>
                                                <span id="total" class="amount"></span>
                                            </strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="wc-proceed-to-checkout">
                                <a id="checkoutBtn" href="">결제하기</a>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>
		<!-- cart-main-area-end -->
		<!-- footer-area-start -->
		<footer>
			
			<jsp:include page="/WEB-INF/views/modules/footbar.jsp" />
			
		</footer>
		<!-- footer-area-end -->
		
		<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
<script>
$(function() {
	$().priceTotal();

	$("#checkoutBtn").on("click", function(event) {
		if (${not empty cartlist}) $(this).attr("href", "/goodibooks/account/checkout.action");
		else alert("장바구니에 담긴 상품이 없습니다.");
	});
});
</script>
    </body>
</html>
