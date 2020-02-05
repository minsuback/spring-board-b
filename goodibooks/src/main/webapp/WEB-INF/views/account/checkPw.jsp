<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<div class="user-login-area mb-70">

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