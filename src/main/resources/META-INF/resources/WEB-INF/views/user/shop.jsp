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
                    <li class="active"><a href="${pageContext.request.contextPath}/shop">Shop page</a></li>
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


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <c:forEach var="product" items="${products}">

                <div class="col-sm-4">
                    <div class="single-shop-product">
                        <div class="product-upper">
                        <c:forEach var="productImages" end="0"
                                   items="${product.productImages}">
                            <img src="../file/upload/${productImages.title}" width="100%"
                                 height="300px" />
                        </c:forEach>
                        </div>
                        <h2><a href="${pageContext.request.contextPath}/single-product?id=${product.id}">${product.title}</a></h2>
                        <div class="product-carousel-price">
                            <ins> <fmt:formatNumber type="number" maxIntegerDigits="13" value="${product.priceSale}" />đ</ins>
                            <del> <fmt:formatNumber type="number" maxIntegerDigits="13" value="${product.price}" /> đ</del>
                        </div>
                        <div class="product-option-shop">
                            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" onclick="
                                ${pageContext.request.userPrincipal != null} ? Cart.gioHang(${product.id},1) : Cart.redirect()">Add to Cart</a>
                        </div>
                    </div>
                </div>

            </c:forEach>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="product-pagination text-center">
                    <nav aria-label="Page navigation" class="mt-3">
                        <ul class="pagination pagesss" id="pagination"></ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/user/common/js.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<script type="text/javascript">
    $(function() {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages : ${total},
            startPage: ${currentPage},
            visiblePages: 5,
            onPageClick : function(event, page) {
                console.info(page + ' (from options)');
            }
        }).on('page', function(event, page) {
            window.location.href = "${pageContext.request.contextPath}/shop?page=" + page;
        });
    });
</script>
</body>
</html>