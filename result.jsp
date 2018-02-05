<%@page import="com.model.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Best of Best Book</title>
<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/BBB.css">
<link rel="stylesheet" type="text/css" href="css/result.css">
<!-- Custom CSS -->
<style type="text/css">

</style>
<script type="text/javascript">
window.onbeforeunload = function loading(){
	$("#lion").css("visibility","visible").css("height","350px").addClass("animate-bottom");
	$(".row").css("visibility","hidden");
	$(".modal.show .modal-dialog").css("display","none");
	$(".fade").css("display","none");
};

/* if(($("#lion").ClassName) == "animate-bottom"){
	setTimeout(function myFunction(){for(i=0;i<3;i++){
		$("#lion").text("*"*i);
	}},1000);
} */


</script>
</head>

<body onload="lionHidden">
		<div id="lion" class="">
			<span>REFRESH...
			</span>
		</div>
	<br>
	<div class="row animate-bottom">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<button type="button" class="btn animate-fixedBtn" id="backBtn" onclick="location.href='choice.jsp'">다시 선택</button>
			<c:forEach var="category" items="${category}">
				<br>
				<span id="categoryTitle"> ${category} 베스트셀러</span>
				<hr style="border-bottom:1px solid #90A4AE;margin-top: -0.4rem;">
				<div class="row">
					<c:forEach var="book" items="${bestBooks.get(category)}">
						<div class="col-md-2 btn btn-default asd" data-target="#layerpop" data-toggle="modal"
							onclick="check('${book.title}', '${book.author}', '${book.publisher}', '${book.grade}', '${book.imgUrl}', '${book.url}')">
							<img alt="${book.title}" src="${book.imgUrl}" width="auto" height="auto">
						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		<div class="col-md-1"></div>S
	</div>

	<script type="text/javascript">
		function check(title, author, publisher, grade, imgUrl, url) {
			console.log(imgUrl);
			document.getElementById("bookTitle").innerHTML = title;
			document.getElementById("bookImg").innerHTML = "<img alt='" + title + "' src='" + imgUrl +"'><br>";
			document.getElementById("bookAuthor").innerHTML = "<span>작   가 : </span>" + author;
			document.getElementById("bookPublisher").innerHTML = "<span>출판사 : </span>" + publisher;
			document.getElementById("bookGrade").innerHTML = "<span>평   점 : </span>" + grade;
			/* document.getElementById("bookUrl").innerHTML = "<a href='"+url+"'>더보기</a>"; */
			$("#bookUrl").attr("href",url).attr("target","_blank");
			
			var numberGrade = (grade*=1);
			point = parseFloat(numberGrade);
			star = document.getElementById("bookStar");
				if(point>9.0){star.innerHTML = "<img src='img/star/star10.png'>";}
				else if(point>8.0){star.innerHTML = "<img src='img/star/star9.png'>";}
				else if(point>7.0){star.innerHTML = "<img src='img/star/star8.png'>";}
				else if(point>6.0){star.innerHTML = "<img src='img/star/star7.png'>";}
				else if(point>5.0){star.innerHTML = "<img src='img/star/star6.png'>";}
				else if(point>4.0){star.innerHTML = "<img src='img/star/star5.png'>";}
				else if(point>3.0){star.innerHTML = "<img src='img/star/star4.png'>";}
				else if(point>2.0){star.innerHTML = "<img src='img/star/star3.png'>";}
				else if(point>1.0){star.innerHTML = "<img src='img/star/star2.png'>";}
				else if(point>0.0){star.innerHTML = "<img src='img/star/star1.png'>";}			
				else{star.innerHTML = "<img src='img/star/star0.png'>";}			
		}
	</script>
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content" style="color:black;">
				<!-- header -->
				<div class="modal-header">
					<!-- header title -->
					<h2 id="bookTitle" style="margin-bottom: -6px;"></h2>
				</div>
				<!-- body -->
				<div class="modal-body">				
					<div id="bookImg"></div>
					<span id="bookAuthor"></span><br> 
					<span id="bookPublisher"></span><br>
					<span id="bookGrade"></span>
					<span id="bookStar">
					</span>
					
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<a id="bookUrl"><button type="button" class="btn"  style="color: black;">더보기</button></a>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for this template -->
<br>

<script type="text/javascript">
function lionHidden(){
	$("#lion").css("visibility","hidden").css("height","0px").addClass("");
	$(".modal.show .modal-dialog").css("display","");
	$(".fade").css("display","");
}
</script>
</body>

</html>
