<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<!-- CLOUDTURING 챗봇 -->
<script>
	window.dyc = {
		chatbotUid : "b3979c0b019058cb"
	};
</script>
<script async src="https://cloudturing.chat/v1.0/chat.js"></script>
<!-- End CLOUDTURING -->

<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>대자보</title>
<script src="${path}/resources/js/write_null.js"></script>
<link href="/resources/css/mypage.css" rel="stylesheet">
</head>
<body>

	<!-- upper navbar here -->
	<jsp:include page="../common/navbar.jsp" />

	<div class="container" style="margin-top: 50px; margin-bottom: 50px;">

		<h3 style="margin-left: 10%;">대자보</h3>
		&nbsp; &nbsp;
		<table class="type07" style="text-align: center; width: 80%;">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성일</th>
					<th style="display: none;">내용</th>



				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${addata}">
					<tr>
						<th style="width: 8%; border-left: none;"><a href="/detail?bNum=${row.adb_num}">${row.adb_num}</a></th>
						<td style="width: 10%;">관리자</td>
						<td style="width: 10%;">${row.ad_category}</td>
						<td><a href="/Admin_detail?adbNum=${row.adb_num}">${row.adb_title}</a></td>
						<td style="width: 9%; border-right: none;"><fmt:formatDate value="${row.adb_cdate}"
								pattern="yyyy.MM.dd" /></td>
						<td style="display: none;">${row.adb_content }</td>

					</tr>
				</c:forEach>

			</tbody>
		</table>

		<div style="width: 90%;">
			<c:if test="${signIn.user_id == '관리자'}">
				<input type="button" value="글쓰기"
					style="float: right; background-color: #1e2539; border: none;"
					class="btn btn-primary"
					onclick="location.href='http://localhost:8081/adwrite'"></input>
			</c:if>

		</div>

		<form style="margin-left: 10%;">
			<input class="form-control me-2"
				style="width: 15%; float: left; margin: 0 auto;" type="text"
				placeholder="검색" name="keyword" value="${keyword}" /> 
			<input class="btn btn-outline-success" type="submit" value="검색" />
		</form>

		<br>

		<div class="row text-center" style="width: 60%;">
			<div class="btn-group me-2" role="group" aria-label="First group"
				style="width: 30%; float: none; margin: 0 auto">

				<button type="button" class="btn btn-primary"
					style="background-color: #455889; border-color: #455889;">1</button>
				<button type="button" class="btn btn-primary"
					style="background-color: #455889; border-color: #455889;">2</button>
				<button type="button" class="btn btn-primary"
					style="background-color: #455889; border-color: #455889;">3</button>
				<button type="button" class="btn btn-primary"
					style="background-color: #455889; border-color: #455889;">4</button>

			</div>
		</div>
	</div>
	<br>

</body>

<!-- footer here -->
<footer class="fixed-bottom">
<jsp:include page="../common/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</footer>
</html>