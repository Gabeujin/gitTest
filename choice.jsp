<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="BlendTrans(Duration=1)" http-equiv="Page-Enter">
<meta content="BlendTrans(Duration=1)" http-equiv="Page-exit">


<link rel="stylesheet" type="text/css" href="semantic/semantic.css">
<link rel="stylesheet" type="text/css" href="css/BBB.css">
<link rel="stylesheet" type="text/css" href="css/choice.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="semantic/semantic.js"></script>

<meta http-equiv="Content-Type" content="text/html" charset="EUC-KR">
<title>Best of Best Book</title>

</head>
<body>
	<div id="lion" class=""></div>
	<div id="content" class="animate-bottom">
		<span class="ui header">3개의 분야를 선택해주세요</span>
			<table>
				<tr>
					<c:forEach begin="1" end="5" step="1" var="i">
					<td>
						<button id="imgBtn${i}" type="button" class="books" 
								style="border:none; padding: 0;" onclick="test(${i});getOut(${i})" name="${i}">
								<img src="img/${i}.jpg" width="200px" height="300px">
						</button>
					</td>
					</c:forEach>
				</tr>
				
				<tr>
					<c:forEach begin="6" end="10" step="1" var="i">
					<td>
						<button id="imgBtn${i}" type="button" class="books" 
								style="border: none; padding: 0;" onclick="test(${i});getOut(${i})" name="${i}">
								<img src="img/${i}.jpg" width="200px" height="300px">
						</button>
					</td>
					</c:forEach>
			</table>
	</div>
	<!-- <div id="lion" class="animate-bottom">
	</div> -->
	<script type="text/javascript">
	var arr = new Array();
	var count = 0;

		function test(i) {//클릭한 항목의 네임값과 선택횟수를 결정하는 함수
			var num = document.querySelectorAll('button');
			arr[count] = num[i-1].name;
			count++;
			console.log(arr+'/'+count);
			if(count==3){ 
				$("#lion").css("visibility","visible").css("height","350px").addClass("animate-bottom");
				$("#content").css("visibility","hidden");
				location.href="change.jsp?item1="+arr[0]+"&item2="+arr[1]+"&item3="+arr[2];
				
				}
			}
		var j = 0;
		
		function getOut(i){//클릭 애니메이션 및 버튼 비활성화
			var out = $("#imgBtn"+i);
				out[j].className = "animate-getout";
				out.attr("disabled",true);
		}
	</script>
</body>
</html>