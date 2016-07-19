$(function(){
	
		$(".able").hover(function() {
			console.log($(this).attr('id'));
			$(this).addClass("tmp");
		}, function() {
			$(this).removeClass("tmp");
		});
		
		$(".able").click(function() {
			alert("gd")
			console.log(".able is clicked");
			$(".click").removeClass("click");
			$(this).addClass("click");
			var date = $('input[name=year]').val()+"/"+$('input[name=month]').val()+"/"+$(this).text();
			console.log(date);
			$('input[name=rDate]').val(date);
			$('input[name=date]').val(date);
			/*$.ajax({
				url:'/library/Controller?type=getRoom&date='+date,
				type:'post',
				success:function(data){
					$("#srArea").load("studyroom.jsp?cmd=refresh");
				},error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})*/
		});
		$('#calTop img').click(function(){
			alert("gd")
			var month = $("input[name=month]").val();
			var year = $("input[name=year]").val();
			
			if($(this).attr("id")=="pre"){
				month--;
			}else{
				if(month==12){
					year++;
					month=1;
				}else{
					month++;
				}
			}
			console.log(month+"/"+year);
		
			$.ajax({
				url:'/HbLib/Controller?type=getRoom',
				type:'post',
				data:{month:month,year:year},
				success:function(data){
					$("#calArea").load("calendar.jsp?month="+month+"&"+"year="+year);
				},error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
			
		});
});