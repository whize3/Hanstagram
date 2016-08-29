<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='https://fonts.googleapis.com/css?family=Maven+Pro' rel='stylesheet' type='text/css'>
<style type="text/css">
   .wrap{
      width: 100%;
      text-align: center;
      position: relative;
      display:table; 
      background: #FAFAFA;
   }
   .photoSel{
   
      position:relative;
      top: -30px;
       margin-left: 42px;
      background: transparent;
      border: none;
      outline: none;
      font-size: 14px;
      color: #656565;
      
   }
   /* .photoSel:HOVER{
      color: #404040;
   } */
   .photoSelFile{
      position: relative;
       top: -27px;
       width: 70px;
       margin-left: -76px;
      cursor: pointer;
      opacity: 0;
      filter:alpha(opcity=0);
      -ms-filter:"alpha(opacity=0)";
      -khtml-opacity:0;
      -moz-opacity:0;
   }
   .photoSelFile:HOVER{
      /* 안됨 ㅎㅎ */
      cursor: pointer;
   }
   .share{
      background: transparent;
      border: none;
      outline: none;
      font-size: 17px;
      color: #424BD1;
      cursor: pointer;
   }
   .share:HOVER{
      color: #626BE4;
   }
   #share{
      display: table-cell;
      /* vertical-align: top; */
      padding-bottom: 20px;
      padding-left: 24px
   }
   .btn{
      display: table-cell;
       vertical-align: bottom;
       position: relative;
       top: 11px;
       left: -26px;
       padding: 17px 0;
       height: 26px;   
   }
   #profileImg{
      border-radius: 50%;
      overflow: hidden;
      margin-right: 14px;
      margin-left: 34px;
   }
   .left{
      width:230px;
      display: table-cell;
      /* vertical-align: top; */   
      border: 1px solid #EFEFEF;
   } 
   .right{
      background-color: white;
      width: 615px;
      display: table-cell;
      vertical-align: middle;
      height: 630px;
      padding-top: 20px;
      padding-bottom: 20px;
      padding-left: 5px;
      padding-right: 5px;
      border: 1px solid #EFEFEF;
   }
   .profile{
      height: 131px;
      display: table-row;
      margin-bottom: 10px;
      border-bottom: 1px solid #EFEFEF;
      margin: 0 auto;
   }
   .profileImg{
      display: table-cell;
      margin-left: 99px;
      vertical-align: top;
   }
   .profileId{
      display: table-cell;
      vertical-align: middle;
      /* margin-left: 30px; */
   }
   .profileId>a{
      margin-bottom: 20px;
      margin-left: 9px;
   }
   .img{
      margin-left:5px;
      margin-right: 5px;
   }
   .wrap2{
      width: 845px;
      /* text-align: center; */
      margin: 0 auto;
   }
   .text{
      margin-top: 11px;
      padding-top:14px;
      border-top: 1px solid #EFEFEF;
   }
   .textarea{
      margin: 0px; 
      width: 319px; 
      height: 507px; 
      resize: none;
      border: 1px solid #EFEFEF;
      outline: none;
   }
   .share-1{
      display: table-cell;
      padding-right: 58px;
   }
   .share-2{
      display: table-cell;
      padding-right: 50px;
   }
   .share-3{
      display: table-cell;
   }
   .cancel{
      background: transparent;
      border: none;
      outline: none;
      font-size: 25px;
      color: #686868;
      cursor: pointer;
   }
   .cancel:HOVER {
      color: #989797;
   }
   ul{
      list-style: none;
      padding: 0;
   }
   li{
      display: list-item;
       text-align: -webkit-match-parent;
   }
   ul>li>a{
      border-left: 2px solid transparent;
       display: block;
       font-size: 16px;
       height: 100%;
       line-height: 20px;
       padding: 16px 16px 16px 30px;
       width: calc(100% - 48px);
       padding-left: 0;
         width: 230px;
         text-decoration: none;
         color: #3262626;
   }
   ul>li>a:HOVER{
      font-weight: 600;
      border-left: 2px solid black;
      background-color: #FAFAFA;
      cursor: pointer;
   }
   .profile_bottom{
      display: table-row;
      margin: 0 auto;
   }
   .prWrap{
      display: table;
      height: 650px;
      width: 600px;
   }
   .f_label{
      font-size: 15px;
      width: 150px;
      font-weight: 600;
      height: 54px;
   }
   .f_label>label{
      margin: 0 auto;
   }
   .f_input{
      padding: 0 10px;
      box-sizing: border-box;
      height: 29px;
      border: 1px solid #DBDBDB;
      width: 100px;
      border-radius: 2px;
      width: 270px;
   }
   .pro_table{
      margin-left: 52px;
   }
   .submitBtn{
      border-radius: 3px;
          border-style: solid;
       border-width: 1px;
        background: 0 0;
       border-color: #3897f0;
       color: #3897f0;
       cursor: pointer;
       line-height: 29px;
       padding: 0 11px;
       font-size: 16px;
   }
   .profile_top{
      display: table;
      margin: 0 auto;
   }
}
</style>
<link rel="stylesheet" href="http://jcrop-cdn.tapmodo.com/v2.0.0-RC1/css/Jcrop.css" type="text/css">
<script type="text/javascript">
   function submit_go(f) {
      f.action="infoModify.do";
      f.submit();
   }

   function imageCheck(input) {
                      
      if(input.files&&input.files[0]){
         var reader = new FileReader();
         reader.onload=function(e){
            $('#profileImg').attr('src',e.target.result);
         }
         reader.readAsDataURL(input.files[0]);
      }
   
   }
