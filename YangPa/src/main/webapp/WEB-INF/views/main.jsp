<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

</head>

<style type="text/css">
.wrap {
	width: 900px;
	margin: 10px auto;
}

* {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 20px;
	font-weight: bold;
} 

#div-1>h5 {
	color: lightskyblue;
}

#div-1>h4 {
	color: blue;
}

.carousel-inner img {
	width: 100%;
	height: 100%;
}
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	let type = 1;
	$.get(
		"${root}/hot"
		,{
			typeno : 1
		}
		, function(data , status){
			if(status == "success"){
				$("#hotcard").empty();
				$.each(data , function(index , dto) {
					$("#hotcard").append(
						'<div class="card ml-1 mt-1 mb-1 mr-1" style="width: 350px">'
							+'<img class="card-img-top"  style="width: 100%; height : 250px;"' 
								+'src="'+dto.in_tel+'"'
								+'alt="Card image cap">'
							+'<div class="card-body" id="div-1"><h5 class="card-title">'
							+'<a href="${root}/board/detail?bno='+dto.bno+'&typeno='+type+'">'
									+dto.title
								+'</a></h5>'
								+'<p class="card-text">'+dto.contents+'</p>'
								+'<h4>'
								+ dto.price+'원</h4></div></div>'
					);
				});//each
			}else{
				alert("목록 불러오기 오류....");
			}
		}
	);//get
	
	$(".hotsearch").click(function() {
		type = $(this).text();
	      switch (type){
	         case "운동" :
	            type = 1;
	             break;
	         case "여행" :
	            type = 2;
	             break;
	         case "티켓" :
	            type = 3;
	             break;
	         case "기타" :
	            type = 4;
	             break;
	         default :
	            alert("리스트 로딩중 오류 다시 시도해 주십시요");
	              return;
	       }
		$.get(
				"${root}/hot"
				,{
					typeno : type
				}
				, function(data , status){
					if(status == "success"){
						$("#hotcard").empty();
						$.each(data , function(index , dto) {
							$("#hotcard").append(
								'<div class="card ml-1 mt-1 mb-1 mr-1" style="width: 350px">'
									+'<img class="card-img-top"  style="width: 100%; height : 250px;"' 
										+'src="'+dto.in_tel+'"'
										+'alt="Card image cap">'
									+'<div class="card-body" id="div-1"><h5 class="card-title">'
									+ '<a href="${root}/board/detail?bno='+dto.bno+'&typeno='+type+'">'
											+dto.title
										+'</a></h5>'
										+'<p class="card-text">'+dto.contents+'</p>'
										+'<h4>'
										+ dto.price+'원</h4></div></div>'
							);
						});//each
					}else{
						alert("목록 불러오기 오류....");
					}
				}
			);//get
	});//click
	
});//ready
</script>
	<%@ include file="./header.jsp"%>

	<div class="container">
		<div id="demo" class="carousel slide float-center"
			data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators float-center">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner" style="width: 1100px; height: 500px">
				<div class="carousel-item active">
				<a href="#">
					<img src="${root}/resources/img/main/event1.png" width="1100px"
						height="500"></a>
				</div>
				<div class="carousel-item">
				<a href="#">
					<img src="${root}/resources/img/main/event2.png" width="1100px"
						height="500"></a>
				</div>
				<div class="carousel-item">
				<a href="#">
					<img src="${root}/resources/img/main/event3.png" width="1100px"
						height="500">
				</a>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
	<br>
	<!--     중간 링크 아이콘 넣을곳 -->
	<div class="container text-center">
		유형별 판매목록
	</div>
	<div class="container" id = "div-1">
	<h3>
		<a href="${root}/board/mainlist?maintype=1" style="color:#DC143C;"> <img class="ml-5 mr-4" alt="W3Schools"
			src="${root}/resources/img/main/health.PNG" width="160" height="160">
		운동
		</a> <a href="${root}/board/mainlist?maintype=2" style="color:#1E90FF;"> <img class="ml-4 mr-4" alt="W3Schools"
			src="${root}/resources/img/main/travel.PNG" width="160" height="160">
		여행	
		</a> <a href="${root}/board/mainlist?maintype=3" style="color:#A0522D;"> <img class="ml-4 mr-4" alt="W3Schools"
			src="${root}/resources/img/main/ticket.PNG" width="160" height="160">
		티켓
		</a> <a href="${root}/board/mainlist?maintype=4" style="color:#696969;"> <img class="ml-4 mr-4" alt="W3Schools"
			src="${root}/resources/img/main/etc.PNG" width="160" height="160">
		기타
		</a>
		</h3>
	</div>

	<br>
	<div class="row">
		<div class="wrap col-lg-2 mb-5" style="background-color: #87CEEB">
			<div class="mb-2 text-center">가장 핫한 상품</div>
			<div class="list-group">
				   <b><a 
					class="list-group-item hotsearch" style="color:#DC143C;"><i 
					class="fas fa-dumbbell mr-2"></i>운동</a>
					</b>
				   <b><a 
					class="list-group-item hotsearch" style="color:#1E90FF;"><i
						class="fas fa-umbrella-beach mr-2"></i>여행</a>
					</b>
				   <b><a 
					class="list-group-item hotsearch" style="color:#A0522D;"><i
						class="fas fa-ticket-alt mr-2"></i>티켓</a>
					</b>
				   <b><a 
					class="list-group-item hotsearch" style="color:#696969;"><i
						class="fas fa-plus mr-2"></i>기타</a>
					</b>
			</div>
		</div>

		<div class="wrap col-lg-10" style="background-color: #87CEEB">
			<div class="card-columns" id="hotcard">
				<!-- 이부분은 카드의 시작 점  -->
				<div class="card ml-1 mt-1 mb-1 mr-1" style="width: 350px">
					<img class="card-img-top" style="width:100%"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>
				
				<div class="card ml-1 mt-1 mb-1 mr-1" style="width: 350px">
					<img class="card-img-top" style="width:100%"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>

				<div class="card ml-1 mt-1 mb-1 mr-1" style="width: 350px">
					<img class="card-img-top" style="width:100%"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>

				<div class="card ml-1 mt-1 mb-1 mr-1" style="width: 350px">
					<img class="card-img-top" style="width:100%"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>

				<div class="card ml-1 mt-1 mb-1 mr-1" style="width: 350px">
					<img class="card-img-top" style="width:100%"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>

				<div class="card ml-1 mt-1 mb-1 mr-1" style="width: 350px">
					<img class="card-img-top" style="width:100%"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>


			</div>
		</div>
	</div>
	<%@ include file="./footer.jsp"%>
</body>
</html>
