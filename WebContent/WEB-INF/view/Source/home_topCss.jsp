<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  Stylesheets -->
<!-- Default stylesheets-->
<link href="/css/home_css/bootstrap.min.css" rel="stylesheet">
<!-- Template specific stylesheets-->
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
<link href="/css/home_css/animate.css" rel="stylesheet">
<link href="/css/home_css/font-awesome.min.css" rel="stylesheet">
<link href="/css/home_css/et-line-font.css" rel="stylesheet">
<link href="/css/home_css/flexslider.css" rel="stylesheet">
<link href="/css/home_css/owl.carousel.min.css" rel="stylesheet">
<link href="/css/home_css/owl.theme.default.min.css" rel="stylesheet">
<link href="/css/home_css/magnific-popup.css" rel="stylesheet">
<link href="/css/home_css/simpletextrotator.css" rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="/css/home_css/style.css" rel="stylesheet">
<link href="/css/home_css/custom.css" rel="stylesheet">
<link id="color-scheme" href="/css/home_css/default.css" rel="stylesheet">
<link href="/css/home_css/fileupload_download.css" rel="stylesheet">
<link href="/css/home_css/fileupload_download.css" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 파일 암호화 -->
<script type="text/javascript">
	$(document).ready(function(){
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
		    this.statusbar = $("<div class='statusbar'></div>");
		    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
		    this.size = $("<div class='filesize'>파일크기 : </div>").appendTo(this.statusbar);
		    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
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
			//if(status.division == "Encrypt_fileUpload") {
			//	var uploadURL = "/Encrypt_fileUpload.do"; //Upload URL
			//} else if(status.division == "Decrypt_fileUpload") {
			//	var uploadURL = "/Decrypt_fileUpload.do"; //Upload URL
			//}
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
</script>