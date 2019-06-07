jQuery(document).ready(function($) {
	'use strict';
/*----------------------------------------------------------------------------*/
/*	1.	Notice Add Modal Window
/*----------------------------------------------------------------------------*/
    $('#modal_notice_add').on('click', function(e) {
        var mainInner1 = $('#home'),
                modal1 = $('#modal_custom_notice_add');

        mainInner1.animate({opacity: 0}, 300, function() {
            $('html,body').scrollTop(0);
            modal1.addClass('modal-active').fadeIn(600);
        });
        e.preventDefault();

        $('.modal_custom_custom-close').on('click', function(e) {
            modal1.removeClass('modal-active').fadeOut(300, function() {
                mainInner1.animate({opacity: 1}, 200);
            });
            e.preventDefault();
        });
    });
/*----------------------------------------------------------------------------*/
/*	2.	Notice List
/*----------------------------------------------------------------------------*/
    var pagenum = 0
	$.ajax({
		url: "/home/NoticeList.do",
		type: "POST",
		data : {
			'pagenum' : pagenum
		},
		success: function(data){
			var contents_left="";
			var contents_right="";
			var paging="";
			//<!-- 왼쪽 윗 공지 -->
			if(data.rList[0]!=null) {
			contents_left+='<div class="menu">'
			contents_left+='<div class="row">'
			contents_left+='<div class="col-sm-8">'
			contents_left+='<a href="javascript:notice_seq('+data.rList[0].notice_seq+')"><h4 class="menu-title font-alt notice-title">'+data.rList[0].title+'</h4></a>'
			contents_left+='<div class="menu-detail font-serif">'+data.rList[0].chg_dt+'</div>'
			contents_left+='</div>'
			contents_left+='<div class="col-sm-4 menu-price-detail">'
			contents_left+='<h4 class="menu-price font-alt notice-check">공지사항</h4>'
			contents_left+='</div>'
			contents_left+='</div>'
			contents_left+='</div>'
			}
			//<!-- 왼쪽 아래 게시글 -->
			if(data.rList[2]!=null) {
			contents_left+='<div class="menu">'
			contents_left+='<div class="row">'
			contents_left+='<div class="col-sm-8">'
			contents_left+='<a href="javascript:notice_seq('+data.rList[2].notice_seq+')"><h4 class="menu-title font-alt">'+data.rList[2].title+'</h4></a>'
			contents_left+='<div class="menu-detail font-serif">'+data.rList[2].chg_dt+'</div>'
			contents_left+='</div>'
			contents_left+='<div class="col-sm-4 menu-price-detail">'
			contents_left+='<h4 class="menu-price font-alt">조회수 : '+data.rList[2].read_cnt+'</h4>'
			contents_left+='</div>'
			contents_left+='</div>'
			contents_left+='</div>'
			}
			if(data.rList[4]!=null) {
			contents_left+='<div class="menu">'
			contents_left+='<div class="row">'
			contents_left+='<div class="col-sm-8">'
			contents_left+='<a href="javascript:notice_seq('+data.rList[4].notice_seq+')"><h4 class="menu-title font-alt">'+data.rList[4].title+'</h4></a>'
			contents_left+='<div class="menu-detail font-serif">'+data.rList[4].chg_dt+'</div>'
			contents_left+='</div>'
			contents_left+='<div class="col-sm-4 menu-price-detail">'
			contents_left+='<h4 class="menu-price font-alt">조회수 : '+data.rList[4].read_cnt+'</h4>'
			contents_left+='</div>'
			contents_left+='</div>'
			contents_left+='</div>'
			}
			//<!-- 오른쪽 윗 공지 -->
			if(data.rList[1]!=null) {
			contents_right+='<div class="menu">'
			contents_right+='<div class="row">'
			contents_right+='<div class="col-sm-8">'
			contents_right+='<a href="javascript:notice_seq('+data.rList[1].notice_seq+')"><h4 class="menu-title font-alt notice-title">'+data.rList[1].title+'</h4></a>'
			contents_right+='<div class="menu-detail font-serif">'+data.rList[1].chg_dt+'</div>'
			contents_right+='</div>'
			contents_right+='<div class="col-sm-4 menu-price-detail">'
			contents_right+='<h4 class="menu-price font-alt notice-check">공지사항</h4>'
			contents_right+='</div>'
			contents_right+='</div>'
			contents_right+='</div>'
			}
			//<!-- 오른쪽 아래 게시글 -->
			if(data.rList[3]!=null) {
			contents_right+='<div class="menu">'
			contents_right+='<div class="row">'
			contents_right+='<div class="col-sm-8">'
			contents_right+='<a href="javascript:notice_seq('+data.rList[3].notice_seq+')"><h4 class="menu-title font-alt">'+data.rList[3].title+'</h4></a>'
			contents_right+='<div class="menu-detail font-serif">'+data.rList[3].chg_dt+'</div>'
			contents_right+='</div>'
			contents_right+='<div class="col-sm-4 menu-price-detail">'
			contents_right+='<h4 class="menu-price font-alt">조회수 : '+data.rList[3].read_cnt+'</h4>'
			contents_right+='</div>'
			contents_right+='</div>'
			contents_right+='</div>'
			}
			if(data.rList[5]!=null) {
			contents_right+='<div class="menu">'
			contents_right+='<div class="row">'
			contents_right+='<div class="col-sm-8">'
			contents_right+='<a href="javascript:notice_seq('+data.rList[5].notice_seq+')"><h4 class="menu-title font-alt">'+data.rList[5].title+'</h4></a>'
			contents_right+='<div class="menu-detail font-serif">'+data.rList[5].chg_dt+'</div>'
			contents_right+='</div>'
			contents_right+='<div class="col-sm-4 menu-price-detail">'
			contents_right+='<h4 class="menu-price font-alt">조회수 : '+data.rList[5].read_cnt+'</h4>'
			contents_right+='</div>'
			contents_right+='</div>'
			contents_right+='</div>'
			contents_right+='</div>'
			}
			//
			var startPage = Number(data.paging.startPage);
			var endPage = Number(data.paging.endPage);
			var pagenum = Number(data.paging.pagenum);
			var i = 0;
			if(data.paging.startPage<5) {
				for(i = startPage; i< endPage+1; i++) {
					if(i==(pagenum+1)) {
						paging+='<a class="active" href="javascript:page('+i+');">'+i+'</a>'
					} else {
						paging+='<a href="javascript:page('+i+');">'+i+'</a>'
					}
				}
				if(data.paging.next==true) {
					paging+='<a href="javascript:page('+(endPage+1)+')"><i class="fa fa-angle-right"></i></a>'
				}
			} else {
				if(data.paging.prev==true) {
					paging+='<a href="javascript:page('+(startPage-1)+')"><i class="fa fa-angle-left"></i></a>'
					for(i = startPage; i < endPage+1; i++) {
						if(i==(pagenum+1)) {
							paging+='<a class="active" href="javascript:page('+i+');">'+i+'</a>'
						} else {
							paging+='<a href="javascript:page('+i+');">'+i+'</a>'
						}
					}
					if(data.paging.next==true) {
						paging+='<a href="javascript:page('+(endPage+1)+')"><i class="fa fa-angle-right"></i></a>'
					}
				}
			}
			$("#contents_left").html(contents_left);
			$("#contents_right").html(contents_right);
			$("#paging").html(paging);
		}
	});
});
/*----------------------------------------------------------------------------*/
/*	4.	Notice List page
/*----------------------------------------------------------------------------*/
function page(i){
	if (i==null) {
		i = 1;
	}
	var pagenum = i;
	$.ajax({
		url: "/home/NoticeList.do",
		type: "POST",
		data : {
			'pagenum' : pagenum
		},
		success: function(data){
			var contents_left="";
			var contents_right="";
			var paging="";
			//<!-- 왼쪽 윗 공지 -->
			if(data.rList[0]!=null) {
			contents_left+='<div class="menu">'
			contents_left+='<div class="row">'
			contents_left+='<div class="col-sm-8">'
			contents_left+='<a href="javascript:notice_seq('+data.rList[0].notice_seq+')"><h4 class="menu-title font-alt notice-title">'+data.rList[0].title+'</h4></a>'
			contents_left+='<div class="menu-detail font-serif">'+data.rList[0].chg_dt+'</div>'
			contents_left+='</div>'
			contents_left+='<div class="col-sm-4 menu-price-detail">'
			contents_left+='<h4 class="menu-price font-alt notice-check">공지사항</h4>'
			contents_left+='</div>'
			contents_left+='</div>'
			contents_left+='</div>'
			}
			//<!-- 왼쪽 아래 게시글 -->
			if(data.rList[2]!=null) {
			contents_left+='<div class="menu">'
			contents_left+='<div class="row">'
			contents_left+='<div class="col-sm-8">'
			contents_left+='<a href="javascript:notice_seq('+data.rList[2].notice_seq+')"><h4 class="menu-title font-alt">'+data.rList[2].title+'</h4></a>'
			contents_left+='<div class="menu-detail font-serif">'+data.rList[2].chg_dt+'</div>'
			contents_left+='</div>'
			contents_left+='<div class="col-sm-4 menu-price-detail">'
			contents_left+='<h4 class="menu-price font-alt">조회수 : '+data.rList[2].read_cnt+'</h4>'
			contents_left+='</div>'
			contents_left+='</div>'
			contents_left+='</div>'
			}
			if(data.rList[4]!=null) {
			contents_left+='<div class="menu">'
			contents_left+='<div class="row">'
			contents_left+='<div class="col-sm-8">'
			contents_left+='<a href="javascript:notice_seq('+data.rList[4].notice_seq+')"><h4 class="menu-title font-alt">'+data.rList[4].title+'</h4></a>'
			contents_left+='<div class="menu-detail font-serif">'+data.rList[4].chg_dt+'</div>'
			contents_left+='</div>'
			contents_left+='<div class="col-sm-4 menu-price-detail">'
			contents_left+='<h4 class="menu-price font-alt">조회수 : '+data.rList[4].read_cnt+'</h4>'
			contents_left+='</div>'
			contents_left+='</div>'
			contents_left+='</div>'
			}
			//<!-- 오른쪽 윗 공지 -->
			if(data.rList[1]!=null) {
			contents_right+='<div class="menu">'
			contents_right+='<div class="row">'
			contents_right+='<div class="col-sm-8">'
			contents_right+='<a href="javascript:notice_seq('+data.rList[1].notice_seq+')"><h4 class="menu-title font-alt notice-title">'+data.rList[1].title+'</h4></a>'
			contents_right+='<div class="menu-detail font-serif">'+data.rList[1].chg_dt+'</div>'
			contents_right+='</div>'
			contents_right+='<div class="col-sm-4 menu-price-detail">'
			contents_right+='<h4 class="menu-price font-alt notice-check">공지사항</h4>'
			contents_right+='</div>'
			contents_right+='</div>'
			contents_right+='</div>'
			}
			//<!-- 오른쪽 아래 게시글 -->
			if(data.rList[3]!=null) {
			contents_right+='<div class="menu">'
			contents_right+='<div class="row">'
			contents_right+='<div class="col-sm-8">'
			contents_right+='<a href="javascript:notice_seq('+data.rList[3].notice_seq+')"><h4 class="menu-title font-alt">'+data.rList[3].title+'</h4></a>'
			contents_right+='<div class="menu-detail font-serif">'+data.rList[3].chg_dt+'</div>'
			contents_right+='</div>'
			contents_right+='<div class="col-sm-4 menu-price-detail">'
			contents_right+='<h4 class="menu-price font-alt">조회수 : '+data.rList[3].read_cnt+'</h4>'
			contents_right+='</div>'
			contents_right+='</div>'
			contents_right+='</div>'
			}
			if(data.rList[5]!=null) {
			contents_right+='<div class="menu">'
			contents_right+='<div class="row">'
			contents_right+='<div class="col-sm-8">'
			contents_right+='<a href="javascript:notice_seq('+data.rList[5].notice_seq+')"><h4 class="menu-title font-alt">'+data.rList[5].title+'</h4></a>'
			contents_right+='<div class="menu-detail font-serif">'+data.rList[5].chg_dt+'</div>'
			contents_right+='</div>'
			contents_right+='<div class="col-sm-4 menu-price-detail">'
			contents_right+='<h4 class="menu-price font-alt">조회수 : '+data.rList[5].read_cnt+'</h4>'
			contents_right+='</div>'
			contents_right+='</div>'
			contents_right+='</div>'
			contents_right+='</div>'
			}
			//
			var startPage = Number(data.paging.startPage);
			var endPage = Number(data.paging.endPage);
			var pagenum = Number(data.paging.pagenum);
			var i = 0;
			if(startPage<5) {
				for(i = startPage; i< endPage+1; i++) {
					if(i==(pagenum+1)) {
						paging+='<a class="active" href="javascript:page('+i+');">'+i+'</a>'
					} else {
						paging+='<a href="javascript:page('+i+');">'+i+'</a>'
					}
				}
				if(data.paging.next==true) {
					paging+='<a href="javascript:page('+(endPage+1)+')"><i class="fa fa-angle-right"></i></a>'
				}
			} else {
				if(data.paging.prev==true) {
					paging+='<a href="javascript:page('+(startPage-1)+')"><i class="fa fa-angle-left"></i></a>'
					for(i = startPage; i < endPage+1; i++) {
						if(i==(pagenum+1)) {
							paging+='<a class="active" href="javascript:page('+i+');">'+i+'</a>'
						} else {
							paging+='<a href="javascript:page('+i+');">'+i+'</a>'
						}
					}
					if(data.paging.next==true) {
						paging+='<a href="javascript:page('+(endPage+1)+')"><i class="fa fa-angle-right"></i></a>'
					}
				}
			}
			$("#contents_left").html(contents_left);
			$("#contents_right").html(contents_right);
			$("#paging").html(paging);
		}
	});
}
/*----------------------------------------------------------------------------*/
/*	5.	Notice Detail
/*----------------------------------------------------------------------------*/
function notice_seq(i) {
	$.ajax({
		url: "/home/NoticeDetail.do",
		type: "POST",
		data : {
			'notice_seq' : i
		},
		success: function(data){
			var detail="";
			// 게시글 상세보기
			detail+='<div class="container">'
			detail+='<div class="one">'
			detail+='<h2>Notice</h2>'
			detail+='<a id="modal_custom_custom-close" class="modal_custom_custom-close" href="#"><i class="fa fa-home"></i></a>'
			detail+='</div>'
			detail+='<form method="post" action="/NoticeAdd.do"name="newsletterform" id="newsletterform">'
			detail+='<div class="one">'
			detail+='<div class="newsletter">'
			detail+='<h3>제목</h3>'
			detail+='<fieldset>'
			detail+='<input type="hidden" value="'+data.cList[0].notice_seq+'" name="notice_seq">'
			if (data.user_id=="admin") {
				detail+='<input name="title" type="text" id="title" placeholder="Title" value="'+data.cList[0].title+'"/>'
			} else {
				detail+='<input name="title" type="text" id="title" placeholder="Title" readonly="readonly" value="'+data.cList[0].title+'"/>'
			}
			detail+='</fieldset>'
			detail+='</div>'
			detail+='</div>'
			detail+='<div class="one">'
			detail+='<div class="newsletter">'
			detail+='<h3>공지 여부</h3>'
			detail+='<fieldset>'
			if (data.cList[0].notice_yn==("y")) {
				if (data.user_id=="admin") {
					detail+='<input id="option-one" name="yn" value="y" checked="checked" type="radio">'
					detail+='<label for="option-one"> <span></span>공지사항</label>'
					detail+='<input id="option-two" name="yn" value="n" type="radio">'
					detail+='<label for="option-two"> <span></span>게시글</label>'
				} else {
					detail+='<h2>공지사항</h2>'
				}
			} else {
				if (data.user_id=="admin") {
					detail+='<input id="option-one" name="yn" value="y" checked="checked" type="radio">'
					detail+='<label for="option-one"> <span></span>공지사항</label>'
					detail+='<input id="option-two" name="yn" value="n" type="radio">'
					detail+='<label for="option-two"> <span></span>게시글</label>'
				} else {
					detail+='<h2>게시글</h2>'
				}
			}
			detail+='</fieldset>'
			detail+='</div>'
			detail+='</div>'
						
			detail+='<div class="one">'
			detail+='<div class="newsletter">'
			detail+='<h3>내용</h3>'
			detail+='<fieldset class="contents">'
			if (data.user_id=="admin") {
				detail+='<textarea name="contents" id="contents">'+data.cList[0].contents+'</textarea>'
			} else {
				detail+='<textarea name="contents" id="contents" readonly="readonly" >'+data.cList[0].contents+'</textarea>'
			}
			detail+='</fieldset>'
			detail+='</div>'
			detail+='</div>'
			detail+='<div class="one">'
			detail+='<div class="newsletter">'
			detail+='<fieldset>'
			if (data.user_id=="admin") {
				detail+='<button type="submit" formaction="/NoticeoModify.do" class="black_button">Modify</button>'
				detail+='<span>&nbsp;</span>'
				detail+='<button type="submit" formaction="/NoticeoDelete.do" class="black_button">Delete</button>'
			}
			detail+='</fieldset>'
			detail+='</div>'
			detail+='</div>'
			detail+='</form>'
			detail+='</div>'

			$("#modal_custom_notice_detail").html(detail);
		}
	});
	
    $('#home').animate({opacity: 0}, 300, function() {
		$('html,body').scrollTop(0);
		$('#modal_custom_notice_detail').addClass('modal-active').fadeIn(600);
	});

}
$(document).on( "click", ".modal_custom_custom-close", function(i){
	$('#modal_custom_notice_detail').removeClass('modal-active').fadeOut(300, function() {
		$('#home').animate({opacity: 1}, 200);
	});
	i.preventDefault();
});
/*----------------------------------------------------------------------------*/
/*	6. Notice Add
/*----------------------------------------------------------------------------*/
$('#insertBoard').click(function () {
	var title = $('#title').val();
	var contents = $('#contents').val();
	if(title=="") {
		alert("제목을 입력해주세요.")
		return false;
	}
	if(contents=="") {
		alert("내용을 입력해주세요.")
		return false;
	}
});
/*----------------------------------------------------------------------------*/
/*	7.	파일 단일 다온로드
/*----------------------------------------------------------------------------*/
$(document).on( "click", ".filename", function(){
	var filename = $(this).text();
	var user_id = this.parentNode.parentNode.childNodes[1].title;
	var user_key = "mykey";
	var type = this.parentNode.parentNode.childNodes[1].id;

	location.href = "filedownload.do?filename="+filename+"&user_id="+user_id+"&user_key="+user_key+"&type="+type;
})
/*----------------------------------------------------------------------------*/
/*	8.	파일 다중 다온로드
/*----------------------------------------------------------------------------*/
$('.multifiledownload').click(function(){
	var user_id = this.parentNode.childNodes[1].title;
	var user_key = "mykey";
	var type = this.id;
	location.href = "multifiledownload.do?user_id="+user_id+"&user_key="+user_key+"&type="+type;
});

