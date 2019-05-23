<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>Test</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
		<%@ include file="Source/home_topCss.jsp" %>
		<script type="text/javascript" src="/js/home_js/fileUpload_Download.js"></script>
  		<script type="text/javascript">
 			$(document).on( "click", ".filename", function(){
				var FileName = $(this).text();
				location.href="filedown.do?FileName=" + FileName;
			})
		</script>
	</head>

	<body>
		<div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here</div>
	</body>
</html>