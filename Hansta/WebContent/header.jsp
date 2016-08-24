<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body{
margin:0;
background:#fafafa;
padding:0;
}
nav{
width:100%;
display: block;
margin:0;
border-bottom:solid 1px #dbdbdb;
background:#fff;
}

#header{
display: block;
width:960px;
height:77px;
margin:0 auto;
}

.header{
display: table;
text-align: center;
width:100%;
padding-top:20px;
}
.header div{
display: table-cell;
vertical-align: middle;
}
.header div input{
padding:3px 10px 3px 26px;
border-radius:3px;
/* outline:none; */
border:solid 1px #dbdbdb;
width:177px;
height:20px;

}
.searchMask{
width:177px;
height:20px;
border:1px solid #000;
display: inline-block;
}

#logoArea{
position:relative;
display: table-cell;
vertical-align: middle;
text-align: left;
}
#logoArea img{
display: inline-block;
width:176px;

}
#iconArea{
display:inline-block;
width:132px;
height:24px;
text-align: right;
}
li{
list-style: none;
}
#search_div ul {
   list-style: none;
   padding: 0px;
   margin: 0px;
}

#search_div li{
height:50px;
}
#search_div li:HOVER {
   background-color: lightblue;
   cursor: pointer;
}
#area{
display: block;
width:100%;
height:auto;
}

#search_div {
   border: 1px solid lightgray;
   border-top: none;
   background-color: white;
   display:none;
    margin:0 auto;
    width: 347px;
    position:relative;
   height: 300px;
    left:34px;
    top:12px;
    overflow-x:hidden;
}
.selected {
   background-color: lightblue;
}
#search_div li div{
display: inline-block;
}
.fuckingproject{
margin-top:14px;
position:absolute;
left:5px;
}
.ttt{
margin-top:14px;
width:50px;
position: absolute;
right: 5px;
text-align: right;
font-size:13px;
}
</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {

   var which;
   var res_split;
   $("#search").keyup(function(e) {
      if($("#search").val().length>0){
    	  $("#search_div").css("display","block");
         if($("#search").val().substr(0,1)=="#"){
      $.ajax({
         type: "post",
         url: "searchhash.do",
         data: {"keyword" : $("#search").val()},
         dataType: "json",
         success: function(data){
            if(e.which != 40 && e.which!=38){
               $("#search_div").empty();
               $("<ul>").attr("css", "width:200px").attr("id","search_list").appendTo($("#search_div"));
               
               for(var i=0; i<data.length; i++)
                  $("<li>").attr("class","keyword").attr("id", i+"sli").html("<div class='fuckingproject'>"+data[i]["keyword"]+"</div><div class='ttt'> "+data[i]["hashcnt"]+"개</div>").appendTo("#search_list");
            }
            $("li.keyword").each(function(){
               $(this).on("click", function(){
//                   $.ajax({
//                      type: "post",
//                      url: "hashlist.do",
//                      data: {"keyword" : $(this).text()},
//                      dataType: "text",
//                      success: function(data){
//                               alert("gdgd");
                              
//                      },
//                      error : function(request,status,error){
//                         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//                       }
//                   });   
                  res_split = $(this).text().split(" ");
                  location.href="hashlist.do?keyword="+res_split[0].substr(1,res_split[0].length);
               })
            });
            if(e.which == 40){
               which++;
               if(which >= $("#search_list").children().length)
                  which = 0;
               $("#search_list").children().attr("class","");
               $("#search_list").children().eq(which).attr("class","selected");
               res_split = res_split = $("#search_list").children().eq(which).text().split(" ");
				$("#search").val(res_split[0]);
            } else if(e.which == 38) {
               which--;
               if(which < 0)
                  which = 0;
               $("#search_list").children().attr("class","");
               $("#search_list").children().eq(which).attr("class","selected");
               res_split = res_split = $("#search_list").children().eq(which).text().split(" ");
				$("#search").val(res_split[0]);
            } else if(e.which == 13){
               $("#search_list").children().eq(which).attr("class","selected");
               $(".selected").trigger("click");
            } else {
               which = -1;
            }
         },
         error : function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
      });
         }else{
            $.ajax({
               type: "post",
               url: "search.do",
               data: {"keyword" : $("#search").val()},
               dataType: "json",
               success: function(data){
                  if(e.which != 40 && e.which!=38){
                     $("#search_div").empty();
                     
                     $("<ul>").attr("css", "width:200px").attr("id","search_list").appendTo($("#search_div"));
                     
                     for(var i=0; i<data.length; i++)
                        if(data[i]["hashcnt"]>0){
                        $("<li>").attr("class","keyword").attr("id", i).text(data[i]["keyword"]+"   "+data[i]["hashcnt"]+"개").appendTo("#search_list");
                        }else{
                        $("<li>").attr("class","keyword_id").attr("id", i).text(data[i]["keyword"]).appendTo("#search_list");
                        }
                  }
                  $("li.keyword").each(function(){
                     $(this).on("click", function(){
                    	 res_split = $(this).text().split(" ");
                         location.href="hashlist.do?keyword="+res_split[0].substr(1,res_split[0].length);
                     })
                  });
                  $("li.keyword_id").each(function(){
                      $(this).on("click", function(){
                          location.href="timeline.do?id="+$(this).text();
                      })
                   });
                  if(e.which == 40){
                     which++;
                     if(which >= $("#search_list").children().length)
                        which = 0;
                     $("#search_list").children().attr("class","");
                     $("#search_list").children().eq(which).attr("class","selected");
                     res_split = res_split = $("#search_list").children().eq(which).text().split(" ");
 					$("#search").val(res_split[0]);
                  } else if(e.which == 38) {
                     which--;
                     if(which < 0)
                        which = 0;
                     $("#search_list").children().attr("class","");
                     $("#search_list").children().eq(which).attr("class","selected");
                     res_split = res_split = $("#search_list").children().eq(which).text().split(" ");
 					$("#search").val(res_split[0]);
                  } else if(e.which == 13){
                     $("#search_list").children().eq(which).attr("class","selected");
                     $(".selected").trigger("click");
                  } else {
                     which = -1;
                  }   
               },
               error : function(request,status,error){
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
         }
   }else{
      $("#search_div").empty();
      $("#search_div").css("display","none");
   }
   });
   $("#log_out").on("click", function(){
	   location.href="logout.do";
	 });
})

</script>
</head>
<body class="body">
<nav>
   <div id="header">
      <div class="header">
      
         <a href="newsfeedgo.jsp" id="logoArea"><img src="/Hansta/img/headerLogo.png"></a>
         <div>
            <!-- <span class="searchMask"></span> --><input type="text" id="search" placeholder="검색">
         </div>
         <div>
         <div id="iconArea">
         	<a href="timeline.do?id=${user.id }">
         		<img src="/Hansta/img/my.PNG">
         	</a>
         	<c:if test="${user.id ne null}">
         	<h2 id="log_out">로그아웃</h2>
         	</c:if>
         </div>
      </div>
   </div>
   <div id="area">
      <div id="search_div"></div>
   </div>
</nav>
</body>
</html>