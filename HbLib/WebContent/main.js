$(function(){
	// 인기도서 화면이동
	var list = $("#bookbanner");
	var show_num = 3 ; // 화면에 노출되는 그림의 개수
	var num = 0 ; // 이전, 다음 버튼 클릭하면 증감 되는 값
	var total = $(".newbookli",list).length; // 5개
	var li_width= $(".newbookli:first",list).width(); // li의 너비 200
	
	// li 태그 중 인텍스 값이 3보다 작으면 li태그 복사
	var copyObj = $(">.newbookli:lt("+show_num+")",list).clone();
	list.append(copyObj);
	
	// 다음버튼
	  $(".newbooknext").bind("click",function(){
		  if(num == total){ // num = 5인경우
			  num = 0 ;
		   list.css("margin-left",num);
		  }
		  num++;
		  list.stop().animate({marginLeft:-li_width*num+"px"},400);
		  return false;
	  });
	// 이전버튼
	  $(".newbookprev").bind("click",function(){
		  if(num == 0){
			 num = total;
			 list.css("margin-left",-num*li_width+"px");
		  }
		  num--;
		  list.stop().animate({marginLeft:-li_width*num+"px"},400);
		  return false;
	  });
		
});