<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
    <title>Shop</title>
    <jsp:include page="/WEB-INF/views/user/common/css.jsp"></jsp:include>
</head>
<body>
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
                    <li ><a href="${pageContext.request.contextPath}/shop">Shop page</a></li>
                    <%--                    <li><a href="${pageContext.request.contextPath}/single-product">Single product</a></li>--%>
                    <li><a href="${pageContext.request.contextPath}/user/cart">Cart</a></li>
                    <%--                    <li><a href="${pageContext.request.contextPath}/user/checkout">Checkout</a></li>--%>
                    <!-- <li><a href="#">Category</a></li>
                    <li><a href="#">Others</a></li> -->
                    <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </div>
</div> <!-- End mainmenu area -->

<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Wind Shop </h2>
                </div>
            </div>
        </div>
    </div>
</div>


        <div style="text-align: center;">
            <h2>Forgot Password</h2>
        </div>

        <c:if test="${error != null}">
            <div>
                <p class="text-danger">${error}</p>
            </div>
        </c:if>
        <c:if test="${message != null}">
            <div style="text-align: center;">
                <p class="text-warning">${message}</p>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/forgot-password" method="post" style="max-width: 420px; margin: 0 auto;">
            <div class="border border-secondary rounded p-3">
                <div>
                    <p>We will be sending a reset password link to your email.</p>
                </div>
                <div>
                    <p>
                        <input type="email" name="email" class="form-control" placeholder="Enter your e-mail" required
                               autofocus/>
                    </p>
                    <p class="text-center">
                        <input type="submit" value="Send" class="btn btn-primary"/>
                    </p>
                </div>
            </div>
        </form>


<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/user/common/js.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
</body>
</html>