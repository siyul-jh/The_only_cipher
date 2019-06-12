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
/*----------------------------------------------------------------------------*/
/*	4.	Encrypt & Decrypt fileUpload
/*----------------------------------------------------------------------------*/
	// 시간지연 sleep
	function sleep (delay) {
	   var start = new Date().getTime();
	   while (new Date().getTime() < start + delay);
	}
	var Encrypt_DragAndDrop = $("#Encrypt_fileUpload");
	var Decrypt_DragAndDrop = $("#Decrypt_fileUpload");
	// 암호화
	$(document).on("dragenter","#Encrypt_fileUpload",function(e){
	    e.stopPropagation();
	    e.preventDefault();
	    $(this).css('border', '2px solid #0B85A1');
	});
	$(document).on("dragover","#Encrypt_fileUpload",function(e){
	    e.stopPropagation();
	    e.preventDefault();
	});
	$(document).on("drop","#Encrypt_fileUpload",function(e){
		$(this).css('border', '2px dotted #18484e');
	    e.preventDefault();
	    sleep(1000);
	    var files = e.originalEvent.dataTransfer.files;
	    handleFileUpload(files,Encrypt_DragAndDrop);
	});
	// 복호화
	$(document).on("dragenter","#Decrypt_fileUpload",function(e){
	    e.stopPropagation();
	    e.preventDefault();
	    $(this).css('border', '2px solid #0B85A1');
	});
	$(document).on("dragover","#Decrypt_fileUpload",function(e){
	    e.stopPropagation();
	    e.preventDefault();
	});
	$(document).on("drop","#Decrypt_fileUpload",function(e){
		$(this).css('border', '2px dotted #18484e');
	    e.preventDefault();
	    sleep(1000);
	    var files = e.originalEvent.dataTransfer.files;
	    handleFileUpload(files,Decrypt_DragAndDrop);
	});
	//
	$(document).on('dragenter', function (e){
		e.stopPropagation();
		e.preventDefault();
	});
	$(document).on('dragover', function (e){
	  e.stopPropagation();
	  e.preventDefault();
	  Encrypt_DragAndDrop.css('border', '2px dotted #0B85A1');
	  Decrypt_DragAndDrop.css('border', '2px dotted #0B85A1');
	});
	$(document).on('drop', function (e){
		e.stopPropagation();
		e.preventDefault();
	});
	//
	function handleFileUpload(files,obj)
	{
	   for (var i = 0; i < files.length; i++) 
	   {
	        var fd = new FormData();
	        fd.append('file', files[i]);
	 
	        var status = new createStatusbar(obj); //Using this we can set progress.
	        status.setFileNameSize(files[i].name,files[i].size);
	        sendFileToServer(fd,status);
	   }
	}
	// 상태바 만들기
	var rowCount=0;
	function createStatusbar(obj){
		if (obj[0].id == "Encrypt_fileUpload"){
	    	this.division = "Encrypt_fileUpload";
		} else if (obj[0].id == "Decrypt_fileUpload") {
	    	this.division = "Decrypt_fileUpload";
		}
		console.log("id : " + obj[0].title )
	    this.statusbar = $("<div class='statusbar'></div>");
	    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
	    this.size = $("<div class='filesize'>파일크기 : </div>").appendTo(this.statusbar);
	    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
	    this.download = $("<button class='filedownload'>Download</button>").appendTo(this.statusbar);
	    this.abort = $("<div class='abort'>삭제</div>").appendTo(this.statusbar);
	    
	    obj.after(this.statusbar);
	 
	    this.setFileNameSize = function(name,size){
	        var sizeStr="";
	        var sizeKB = size/1024;
	        if(parseInt(sizeKB) > 1024){
	            var sizeMB = sizeKB/1024;
	            sizeStr = sizeMB.toFixed(2)+" MB";
	        }else{
	            sizeStr = sizeKB.toFixed(2)+" KB";
	        }
	 
	        this.filename.html(name);
	        this.size.html(sizeStr);
	    }
	    
	    this.setProgress = function(progress){       
	        var progressBarWidth =progress*this.progressBar.width()/ 100;  
	        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
	        if(parseInt(progress) >= 100)
	        {
	            this.abort.hide();
	        }
	    }
	    
	    this.setAbort = function(jqxhr){
	        var sb = this.statusbar;
	        this.abort.click(function()
	        {
	            jqxhr.abort();
	            sb.hide();
	        });
	    }
	}
	// 서버로 파일 보내기
	function sendFileToServer(formData,status)
	{	
		console.log("formData : " + formData);
		for (var key in formData) {			
			console.log("Attributes: " + key + ", value : " + formData[key]);
		} 
		var uploadURL = "/fileUpload.do"; //Upload URL
	    var extraData ={}; //Extra Data.
	    var jqXHR=$.ajax({
	            xhr: function() {
	            var xhrobj = $.ajaxSettings.xhr();
	            if (xhrobj.upload) {
	                    xhrobj.upload.addEventListener('progress', function(event) {
	                        var percent = 0;
	                        var position = event.loaded || event.position;
	                        var total = event.total;
	                        if (event.lengthComputable) {
	                            percent = Math.ceil(position / total * 100);
	                        }
	                        //Set progress
	                        status.setProgress(percent);
	                    }, false);
	                }
	            return xhrobj;
	        },
	        url: uploadURL,
	        type: "POST",
	        contentType:false,
	        processData: false,
	        cache: false,
	        data: formData,
	        success: function(data){
	            status.setProgress(100);
	        }
	    }); 
	    status.setAbort(jqXHR);
	}
    
    
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
			if(startPage<5) { //총 게시글 수가 5페이지 분량이 안될경우
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
			} else { //총 게시글 수가 5페이지 분량 이상일 경우
				if(data.paging.prev==true) { // PagingDTO 에서 prev가 True 일때 작성
					paging+='<a href="javascript:page('+(startPage-1)+')"><i class="fa fa-angle-left"></i></a>'
					for(i = startPage; i < endPage+1; i++) {
						if(i==(pagenum+1)) {
							paging+='<a class="active" href="javascript:page('+i+');">'+i+'</a>'
						} else {
							paging+='<a href="javascript:page('+i+');">'+i+'</a>'
						}
					}
					if(data.paging.next==true) { // PagingDTO 에서 next가 True 일때 작성
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
$(document).on( "click", ".filedownload", function(){
	var filename = $(this.parentNode.childNodes[0]).text();
	var user_id = this.parentNode.parentNode.childNodes[1].title;
	var user_mail = sessionStorage.getItem("user_mail");
	var type = this.parentNode.parentNode.childNodes[1].id;
	location.href = "filedownload.do?filename="+filename+"&user_id="+user_id+"&user_mail="+user_mail+"&type="+type;
	
})
/*----------------------------------------------------------------------------*/
/*	8.	파일 다중 다온로드
/*----------------------------------------------------------------------------*/
$('.multifiledownload').click(function(){
	var user_id = this.parentNode.childNodes[1].title;
	var user_mail = sessionStorage.getItem("user_mail");
	var type = this.id;
	if (this.parentNode.childNodes[2].nodeName=="#text") {
		alert("다운로드할 파일이 없습니다.");
		return false;
	} else {
		location.href = "multifiledownload.do?user_id="+user_id+"&user_mail="+user_mail+"&type="+type;
	}
});
/*----------------------------------------------------------------------------*/
/*	9.	Google Logout
/*----------------------------------------------------------------------------*/
function singOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
            console.log('로그아웃');
        });
	auth2.disconnect();
	location.href='logout.do';
}
