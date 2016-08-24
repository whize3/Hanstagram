<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="css/imgareaselect-default.css" />
 <script type="text/javascript" src="js/jquery.min.js"></script>
 <script type="text/javascript" src="js/jquery.imgareaselect.pack.js"></script>
 
 <script>
 
 function preview(img, selection) {
	    var scaleX = 100 / (selection.width || 1);
	    var scaleY = 100 / (selection.height || 1);
	  
	    $('#ferret + div > img').css({
	        width: Math.round(scaleX * 400) + 'px',
	        height: Math.round(scaleY * 300) + 'px',
	        marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px',
	        marginTop: '-' + Math.round(scaleY * selection.y1) + 'px'
	    });
	}

 $(document).ready(function () {
	 $('<div><img src="/Hansta/img/0002.jpg" style="position: relative;" /><div>')
     .css({
         float: 'left',
         position: 'relative',
         overflow: 'hidden',
         width: '100px',
         height: '100px'
     })
     .insertAfter($('#ferret'));

	 $('#ferret').imgAreaSelect({ aspectRatio: '1:1', onSelectChange: preview });
	  $('#ladybug_ant').imgAreaSelect({ aspectRatio: '1:1', handles: true });
});
 </script>
</head>
<body>
 <img src="/Hansta/img/0002.jpg" id="ladybug_ant">

<div id="ferret"></div>
<form action="crop.php" method="post">
  <input type="hidden" name="x1" value="" />
  <input type="hidden" name="y1" value="" />
  <input type="hidden" name="x2" value="" />
  <input type="hidden" name="y2" value="" />
  <input type="submit" name="submit" value="Submit" />
</form>
</body>
</html>