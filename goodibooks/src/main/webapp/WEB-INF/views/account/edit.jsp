<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

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
																	  <button type="button" id="edit" class="btn btn-primary">정보수정</button>
																</form>
																
																
																</div>
															</div>
														</div>
													</div>
