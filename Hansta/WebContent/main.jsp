<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.0.0.js"></script>
<script type="text/javascript">
/************************************************************************************/
/* $(function() {
	function getList() {
		$.ajax({
			type : "get",
			url : "select_musics_to_play.do",
			dataType : "xml",
			data: {'playlist_code':playlist_code},
			success : function(data){
				var table = "";
				$(data).find("musiclist").each(function() {
				table += "<li>";
					table += "<source src=\"";
					table += $(this).find("path").text()+"\" type=\"audio/mp4\">";
					table += $(this).find("name").text();
					table += "</source>"
				table += "</li>";
				});
				
				$("#musiclist:eq(0)").append(table);
			},
			error : function() {
				alert("오류발생1");
			}
		});
	}
	getList();
}); */
function getCodeAndPlay(playlist_code){
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : "select_musics_to_play.do",
			dataType : "xml",
			data: {'playlist_code':playlist_code},
			success : function(data){
				var table = "";
				$(data).find("musiclist").each(function() {
				table += "<li>";
					table += "<source src=\"";
					table += $(this).find("path").text()+"\" type=\"audio/mp4\">";
					table += $(this).find("name").text();
					table += "</source>"
				table += "</li>";
				});
				
				$("#musiclist:eq(0)").html(table);
				visiblelist();
			},
			error : function() {
				alert("오류발생0");
			}
		});		
	});
}
/* ===================유저코드 입력받아 리스트에 추가======================== */
 
 
 
 
function start_go(){
	$(document).ready(function(){
		$(function() {
						var playlist_code = 
						/* alert(); */
				$.ajax({
					url : "select_musics_to_play.do",
					data: {'playlist_code':'0'},
					type : "post",
					dataType : "xml",
					success : function(data){
						var table = "";
						$(data).find("musiclist").each(function() {
						table += "<li>";
							table += "<source src=\"";
							table += $(this).find("path").text()+"\" type=\"audio/mp4\">";
							table += $(this).find("name").text();
							table += "</source>"
						table += "</li>";
						});
						
						$("#musiclist:eq(0)").append(table);
					},
					error : function() {
						alert("오류발생1");
					}
				});
			});
			
		});
}
//로드될때 리스트 가져오기
/************************************************************************************/




/************************************************************************************/

var playDuration;
	$(document).on("click", "#musiclist>*" ,function() {
			var index = $("#musiclist>li").index(this);
			var selectedmusic = $("#musiclist li source:eq("+index+")").attr("src");
			document.getElementById("presentplay").src = selectedmusic;
			var play = document.getElementById("play");
			play.load();			
		
			//버튼값 변경
			document.getElementById("playstate").setAttribute("value" , "||");
			$("#playsong").text( $("#musiclist li:eq("+index+")").text());
			play.onloadeddata = function (){
				playDuration = play.duration;
				var minute = parseInt(playDuration/60);
				var sec = parseInt(playDuration%60);
				//alert(minute+ "분"+sec+"초");
				
				progressbar(playDuration,0,0);
			}
	});//클릭한 음악 재생
/*******************************************************************************************************/	


	function aaa(event){
		var x = event.clientX; //현재 클릭한 x좌표
		var fullx = parseInt($("#myprogress").width()); //총 넓이
		var	cliX =parseInt(x/fullx*100); //width 비율값
		/* alert(cliX); */
		var aud = document.getElementById("play");
		var abc = playDuration*(cliX/100); // 클릭 좌표에 대한 재생길이 비율
		aud.currentTime = abc; 			   // 현재시간을 클릭한 값으로 셋팅
		progressbar(playDuration,cliX,abc);	   
	}
		
	
