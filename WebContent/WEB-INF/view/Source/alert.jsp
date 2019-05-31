<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String msg = (String)request.getAttribute("msg");	// msg를 받아 String 형으로 변환을 시켜준다.
String url = (String)request.getAttribute("url");	// url를 받아 String 형으로 변환을 시켜준다.
%>
<html>
<head>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
</body>
</html>