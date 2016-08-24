<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Hansta/css/sue.css">
<script src="/Hansta/js/jquery.min.js"></script>
<script src="/Hanstajs/jquery.Jcrop.min.js"></script>
<link rel="stylesheet" href="/Hansta/css/jquery.Jcrop.css" type="text/css" />

<script language="javascript">
	jQuery(function($){
		 
		var jcrop_api,
	        boundx,
	        boundy,

	        // Grab some information about the preview pane
	        $preview = $('#preview-pane'),
	        $pcnt = $('#preview-pane .preview-container'),
	        $pimg = $('#preview-pane .preview-container img'),

	        xsize = $pcnt.width(),
	        ysize = $pcnt.height();
	    
	    console.log('init',[xsize,ysize]);
		
		$('#target').Jcrop({
		      onChange: updatePreview,
		      onSelect: updatePreview,
		      aspectRatio: xsize / ysize
		    },function(){
		      // Use the API to get the real image size
		      var bounds = this.getBounds();
		      boundx = bounds[0];
		      boundy = bounds[1];
		      // Store the API in the jcrop_api variable
		      jcrop_api = this;

		      // Move the preview into the jcrop container for css positioning
		      $preview.appendTo(jcrop_api.ui.holder);
		    });
		
		 function updatePreview(c)
		    {
		      if (parseInt(c.w) > 0)
		      {
		        var rx = xsize / c.w;
		        var ry = ysize / c.h;

		        $pimg.css({
		          width: Math.round(rx * boundx) + 'px',
		          height: Math.round(ry * boundy) + 'px',
		          marginLeft: '-' + Math.round(rx * c.x) + 'px',
		          marginTop: '-' + Math.round(ry * c.y) + 'px'
		        });
		      }
		    };
	});
</script>
<link rel="stylesheet" href="/Hansta/css/main.css" type="text/css" />
<link rel="stylesheet" href="/Hansta/css/demos.css" type="text/css" />
<style type="text/css">
.jcrop-holder #preview-pane {
  display: block;
  position: absolute;
  z-index: 2000;
  top: 10px;
  right: -280px;
  padding: 6px;
  border: 1px rgba(0,0,0,.4) solid;
  background-color: white;

  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;

  -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
}

/* The Javascript code will set the aspect ratio of the crop
   area based on the size of the thumbnail preview,
   specified here */
#preview-pane .preview-container {
  width: 250px;
  height: 170px;
  overflow: hidden;
}

</style>
</head>
<body class="body">
<main><article><header class="profile">
	<h3>프로필 변경하기</h3>
</header></article></main>
<article>
	<img src="/Hansta/img/0002.jpg" id="target"/>
</article>
</body>
</html>