/* ********************************************************************************************************** */
	function createProgressbar(duration,wid,abc){
		duration = duration - abc;
		$('<div>').attr('id', 'progress').css('width',wid +'%').css('height','7px').css('background-color','lightgray').appendTo("#myprogress");
		if (duration/60 <1){
		$('<div>').attr('id', 'label').text(parseInt(duration%60)+"초").appendTo("#myprogress");
			
		}else{
		$('<div>').attr('id', 'label').text(parseInt(duration/60)+"분"+parseInt(duration%60)+"초").appendTo("#myprogress");
			
		}
		
	}
	function destroyProgressbar(){
		$("#progress").remove();
		$("#label").remove();
	}
	function progressbar(duration,wid,abc){
		destroyProgressbar();
		createProgressbar(duration,wid,abc);
			var elem = $("#progress");
			var elem2 = $("#label");
			var interval = (duration*1000);
		    var width = wid;
		    var id = setInterval(frame, interval/100);
		    var id2 = setInterval(frame2, 1000);
		    duration = duration - abc;
		    
		    function frame() {
		        if (width >= 100) {
		            clearInterval(id);
		        } else {
		        	if(togg%2 == 0){
		            width++; 
		            }else{
		            width = width;
		            }
		            elem.attr('style','width:' + width + '%;'+'height : 7px; background-color : lightgray');	            
		        }
		    }
		    function frame2(){
		    	if(duration <= 0 ){
		    		clearInterval(id2);
		    	}else{
		    		if(togg%2 == 0){		    			
		    		duration--;
		    		} else{
		    			duration = duration;
		    		}
		    		if(duration/60 < 1){
		    			
		    		elem2.text(parseInt(duration%60)+"초");			    		
		    		} else { 
		    		elem2.text( parseInt(duration/60)+"분"+parseInt(duration%60)+"초");			    		
		    			
		    		}
		    	}
		    }
		}
	/************************************************************************************/
/**********************************************************************************************************/

	function next(){ //현재곡 재생종료 후 다음곡 재생 무한반복
		 var present = $("#presentplay").attr("src"); 
		 var next;
		 for (var int = 0; int < $("#musiclist>li").length ; int++) {
			/* alert($("#musiclist li source:eq("+int+")").attr("src")); */
			if($("#musiclist li source:eq("+int+")").attr("src") == present){
				next = int+1;
				if(next == $("#musiclist>li").length){
					next = 0;
				}
					break;
			} else {
				next = 0; //전체 목록이 바뀌고 현재 재생곡이 끝나면, 바뀐 목록의 첫노래부터 시작
			}
		 }
		 var selectedmusic = $("#musiclist li source:eq("+next+")").attr("src");
		 document.getElementById("presentplay").src = selectedmusic;
		 
		 $("#playsong").text( $("#musiclist li:eq("+next+")").text());
		 document.getElementById("play").load();
	}
/************************************************************************************/
	 $(document).ready(function(){
		    $("p").click(function(){ //p를 아이콘 클래스로 변경
		    	if(document.getElementById("play").paused == true){
			    	 if (document.getElementById("playstate").value == "▶"){
						 document.getElementById("playstate").setAttribute("value" , "||");
						 document.getElementById("play").play();
					 }else{
						 document.getElementById("playstate").setAttribute("value" , "▶");
						 document.getElementById("play").pause();
					 }		
		    	}else{
			    	 if (document.getElementById("playstate").value == "▶"){
						 document.getElementById("playstate").setAttribute("value" , "||");
						 document.getElementById("play").play();
					 }else{
						 document.getElementById("playstate").setAttribute("value" , "▶");
						 document.getElementById("play").pause();
					 }		
		    	}
		    });
		});
 var togg = 0;
	 function playstate(){ //시작 정지 toggle 버튼
		 if(document.getElementById("play").paused == true){			 
		 }		 
		 if (document.getElementById("playstate").value == "▶"){
			 document.getElementById("playstate").setAttribute("value" , "||");
			 togg++;
			 document.getElementById("play").play();		 
		 }else{
			 document.getElementById("playstate").setAttribute("value" , "▶");
			 togg++;
			/*  alert(togg); */
			 document.getElementById("play").pause();
		 }
	 }
