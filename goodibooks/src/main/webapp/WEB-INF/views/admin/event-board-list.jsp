<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<table class="table table-hover">
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이벤트 기한</th>
			<th>작성일</th>
			<th>배너 활성화 여부</th>
		</tr>
		</thead>
		<tbody>
		<c:choose>
		<c:when test="${not empty eventList}">
			<c:forEach var="e" items="${eventList}">
				<tr>
					<td>${e.no}</td>
					<td><a href="/goodibooks/admin/eventBoard-detail.action?no=${e.no}">${e.title}</a></td>
					<td>${e.beginDate} ~ ${e.endDate}</td>
					<td>${e.regDate}</td>
					<td><a class="activeBtn" endD="${e.endDate}" no="${e.no}" href="">${e.active == true ? "활성화" : "비활성화"}</a></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr><td colspan="5" style="text-align:center">등록된 이밴트가 없습니다.</td></tr>
		</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	<hr/>
	