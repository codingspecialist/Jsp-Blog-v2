<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		
		$("#my_hide").click(function(){
			$("p").hide();
		});
		
		$("#my_animate").click(function(){
			$("div").animate({
				left: '250px'
			});
		});
	});
</script>
</head>
<body>

<h2>This is a heading</h2>

<p>This is a paragraph.</p>
<p>This is another paragraph.</p>

<button id="my_hide">Click me to hide paragraphs</button> <br /> <br />

<button id="my_animate">Start Animation</button>

<div style="background:#98bf21; height:100px; width:100px; position:absolute;"></div>

</body>
</html>