/************************************************************************************/
var togg2 = 0;
function visiblelist(){
	if(togg2%2 == 0){		
	$("#musiclist").css("visibility","visible");
	$("#musiclistbutton").text("▲");
	togg2++;
	}else{
	$("#musiclist").css("visibility","hidden");
	$("#musiclistbutton").text("▼");
		
	togg2++;
	}
}
</script>
<link rel="stylesheet" href="w3.css">
<style type="text/css">
/* ul>li:HOVER {
	background-color: skyblue;
	cursor:pointer;
}
ul{list-style: none;} */

.player{
	position: fixed;
	width: 700px;
	bottom: 20px;
	right: 30px;
	border: 1px solid;
}
#play{
	width : 100%;
	background-color: white;
}
#label{
	position: absolute;
	font-size: 5px;
	color : gray;
	/* border-radius: 2px 2px 2px 2px;
	background-color: lightgray; */
	margin: 3px;
}
#playstate{
	position: fixed;
	left : 50px;
	top: 7px;
	padding-bottom: 0px;
	padding-top: 0px;
	padding-left: 10px;
	padding-right: 10px;
	margin-top: 3px;
}
#cont{
	height : 20px;
	width : 100%;
	position: fixed;
	top: 7px;
	
}
#playsong{
	position: fixed;
	margin-left: 90px;
	font-size: 5px;
	padding-top: 3px;
}

#musiclist{
	position: fixed;
	right: 4px;
	top: 28px;
	width : 300px;
	max-height: 100px;
	overflow: auto;
	visibility: hidden;
	z-index : 100;
}
#musiclist li {
	padding: 3px;
	padding-left: 10px;
}
#musiclist:HOVER {
	cursor: pointer;
}
#musiclistbutton{
	position: fixed;
	right: 3px;
	top: 7px;
	padding-bottom: 0px;
	padding-top: 0px;
	padding-left: 10px;
	padding-right: 10px;
	margin-top: 3px;
}
iframe {
	border: none;
	position: fixed;
	top:70px;
	width: 100%;
	height: 90%;
	z-index: 0;
}

#myprogress:hover{
	cursor: pointer;
}
</style>
</head>
<body onload = "start_go()">
	<div id = "myprogress" style = "background-color: gray; width: 100%; margin:0px; padding: 0px; position: fixed; top:0px; left:0px; height: 7px;" onclick = "aaa(event)">
		<div id = "progress" style = "background-color: gray; height: 7px;"></div>
	</div>
	<div id = "cont" >
		<div class = "w3-black" id = "label"></div>
		<input class = "w3-btn w3-light-grey w3-round w3-tiny " type ="button" id = "playstate" value = "||" onclick="playstate()"/>
		<a id = "playsong"></a>
		<button class= "w3-btn w3-light-grey w3-round w3-tiny" id="musiclistbutton" onclick="visiblelist()">▼</button>
	</div>
	
	<nav class="w3-navbar w3-light-grey " style=" width: 100%;position:absolute; top:30px;" id="mySidenav">
 <!--  <a href="javascript:void(0)" onclick="w3_close()"
  class="w3-closenav w3-large">Close &times;</a> -->
  <a style="padding-left: 10px;padding-right: 10px" href="../music/search_music.jsp" target="frame" >Music Search</a>
  <a style="padding-left: 10px;padding-right: 10px" href="../mymusic/mymusic.jsp" target="frame" >My Music</a>
  <a style="padding-left: 10px;padding-right: 10px" href="searchPlayListView.do" target="frame">Playlist View</a>
  <a style="padding-left: 10px;padding-right: 10px" href="favorite.do" target="frame">follow list</a>
  <a style="padding-left: 10px;padding-right: 10px" href="logout.do">logout</a>
</nav>

	

	<div class = "player" style = "visibility: hidden;">
	<audio id="play" autoplay controls="true" onended= "next()" > 
	<source id="presentplay" src=""  type="audio/mp4"></audio>
	</div >
		<ul class="w3-ul w3-hoverable w3-tiny w3-padding-1" id="musiclist">
		</ul>

		<iframe name="frame" id="frame" src="../mymusic/mymusic.jsp"></iframe>
	
</body>
</html>