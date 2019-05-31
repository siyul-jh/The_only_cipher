jQuery(document).ready(function($) {
	'use strict';
/*----------------------------------------------------------------------------*/
/*	1.	Sign in Modal Window
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
    var pagenum = 0
	$.ajax({
		url: "/home/NoticeList.do",
		type: "POST",
		data : {
			'pagenum' : pagenum
		},
		success: function(data){
			console.log("data : " + data.rList[0].title);
			console.log("data : " + data.paging.startPage);
			console.log("data : " + data.paging.endPage);
			var contents_left="";
			var contents_right="";
			var paging="";
			//<!-- 왼쪽 윗 공지 -->
			if(data.rList[0]!=null) {
			contents_left+='<div class="menu">'
			contents_left+='<div class="row">'
			contents_left+='<div class="col-sm-8">'
			contents_left+='<h4 class="menu-title font-alt">'+data.rList[0].title+'</h4>'
			contents_left+='<div class="menu-detail font-serif">'+data.rList[0].chg_dt+'</div>'
			contents_left+='</div>'
			contents_left+='<div class="col-sm-4 menu-price-detail">'
			contents_left+='<h4 class="menu-price font-alt">공지사항</h4>'
			contents_left+='</div>'
			contents_left+='</div>'
			contents_left+='</div>'
			}
			//<!-- 왼쪽 아래 게시글 -->
			if(data.rList[2]!=null) {
			contents_left+='<div class="menu">'
			contents_left+='<div class="row">'
			contents_left+='<div class="col-sm-8">'
			contents_left+='<h4 class="menu-title font-alt">'+data.rList[2].title+'</h4>'
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
			contents_left+='<h4 class="menu-title font-alt">'+data.rList[4].title+'</h4>'
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
			contents_right+='<h4 class="menu-title font-alt">'+data.rList[1].title+'</h4>'
			contents_right+='<div class="menu-detail font-serif">'+data.rList[1].chg_dt+'</div>'
			contents_right+='</div>'
			contents_right+='<div class="col-sm-4 menu-price-detail">'
			contents_right+='<h4 class="menu-price font-alt">공지사항</h4>'
			contents_right+='</div>'
			contents_right+='</div>'
			contents_right+='</div>'
			}
			//<!-- 오른쪽 아래 게시글 -->
			if(data.rList[3]!=null) {
			contents_right+='<div class="menu">'
			contents_right+='<div class="row">'
			contents_right+='<div class="col-sm-8">'
			contents_right+='<h4 class="menu-title font-alt">'+data.rList[3].title+'</h4>'
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
			contents_right+='<h4 class="menu-title font-alt">'+data.rList[5].title+'</h4>'
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
			paging+='<a href="javascript:page('+(data.paging.startPage-1)+')"><i class="fa fa-angle-left"></i></a>'
			paging+='<a class="active" href="javascript:page('+data.paging.startPage+');">'+data.paging.startPage+'</a>'
			paging+='<a href="javascript:page('+(data.paging.startPage+1)+');">'+(data.paging.startPage+1)+'</a>'
			paging+='<a href="javascript:page('+(data.paging.startPage+2)+');">'+(data.paging.startPage+2)+'</a>'
			paging+='<a href="javascript:page('+(data.paging.startPage+3)+');">'+(data.paging.startPage+3)+'</a>'
			paging+='<a href="javascript:page('+data.paging.endPage+');">'+data.paging.endPage+'</a>'
			paging+='<a href="javascript:page('+(data.paging.endPage+1)+')"><i class="fa fa-angle-right"></i></a>'
			//
			$("#contents_left").html(contents_left);
			$("#contents_right").html(contents_right);
			$("#paging").html(paging);
		}
	});
});
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
			console.log("data : " + data.rList[0].title);
			console.log("data : " + data.paging.startPage);
			console.log("data : " + data.paging.endPage);
			var contents_left="";
			var contents_right="";
			var paging="";
			//<!-- 왼쪽 윗 공지 -->
			if(data.rList[0]!=null) {
			contents_left+='<div class="menu">'
			contents_left+='<div class="row">'
			contents_left+='<div class="col-sm-8">'
			contents_left+='<h4 class="menu-title font-alt">'+data.rList[0].title+'</h4>'
			contents_left+='<div class="menu-detail font-serif">'+data.rList[0].chg_dt+'</div>'
			contents_left+='</div>'
			contents_left+='<div class="col-sm-4 menu-price-detail">'
			contents_left+='<h4 class="menu-price font-alt">공지사항</h4>'
			contents_left+='</div>'
			contents_left+='</div>'
			contents_left+='</div>'
			}
			//<!-- 왼쪽 아래 게시글 -->
			if(data.rList[2]!=null) {
			contents_left+='<div class="menu">'
			contents_left+='<div class="row">'
			contents_left+='<div class="col-sm-8">'
			contents_left+='<h4 class="menu-title font-alt">'+data.rList[2].title+'</h4>'
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
			contents_left+='<h4 class="menu-title font-alt">'+data.rList[4].title+'</h4>'
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
			contents_right+='<h4 class="menu-title font-alt">'+data.rList[1].title+'</h4>'
			contents_right+='<div class="menu-detail font-serif">'+data.rList[1].chg_dt+'</div>'
			contents_right+='</div>'
			contents_right+='<div class="col-sm-4 menu-price-detail">'
			contents_right+='<h4 class="menu-price font-alt">공지사항</h4>'
			contents_right+='</div>'
			contents_right+='</div>'
			contents_right+='</div>'
			}
			//<!-- 오른쪽 아래 게시글 -->
			if(data.rList[3]!=null) {
			contents_right+='<div class="menu">'
			contents_right+='<div class="row">'
			contents_right+='<div class="col-sm-8">'
			contents_right+='<h4 class="menu-title font-alt">'+data.rList[3].title+'</h4>'
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
			contents_right+='<h4 class="menu-title font-alt">'+data.rList[5].title+'</h4>'
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
			paging+='<a href="javascript:page('+(data.paging.startPage-1)+')"><i class="fa fa-angle-left"></i></a>'
			paging+='<a class="active" href="javascript:page('+data.paging.startPage+');">'+data.paging.startPage+'</a>'
			paging+='<a href="javascript:page('+(data.paging.startPage+1)+');">'+(data.paging.startPage+1)+'</a>'
			paging+='<a href="javascript:page('+(data.paging.startPage+2)+');">'+(data.paging.startPage+2)+'</a>'
			paging+='<a href="javascript:page('+(data.paging.startPage+3)+');">'+(data.paging.startPage+3)+'</a>'
			paging+='<a href="javascript:page('+data.paging.endPage+');">'+data.paging.endPage+'</a>'
			paging+='<a href="javascript:page('+(data.paging.endPage+1)+')"><i class="fa fa-angle-right"></i></a>'
			//
			$("#contents_left").html(contents_left);
			$("#contents_right").html(contents_right);
			$("#paging").html(paging);
		}
	});
}