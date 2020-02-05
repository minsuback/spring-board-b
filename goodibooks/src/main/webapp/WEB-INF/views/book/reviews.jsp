<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


    								<div class="valu valu-2">
                                        <div class="review-add">
                                            <h3>이책을 평가해주세요!</h3>
                                        </div>
                                        
                                        <c:if test="${ loginuser == null }">
                                        	<p>소감을 남기려면 <a href="/goodibooks/account/login.action">로그인</a> 해주세요</p>
                                        </c:if>
                                        <c:if test="${ loginuser != null }">
                                        <%-- <form action="/goodibooks/review/review.action?book_no=${ param.book_no }" method="post"> --%>
                                        <form id="reviewRegister-form" >
                                        <input type="hidden" name="id" value="${ loginuser.id }">
                                        <!-- <input type="hidden" name="rate" value="7"> -->
                                        <input type="hidden" name="book_no" value="${ book.book_no }">
                                        <label for="exampleInputEmail1">점수</label><br>
                                        &nbsp;<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="rate" id="inlineRadio1" value="1">
										  <!-- <label class="form-check-label" for="inlineRadio1">좋음</label> -->
										  <i class="fa fa-star"></i>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="rate" id="inlineRadio2" value="2">
										  <i class="fa fa-star"></i><i class="fa fa-star"></i>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="rate" id="inlineRadio3" value="3">
										  <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="rate" id="inlineRadio4" value="4">
										  <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="rate" id="inlineRadio5" value="5">
										  <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
										</div>
										<br><br>
                                        <div class="form-group">
										    <label for="exampleInputEmail1">제목</label>
										    <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
										</div>
                                        <div class="form-group">
                                        	<label for="exampleInputEmail1">내용</label>
									    	<textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
									  	</div>
                                       
                                        <div class="review-form-button">
                                        	<button type="button" id="register" class="btn btn-outline-dark">리뷰 남기기</button>
                                        </div>
                                        </form>
                                        </c:if>
                                        
                                        <hr>
                                        <!-- 리뷰 리스트 -->
                                        <div id="review-content-container">
                                        <c:if test="${ empty reviews }">
                                        <p class="text-center">아직 등록된 리뷰가 없지 뭐얌?</p>
                                        </c:if>
                                        <c:forEach items="${ reviews }" var="review">
										<fmt:formatDate var="resultRegDt" value="${review.writeDate}" pattern="yyyy-MM-dd"/>
										
											<div>
											<h5>${ review.title }</h5>
											<p>${ review.id } | <fmt:formatDate value="${review.writeDate}" pattern="yyyy-MM-dd"/> |  
												<c:if test="${ review.rate == 1 }">
												<i class="fa fa-star"></i>
												</c:if>
												<c:if test="${ review.rate == 2 }">
												<i class="fa fa-star"></i><i class="fa fa-star"></i>
												</c:if>
												<c:if test="${ review.rate == 3 }">
												<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
												</c:if>
												<c:if test="${ review.rate == 4 }">
												<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
												</c:if>
												<c:if test="${ review.rate == 5 }">
												<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
												</c:if>
											</p>
											</div>
											<div>
											<p>${ review.content }</p>
											</div>
											<c:if test="${ loginuser.id == review.id }" >
									          <button data-reno='${ review.re_no }' id="edit-button" type="button" class="btn btn-success review-edit">수정</button>
									          <button data-reno='${ review.re_no }' id="delete-button" type="button" class="btn btn-success review-delete">삭제</button>
									        </c:if>
											<hr>
                                        </c:forEach>
                                        </div>
                                        <!-- pagination-area-start -->
										<div class="pagination-area mt-50">
											<div class="page-number">
					 							<ul>
					 								${ pager }
												</ul>
											</div> 
										</div>
										<!-- pagination-area-end -->
                                        
                                    </div>
                                    
                                    
                                    

                                        
                                