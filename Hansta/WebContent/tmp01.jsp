<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <script type="text/javascript" src="/_include/Lib/jquery/jquery-2.1.4.min.js"></script>
    <style>
        html, body {height:100%; width:100%; padding:0px; margin:0px;}
    </style>
    <script>
        function draw() {
            var canvas = document.getElementById('canvas');
            var ctx = canvas.getContext('2d');
             
            var img = new Image();
            img.src = 'https://mdn.mozillademos.org/files/5397/rhino.jpg';
            img.onload = function(){
                ctx.drawImage( img, 33, 71, 104, 124, 21, 20, 87, 104 );
            }
            var frame = new Image();
            frame.src = 'https://mdn.mozillademos.org/files/242/Canvas_picture_frame.png';
            frame.onload = function(){
                ctx.drawImage( frame, 0, 0 );
            }
             
        }
    </script>
</head>
<body onload="draw();">
 
<canvas id="canvas" width="300" height="300"></canvas>
 
</body>
</html>