<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<!-- footer-top-start -->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="footer-top-menu bb-2">
							<nav>
								<ul>
									<li><a href="#">home</a></li>
									<li><a href="#">Enable Cookies</a></li>
									<li><a href="#">Privacy and Cookie Policy</a></li>
									<li><a href="#">contact us</a></li>
									<li><a href="#">blog</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-top-start -->
		<!-- footer-mid-start -->
		<div class="footer-mid ptb-50">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-12">
						<div class="row">
							<div class="col-lg-4 col-md-4 col-12">
								<div class="single-footer br-2 xs-mb">
									<div class="footer-title mb-20">
										<h3>Products</h3>
									</div>
									<div class="footer-mid-menu">
										<ul>
											<li><a href="about.html">About us</a></li>
											<li><a href="#">Prices drop </a></li>
											<li><a href="#">New products</a></li>
											<li><a href="#">Best sales</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-12">
								<div class="single-footer br-2 xs-mb">
									<div class="footer-title mb-20">
										<h3>Our company</h3>
									</div>
									<div class="footer-mid-menu">
										<ul>
											<li><a href="contact.html">Contact us</a></li>
											<li><a href="#">Sitemap</a></li>
											<li><a href="#">Stores</a></li>
											<li><a href="register.html">My account </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-12">
								<div class="single-footer br-2 xs-mb">
									<div class="footer-title mb-20">
										<h3>Your account</h3>
									</div>
									<div class="footer-mid-menu">
										<ul>
											<li><a href="contact.html">Addresses</a></li>
											<li><a href="#">Credit slips </a></li>
											<li><a href="#"> Orders</a></li>
											<li><a href="#">Personal info</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-12">
						<div class="single-footer mrg-sm">
							<div class="footer-title mb-20">
								<h3>STORE INFORMATION</h3>
							</div>
							<div class="footer-contact">
								<p class="adress">
									<span>My Company</span>
									42 avenue des Champs Elysées 75000 Paris France
								</p>
								<p><span>Call us now:</span> (+1)866-540-3229</p>
								<p><span>Email:</span> support@hastech.com</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-mid-end -->
		<!-- footer-bottom-start -->
		<div class="footer-bottom">
			<div class="container">
				<div class="row bt-2">
					<div class="col-lg-6 col-md-6 col-12">
						<div class="copy-right-area">
							<p>Copyright ©<a href="#">GOODIBOOKS</a>. All Right Reserved.</p>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-12">
						<div class="payment-img text-right">
							<a href="#"><img src="/goodibooks/resources/img/1.png" alt="payment" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-bottom-end -->
	
	<!-- footer-area-end -->
	<!-- Modal -->
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-5 col-sm-5 col-xs-12">
							<div class="modal-tab">
								<div class="product-details-large tab-content">
									<div class="tab-pane active" id="image-1">
										<img src="/goodibooks/resources/img/product/quickview-l4.jpg" alt="" />
									</div>
									<div class="tab-pane" id="image-2">
										<img src="/goodibooks/resources/img/product/quickview-l2.jpg" alt="" />
									</div>
									<div class="tab-pane" id="image-3">
										<img src="/goodibooks/resources/img/product/quickview-l3.jpg" alt="" />
									</div>
									<div class="tab-pane" id="image-4">
										<img src="/goodibooks/resources/img/product/quickview-l5.jpg" alt="" />
									</div>
								</div>
								<div class="product-details-small quickview-active owl-carousel">
									<a class="active" href="#image-1"><img src="/goodibooks/resources/img/product/quickview-s4.jpg" alt="" /></a>
									<a href="#image-2"><img src="/goodibooks/resources/img/product/quickview-s2.jpg" alt="" /></a>
									<a href="#image-3"><img src="/goodibooks/resources/img/product/quickview-s3.jpg" alt="" /></a>
									<a href="#image-4"><img src="/goodibooks/resources/img/product/quickview-s5.jpg" alt="" /></a>
								</div>
							</div>
						</div>
						<div class="col-md-7 col-sm-7 col-xs-12">
							<div class="modal-pro-content">
								<h3 id="bookDetailName"></h3>
								<div class="price">
									<span>name</span>
								</div>
								<p>price</p>
								<form action="#">
									<input type="number" value="1" />
									<button>Add to cart</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
