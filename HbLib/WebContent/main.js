$(function(){
	// 신규도서 화면이동
	var n_list = $("#newbookbanner");
	var show_num = 3 ; // 화면에 노출되는 그림의 개수
	var num = 0 ; // 이전, 다음 버튼 클릭하면 증감 되는 값
	var n_total = $(".newbookli",n_list).length; // 5개
	var n_li_width= $(".newbookli:first",n_list).width(); // li의 너비 200
	
	// 신규도서 li 태그 중 인텍스 값이 3보다 작으면 li태그 복사
	var copyObj = $(">.newbookli:lt("+show_num+")",n_list).clone();
	n_list.append(copyObj);
	
	//  신규도서 다음버튼
	  $(".newbooknext").bind("click",function(){
		  if(num == n_total){ // num = 5인경우
			  num = 0 ;
		   n_list.css("margin-left",num);
		  }
		  num++;
		  n_list.stop().animate({marginLeft:-n_li_width*num+"px"},400);
		  return false;
	  });
	//  신규도서 이전버튼
	  $(".newbookpre").bind("click",function(){
		  if(num == 0){
			 num = n_total;
			 n_list.css("margin-left",-num*n_li_width+"px");
		  }
		  num--;
		  n_list.stop().animate({marginLeft:-n_li_width*num+"px"},400);
		  return false;
	  });
	// 신규도서 / 인기도서 탭전환  
	  $("#books li").click(function(){
			$("#books .on").removeClass("on");
			$(this).addClass("on");
	});
	  
	// 인기도서 화면이동
		var h_list = $("#hotbookbanner");
		var show_num = 3 ; // 화면에 노출되는 그림의 개수
		var num = 0 ; // 이전, 다음 버튼 클릭하면 증감 되는 값
		var h_total = $(".hotbookli",h_list).length; // 5개
		var h_li_width= $(".hotbookli:first",h_list).width(); // li의 너비 200
		
		// 인기도서 li 태그 중 인텍스 값이 3보다 작으면 li태그 복사
		var copyObj = $(">.hotbookli:lt("+show_num+")",h_list).clone();
		h_list.append(copyObj);
		
		//  인기도서 다음버튼
		  $(".hotbooknext").bind("click",function(){
			  if(num == h_total){ // num = 5인경우
				  num = 0 ;
			   h_list.css("margin-left",num);
			  }
			  num++;
			  h_list.stop().animate({marginLeft:-h_li_width*num+"px"},400);
			  return false;
		  });
		//  인기도서 이전버튼
		  $(".hotbookpre").bind("click",function(){
			  if(num == 0){
				 num = h_total;
				 h_list.css("margin-left",-num*h_li_width+"px");
			  }
			  num--;
			  h_list.stop().animate({marginLeft:-h_li_width*num+"px"},400);
			  return false;
		  });
		
});
