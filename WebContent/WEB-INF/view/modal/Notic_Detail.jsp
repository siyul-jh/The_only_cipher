<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.NoticeDTO" %>
<%@ page import="java.util.List" %>
<%
	List<NoticeDTO> cList = (List<NoticeDTO>)request.getAttribute("cList");
%>

<!-- 게시글 상세보기 -->
<div id="modal_custom_notice_detail" class="modal_custom">
	<div class="container">
		<div class="one">
			<h2>Notice</h2>
			<a id="modal-close_sign_up" class="modal_custom_custom-close" href="#"><i class="fa fa-home"></i></a>
		</div>
		<form method="post" action="/NoticeAdd.do"name="newsletterform" id="newsletterform">
			<div class="one">
				<div class="newsletter">
					<h3>제목</h3>
					<fieldset>
						<input name="title" type="text" id="title"placeholder="Title" value="<%=cList.get(0).getTitle()%>"/>
					</fieldset>
				</div>
			</div>
			<div class="one">
				<div class="newsletter">
					<h3>공지 여부</h3>
					<fieldset>
						<input id="option-one" name="yn" value="y" <%if(cList.get(0).getContents()=="y") { %> checked="checked" <%} %>type="radio">
						<label for="option-one"> <span></span>공지사항</label>
						<input id="option-two" name="yn" value="n" <%if(cList.get(0).getContents()=="n") { %> checked="checked" <%} %> type="radio">
						<label for="option-two"> <span></span>게시글</label>
				</fieldset>
				</div>
			</div>
			
			<div class="one">
				<div class="newsletter">
					<h3>내용</h3>
					<fieldset class="contents">
						<textarea name="contents" id="contents"><%=cList.get(0).getContents()%></textarea>
					</fieldset>
				</div>
			</div>
			<div class="one">
				<div class="newsletter">
					<fieldset>
						<button type="button" class="black_button" id="insertBoard">Modify</button>
					</fieldset>
				</div>
			</div>
		</form>
	</div>
</div>
