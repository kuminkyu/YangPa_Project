<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<a>아이디는 : "${find_id.id}"입니다</a>
	<h2>
		<a href="${pageContext.request.contextPath}/find">
			ID/PWD 찾기 바로가기
		</a>
	</h2>
</body>
</html>