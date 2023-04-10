<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop Homepage - Start Bootstrap Template</title>

<jsp:include page="/WEB-INF/views/user/common/css.jsp"></jsp:include>

</head>

<body>

	<!-- Navigation -->
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<div class="mainmenu-area">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li ><a href="${pageContext.request.contextPath}/home">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/shop">Shop page</a></li>
						<li><a href="${pageContext.request.contextPath}/single-product">Single product</a></li>
						<li><a href="${pageContext.request.contextPath}/user/cart">Cart</a></li>
						<li><a href="${pageContext.request.contextPath}/user/checkout">Checkout</a></li>
						<!-- <li><a href="#">Category</a></li>
                        <li><a href="#">Others</a></li> -->
						<li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="product-big-title-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-bit-title text-center">
						<h2>Shopping Cart</h2>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- End Page title area -->
	<div class="container text-center clearfix">
		<img alt="#" src="/img/empty-cart.png">
		<div class="mt-5"><button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/shop'">Tiếp tục mua hàng</button></div>
	</div>
	<!-- /.container -->

	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/user/common/js.jsp"></jsp:include>


</body>

</html>
