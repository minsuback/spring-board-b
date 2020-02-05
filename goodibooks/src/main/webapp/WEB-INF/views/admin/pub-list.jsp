<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



							<div class="login-title text-center mb-30">
							<p>추가할 출판사명을 입력해주세요</p>
							</div>
							
							<form class="form-inline" id="pub-form" action="/goodibooks/admin/pubRegist" method="post">
							  <p>출판사명</p>&nbsp;&nbsp;&nbsp;
							  <input type="text" class="form-control mb-2 mr-sm-2" id="pub_name" name="pub_name" style="width:550px;">
							
							  <button type="submit" id="pubRegister-btn" class="btn btn-primary mb-2">등록하기</button>
							</form>
							<br><br>
							
							<table class="table table-hover">
								<thead>
								<tr>
									<th>출판사 번호</th>
									<th>출판사 이름</th>
									<th></th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${ publishers }" var="publisher">
								<tr>
									<td>${ publisher.pub_no }</td>
									<td>${ publisher.pub_name }</td>
									<td><button type="button" class="btn btn-outline-dark delete-button" data-pubNo="${ publisher.pub_no }">삭제</button></td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
							
							
							
							
							
