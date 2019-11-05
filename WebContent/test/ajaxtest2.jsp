<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<button onClick="promise()">요청하기</button>

	<div id="demo"></div>
	<script>
		function start() {
			console.log("start");
			var xhr = new XMLHttpRequest();
			
			return new Promise(function(resolve, reject) {
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						if (xhr.status >= 300) {
							reject("Error, status code = " + xhr.status)
						} else {
							resolve(xhr.responseText);
						}
					}
				}
				//true가 비동기, false 동기
				xhr.open("POST", "http://localhost:8000/blog/test2", true);
				xhr.send();
			});

		}
		
		function promise() {
			console.log("promise");
			start();

			start().then(function(result) {
				console.log("start 3초 지남");
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						sum = Number(result) + Number(this.responseText);
						console.log("sum : "+sum)
					}
				};

				xhttp.open("POST", "http://localhost:8000/blog/test3", true);
				xhttp.setRequestHeader("Content-type", "text/plain");
				xhttp.send();
			}, function(error) {
				console.log(error)
			})
		}
	</script>
</body>
</html>