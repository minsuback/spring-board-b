<%@page import="com.goodibooks.vo.MemberVO"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% MemberVO member = new MemberVO(); %>

<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>구디북스-마이페이지</title>
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
		  
		  <!-- Modal -->


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
								<li><a href="#">Home</a></li>
								<li><a href="#" class="active">마이페이지</a></li>
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
							<h2>마이페이지</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- entry-header-area-end -->
		<!-- my account wrapper start -->
        <div class="my-account-wrapper mb-70">
            <div class="container">
                <div class="section-bg-color">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- My Account Page Start -->
                            <div class="myaccount-page-wrapper">
                                <!-- My Account Tab Menu Start -->
                                <div class="row">
                                    <div class="col-lg-3 col-md-4">
                                        <div class="myaccount-tab-menu nav" role="tablist">
                                            <a href="#dashboad" class="active" data-toggle="tab"><i class="fa fa-dashboard"></i>
                                                나의 정보</a>
                                            <a href="#orders" data-toggle="tab"><i class="fa fa-cart-arrow-down"></i>
                                                주문 내역</a>
                                            <a href="#reviews" data-toggle="tab"><i class="fa fa-cloud-download"></i>
                                                나의 한줄평</a>
                                            <a href="#qna" data-toggle="tab"><i class="fa fa-credit-card"></i>
                                                1대1 문의 내역</a>
                                            <a href="#edit-info" data-toggle="tab"><i class="fa fa-user"></i> 회원정보 수정</a>
                                            <!-- <a href="/goodibooks/account/checkpw.action"><i class="fa fa-user"></i> 회원정보 수정</a> -->
                                            <a id="logout"><i class="fa fa-sign-out"></i> Logout</a>
                                        </div>
                                    </div>
                                    <!-- My Account Tab Menu End -->

                                    <!-- My Account Tab Content Start -->
                                    <div class="col-lg-9 col-md-8">
                                        <div class="tab-content" id="myaccountContent">
                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade show active" id="dashboad" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>나의 등급</h5>
                                                    <div class="welcome">
                                                        <p>${ loginuser.name }님은 이번달 구매 ${ infos.size() }건으로 실버회원입니다</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="orders" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>주문 내역</h5>
                                                    <div class="myaccount-table table-responsive text-center">
			                                        
                                                        <table class="table table-bordered">
                                                        	
                                                            <thead class="thead-light">
                                                                <tr>
                                                                    <th>주문번호</th>
                                                                    <th>주문일자</th>
                                                                    <th>주문내역</th>
                                                                    <th>수량</th>
                                                                    <th>결제가격</th>
                                                                    <th>배송상태</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:choose>
                                                            <c:when test="${not empty infos}">
                                                            	<c:forEach items="${ infos }" var="info">
                                                                <tr>
                                                                    <td>${ info.no }</td>
                                                                    <td><fmt:formatDate value="${info.payDate}" pattern="yyyy-MM-dd"/></td> 
                                                                    <td>${ info.name }</td>
                                                                    <td>${ info.detail_cnt }</td>
                                                                    <td>${ info.detail_price }</td>
                                                                   
                                                                    <td>${ (info.ship_no == 1) ? "배송 준비중" : (info.ship_no == 2) ? "배송중" : "배송 완료" }</td>
                                                                </tr>
        		                                            	</c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                           		<tr><td colspan="6"> 주문 내역이 없습니다. <tr>
                                                            </c:otherwise>
                                                            </c:choose>
					                                        </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->
                                            
                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="reviews" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>한줄평</h5>
                                                    <div class="myaccount-table table-responsive text-center">
                                                        <table class="table table-bordered">
                                                            <thead class="thead-light">
                                                                <tr>
                                                                    <th>한줄평 번호</th>
                                                                    <th>책 이름</th>
                                                                    <th>제목</th>
                                                                    <th>평점</th>
                                                                    <th>작성일</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:choose>
                                                            <c:when test="${not empty review}">
                                                            <c:forEach items="${ reviews }" var="review">
                                                                <tr>
                                                                    <td>${ review.re_no }</td>
                                                                    <td>${ review.name }</td>
                                                                    <td>${ review.title }</td>
                                                                    <td>${ review.rate }</td>
                                                                    <td><fmt:formatDate value="${review.writeDate}" pattern="yyyy-MM-dd"/></td>
                                                                </tr>
                                                            </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                            	<tr><td colspan="5"> 작성한 한줄평이 없습니다. </td></tr>
                                                            </c:otherwise>
                                                            </c:choose>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->
                                            
                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="qna" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>1대1 문의 내역</h5>
                                                    <div class="myaccount-table table-responsive text-center">
                                                        <table class="table table-bordered">
                                                            <thead class="thead-light">
                                                                <tr>
                                                                    <th>번호</th>
                                                                    <th>문의유형</th>
                                                                    <th>제목</th>
                                                                    <th>작성날짜</th>
                                                                    <th>답변여부</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:choose>
                                                            <c:when test="${not empty qnas}">
                                                            <c:forEach items="${ qnas }" var="qna">
                                                           
                                                                <tr>
                                                                    <td>${ qna.no }</td>
                                                                    <td>${ qna.qnaType }</td>
                                                                    <td>${ qna.title }</td>
                                                                    <td><fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd"/></td>
                                                                    <td>${ qna.ans_check }</td>
                                                                </tr>
                                                            
                                                            </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                            	<tr><td colspan="5"> 문의 내역이 없습니다. </td></tr>
                                                            </c:otherwise>
                                                            </c:choose>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="download" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>Downloads</h5>
                                                    <div class="myaccount-table table-responsive text-center">
                                                        <table class="table table-bordered">
                                                            <thead class="thead-light">
                                                                <tr>
                                                                    <th>Product</th>
                                                                    <th>Date</th>
                                                                    <th>Expire</th>
                                                                    <th>Download</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>Haven - Free Real Estate PSD Template</td>
                                                                    <td>Aug 22, 2018</td>
                                                                    <td>Yes</td>
                                                                    <td><a href="#" class="btn btn-sqr"><i
                                                                        class="fa fa-cloud-download"></i>
                                                                            Download File</a></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>HasTech - Profolio Business Template</td>
                                                                    <td>Sep 12, 2018</td>
                                                                    <td>Never</td>
                                                                    <td><a href="#" class="btn btn-sqr"><i
                                                                        class="fa fa-cloud-download"></i>
                                                                            Download File</a></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="payment-method" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>Payment Method</h5>
                                                    <p class="saved-message">You Can't Saved Your Payment Method yet.</p>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="address-edit" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>Billing Address</h5>
                                                    <address>
                                                        <p><strong>Erik Jhonson</strong></p>
                                                        <p>1355 Market St, Suite 900 <br>
                                                            San Francisco, CA 94103</p>
                                                            <p>Mobile: (123) 456-7890</p>
                                                    </address>
                                                    <a href="#" class="btn btn-sqr"><i class="fa fa-edit"></i>
                                                        Edit Address</a>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                             <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="edit-info" role="tabpanel">
                                                <div class="myaccount-content">
											<!-- user-login-area-start -->
												
												<c:choose>
													<c:when test="${pwcheck == true}">
														<div class="user-login-area mb-70">
														<div class="container">
															<div class="row">
																<div class="col-lg-12">
																	<div class="login-title text-center mb-30">
																		<h2>회원정보 수정</h2>
																	</div>
																</div>
																<div class="offset-lg-2 col-lg-8 col-md-12 col-12">
																
																<form id="edit-form" action="/goodibooks/account/edit.action" method="post">
																	 <div class="form-group" style="width:360px;">
																		  <label for="inputAddress">아이디</label>
																		  <input type="text" class="form-control" id="id" name="id" value="${ loginuser.id }">
																	  </div>
																	  <div class="form-group" style="width:360px;">
																	    <label for="inputAddress">이름</label>
																	    <input type="text" class="form-control" id="name" name="name" value="${ loginuser.name }">
																	  </div>
																	  <div class="form-group" style="width:360px;">
																	    <label for="inputAddress">변경할 패스워드</label>
																	    <input type="password" class="form-control" id="passwd" name="passwd">
																	  </div>
																	  <div class="form-group" style="width:360px;">
																	    <label for="inputAddress">패스워드 확인</label>
																	    <input type="password" class="form-control" id="confirm">
																	  </div>
																	    
																	  <div class="form-group" style="width:360px;">
																	    <label for="inputAddress">이메일</label>
																	    <input type="email" class="form-control" id="email" name="email"value="${ loginuser.email }">
																	  </div>
																	  <div class="form-group" style="width:360px;">
																	    <label for="inputAddress2">핸드폰</label>
																	    <input type="text" class="form-control" id="phone" name="phone" value="${ loginuser.phone }">
																	  </div>
																	  
																	  <label for="inputAddress">우편번호</label>
																	  <div class="form-row align-items-center">
																	    <div class="col-auto" style="width:360px;">
																	      <input type="text" id="addr1" name="addr1" class="form-control mb-2" value="${ loginuser.addr1 }">
																	    </div>
																	    <div class="col-auto">
																	      <button type="button" class="btn btn-primary mb-2" id="btn">우편번호 찾기</button>
																	    </div>
																	  </div>
																	  
																	  <div class="form-group" style="width:360px;">
																	    <label for="inputAddress2">도로명 주소</label>
																	    <input type="text" class="form-control" id="addr2" name="addr2" value="${ loginuser.addr2 }">
																	   </div>
																	   <div class="form-group" style="width:360px;">
																	    <label for="inputAddress2">상세 주소</label>
																	    <input type="text" class="form-control" id="addr3" name="addr3" value="${ loginuser.addr3 }">
																	  </div>
																	  <br>
																	  <button type="button" id="edit" class="btn btn-primary">정보수정</button>&nbsp;&nbsp;
																	  <button type="button" id="delete" class="btn btn-danger">탈퇴하기</button>
																	  
																</form>

																</div>
															</div>
														</div>
													</div>
														
													</c:when>
												
													<c:otherwise>
														<div class="container">
																<div class="row">
																	<div class="col-lg-12">
																		<div class="login-title text-center mb-30">
																			<h3>패스워드 확인</h3><br>
																		</div>
																	</div>
																	<div class="offset-lg-3 col-lg-6 col-md-12 col-12">
																		<form id="checkpw-form" action="/goodibooks/account/checkpw.action" method="post">
																			<div class="login-form">
																				<div class="single-login">
																					<label>ID<span>*</span></label>
																					<input type="text" id="id" name="id" value="${ loginuser.id }" readonly="readonly"/>
																				</div>
																				<div class="single-login">
																					<label>패스워드 <span>*</span></label>
																					<input type="password" id="passwd" name="passwd"/>
																				</div>
																				<div class="single-login single-login-2">
																					<button type="button" id="checkpw" class="btn btn-primary">확인</button>
																					<!-- <button type="submit" >로그인</button> -->
																				</div>
																				<!-- <a href="#">Lost your password?</a> -->
																			</div>
																		</form>
																	</div>
																</div>
															</div>
														
														<!-- user-login-area-end -->
														
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
													</c:otherwise>
												</c:choose>
											
											
												
												<!-- user-login-area-end -->
                                                
                                                
                                            </div> <!-- Single Tab Content End -->
                                        </div>
                                    
                                    </div> <!-- My Account Tab Content End -->
                                </div>
                            </div> <!-- My Account Page End -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- my account wrapper end -->
        
        
        
		<!-- footer-area-start -->
		
	<footer>
	
		<jsp:include page="/WEB-INF/views/modules/footbar.jsp" />
		
	</footer>
	<!-- Modal end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script type="text/javascript">
	$(function(){
	
		$("#btn").on("click", function(event) {
			 new daum.Postcode({
			        oncomplete: function(data) {

						$("#addr1").val(data.postcode);
						$("#addr2").val(data.roadAddress);
						//$("#jibunAddress").val(data.jibunAddress);
	                   	
			        }
			    }).open();
		});
		
		var updateMember = '${ updateMember }'; 
		if (updateMember && !history.state) {
			$('#messageModal .modal-body').text("회원정보가 수정 되었습니다.");
			$('#messageModal').modal('show');
		}
		history.replaceState({}, null, null);
		
		$("#logout").on("click", function(event){

			var yes = confirm("로그아웃 하시겠습니까?");
			
			if( yes ){
				location.href="/goodibooks/account/logout.action";
			}

		})

		$("#id, #name").attr({"readonly": "readonly" });
		$("#addr1, #addr2").attr({"readonly": "readonly" });

		$("#edit").on("click" , function(event) {

			// 1. 유효성 검사
			if($("#id").val() == '' ){
				alert("아이디를 입력하세요!");
				$("#id").focus();
				return;
			}
			if($("#passwd").val() == '' ){
				alert("패스워드를 입력하세요!");
				$("#passwd").focus();
				return;
			}
			if($("#confirm").val() == '' ){
				alert("패스워드 확인을 입력하세요!");
				$("#confirm").focus();
				return;
			}
			if($("#name").val() == '' ){
				alert("이름을 입력하세요!");
				$("#name").focus();
				return;
			}
			if($("#email").val() == '' ){
				alert("이메일을 입력하세요!");
				$("#email").focus();
				return;
			}
			if($("#phone").val() == '' ){
				alert("핸드폰을 입력하세요!");
				$("#phone").focus();
				return;
			}if($("#addr1").val() == '' ){
				alert("우편번호를 입력하세요!");
				return;
			}
			if($("#addr3").val() == '' ){
				alert("상세주소를 입력하세요!");
				$("#addr3").focus();
				return;
			}
			
			// 2. 오류가 없다면 서버로 전송
			$("#edit-form").submit();

		});
		
			$("#delete").on("click" , function(event) {
			
			var yes = confirm("회원을 탈퇴하시겠습니까?");
			if (!yes) {
				return;
			}
				
			location.href="/goodibooks/account/deleteMember.action?id=${loginuser.id}";
			
		});
	});
	
	</script>
	
	<script type="text/javascript">
	$(function(){

		var checkFalse = '${ checkFalse }'; 
		
		if (checkFalse && !history.state) {
			$('#messageModal .modal-body').text("패스워드가 일치하지 않습니다.");
			$('#messageModal').modal('show');
		}
		history.replaceState({}, null, null);


		$("#checkpw").on("click" , function(event) {
			// 1. 유효성 검사
			if($("#passwd").val() == '' ){
				alert("패스워드를 입력하세요!");
				$("#passwd").focus();
				return;
			}
			
			// 2. 오류가 없다면 서버로 전송
			$("#checkpw-form").submit();
		});

		if (${not empty pwcheck}) {
			if ('${pwcheck}' == 'false') alert("비밀번호가 틀렸습니다.");
			
			$("a[href='#edit-info']").click();
		}
	});
	</script>
		
    </body>
    

</html>