</script>

</head>
<body>
   <div>
      <jsp:include page="header.jsp"/>
   </div>
   <div class="wrap">
      <div class="wrap2">
         <form id="imageUp" runat="server" method="post" enctype="multipart/form-data" style="background-color: white; margin-top: 25px;">
            <div class="left">
               
               <ul>
                  <li>
                     <a href="profilego.do?id=${usermo.id}">프로필 편집</a>
                  </li>
               </ul>
               
            </div>
            <div class="right">
               <div class="prWrap">
                  <div class="profile">
                     <div class="profile_top">
                        <div class="profileImg">
                           <a class=""><img id="profileImg" src="${usermo.profile_url}" width="100px" height="100px"/></a>
   <%--                         <a class=""><img id="profileImg" class="jcrop_target" src="${uvo.profile_url}" width="38px" height="38px"/></a> --%>
                        </div>
                        <div class="profileId">
                           <a style="font-family: 'Maven Pro', sans-serif; font-weight:bold; font-size: 21px; color: #656565">${usermo.id }</a>
   <%--                         <a style="font-family: 'Maven Pro', sans-serif; font-weight:bold; font-size: 15px; color: #656565">${usermo.id }</a> --%>
                        </div>
                        <div class="btn">
                           <input type="button" class="photoSel" value="파일 선택" />
                           <input type="file" class="photoSelFile" name="photoSel" onchange="imageCheck(this);"/>
                        </div>
                        <hr/>
                     </div>
                  </div>
                  <div class="profile_bottom">
                     <table class="pro_table">
                        <tbody style="width: 500px;">
                           <tr>
                              <td class="f_label"><label>이름</label></td>
                              <td><input type="text" class="f_input" name="name" value="${usermo.name}"/></td>
                           </tr>
                           <tr>
                              <td class="f_label"><label>사용자 이름</label></td>
                              <td><input type="text" class="f_input" name="id" value="${usermo.id}"/></td>
                           </tr>
                           <tr>
                              <td class="f_label"><label>이메일</label></td>
                              <td><input type="text" class="f_input" name="email" value="${usermo.email}"/></td>
                           </tr>
                           <tr>
                              <td class="f_label"><label>비밀번호</label></td>
                              <td><input type="password" class="f_input" name="pwd1"/></td>
                           </tr>
                           <tr>
                              <td class="f_label"><label>비밀번호 확인</label></td>
                              <td><input type="password" class="f_input" name="pwd2"/></td>
                           </tr>
                           <tr style="height: 60px;">
                              <td colspan="2"><input type="button" class="submitBtn" value="제출" onclick="submit_go(this.form)"/></td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </form>
      </div>
   </div>
   
</body>
</html>