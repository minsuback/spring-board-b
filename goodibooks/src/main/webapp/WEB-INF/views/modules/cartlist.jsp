<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

						<div class="my-cart">
							<ul>
								<li><a href="/goodibooks/mypage/mycart.action"><i class="fa fa-shopping-cart"></i>장바구니</a>
									<span>
										<c:choose>
											<c:when test="${sessionScope.cartlist.size() > 0}">
												${cartlist.size()}
											</c:when>
											<c:otherwise>
												0
											</c:otherwise>
										</c:choose>
									</span>
									<div class="mini-cart-sub">
										<div id="" class="cart-product">
										
										<c:forEach var="c" items="${cartlist}">
										
											<div class="single-cart">
												<div class="cart-img">
													<a href="/goodibooks/book/detail.action?book_no=${c.book_no}">
													<img src="/goodibooks/resources/file/bookImg/${c.book.imgs[0].img}" alt="book" />
													</a>
												</div>
												<div class="cart-info">
													<h5><a href="/goodibooks/book/detail.action?book_no=${c.book_no}" >${c.book.name}</a></h5>
													<p>${c.book.price} x ${c.cart_count} 개 </p>
													<p class="product-subtotal">${c.book.price * c.cart_count}원</p>
												</div>
												<div class="cart-icon">
													<a class="deleteCartBtn" cartNo="${c.cart_no}" href="#"><i class="fa fa-remove"></i></a>
												</div>
											</div>
										</c:forEach>
		
										</div>
										<div class="cart-bottom">
											<a class="view-cart" href="/goodibooks/mypage/mycart.action">장바구니 이동</a>
											<a href="/goodibooks/account/checkout.action">결제하기</a>
										</div>
									</div>
								</li>
							</ul>
						</div>