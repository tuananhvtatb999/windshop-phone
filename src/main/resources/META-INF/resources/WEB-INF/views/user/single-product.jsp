<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
    <title>Single Product</title>
    <jsp:include page="/WEB-INF/views/user/common/css.jsp"></jsp:include>
</head>
<style>
    .product-detai-imgs {
        width: 450px;
    }

    product-detai-imgs ul {
        list-style: none outside none;
        padding-left: 0;
        margin-bottom: 0;
    }

    product-detai-imgs li {
        display: block;
        float: left;
        margin-right: 6px;
        cursor: pointer;
        border: 1px solid #ccc;
    }

    .lslide img {
        border: 1px solid #ccc;
        border-radius: 10%;
    }

    product-detai-imgs img {
        display: block;
        height: auto;
        max-width: 100%;
        margin-right: 5px;
    }

    .lSPager img {
        border: 1px solid #ccc;
        border-radius: 20%;
    }

    .detailss, .des {
        font-size: 16px;
    }

    .price .s {
        font-size: 20px;
    }

    .desss {
        text-align: center;
        font-size: 32px;
        font-weight: bold;
        padding: 50px 0 50px 0;
        color: red;
    }

    .lSSlideOuter .lSPager.lSGallery img {
        height:100px;
    }
</style>
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
                    <li><a href="${pageContext.request.contextPath}/shop">Shop page</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/single-product">Single product</a></li>
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
                    <h2>Wind Shop</h2>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
<%--            <div class="col-md-4">--%>
<%--                <div class="single-sidebar">--%>
<%--                    <h2 class="sidebar-title">Search Products</h2>--%>
<%--                    <form action="">--%>
<%--                        <input type="text" placeholder="Search products...">--%>
<%--                        <input type="submit" value="Search">--%>
<%--                    </form>--%>
<%--                </div>--%>

<%--                <div class="single-sidebar">--%>
<%--                    <h2 class="sidebar-title">Products</h2>--%>
<%--                    <div class="thubmnail-recent">--%>
<%--                        <img src="img/product-thumb-15.jpg" class="recent-thumb" alt="">--%>
<%--                        <h2><a href="">Sony Smart TV - 2015</a></h2>--%>
<%--                        <div class="product-sidebar-price">--%>
<%--                            <ins> 700.00</ins> <del> 100.00</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="thubmnail-recent">--%>
<%--                        <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">--%>
<%--                        <h2><a href="">Sony Smart TV - 2015</a></h2>--%>
<%--                        <div class="product-sidebar-price">--%>
<%--                            <ins> 700.00</ins> <del> 100.00</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="thubmnail-recent">--%>
<%--                        <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">--%>
<%--                        <h2><a href="">Sony Smart TV - 2015</a></h2>--%>
<%--                        <div class="product-sidebar-price">--%>
<%--                            <ins> 700.00</ins> <del> 100.00</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="thubmnail-recent">--%>
<%--                        <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">--%>
<%--                        <h2><a href="">Sony Smart TV - 2015</a></h2>--%>
<%--                        <div class="product-sidebar-price">--%>
<%--                            <ins> 700.00</ins> <del> 100.00</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="single-sidebar">--%>
<%--                    <h2 class="sidebar-title">Recent Posts</h2>--%>
<%--                    <ul>--%>
<%--                        <li><a href="">Sony Smart TV - 2015</a></li>--%>
<%--                        <li><a href="">Sony Smart TV - 2015</a></li>--%>
<%--                        <li><a href="">Sony Smart TV - 2015</a></li>--%>
<%--                        <li><a href="">Sony Smart TV - 2015</a></li>--%>
<%--                        <li><a href="">Sony Smart TV - 2015</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>

            <div class="col-md-12">
                <div class="product-content-right">
                    <div class="product-breadcroumb">
                        <a href="">Home</a>
                        <a href="">Category Name</a>
                        <a href="">Sony Smart TV - 2015</a>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="product-images">
                                <div class="product-main-img">
                                    <img src="/file/upload/${product.productImages[0].title }" alt="">
                                </div>

                                <div class="product-gallery">
                                    <c:forEach var="img" items="${product.productImages }">
                                        <img src="/file/upload/${img.title }" alt="">
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="product-inner">
                                <h2 class="product-name">${product.title }</h2>
                                <div class="product-inner-price">
                                    <ins id="price"> ${product.price} </ins> <del id="priceSale"> <c:if test="${product.priceSale != null }">
                                    ${product.priceSale}
                                </c:if></del>
                                </div>

                                <form action="" class="cartDto">
<%--                                    <div class="quantity">--%>
<%--                                        <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1">--%>
<%--                                    </div>--%>
                                    <button class="add_to_cart_button" type="button" onclick="
                                    ${pageContext.request.userPrincipal != null} ? Cart.gioHang(${product.id},1) : Cart.redirect()">Add to Cart</button>
                                </form>

                                <div class="product-inner-category">
                                    <p>Category: <a href="">${product.category.name}</a></p>
                                </div>

                                <div role="tabpanel">
                                    <ul class="product-tab" role="tablist">
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Description</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                                            <h2>Product Description</h2>
                                            <p>${product.shortDes}</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="related-products-wrapper">
                        <h2 class="related-products-title">Related Products</h2>
                        <div class="related-products-carousel">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/product-1.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="" class="add-to-cartDto-link"><i class="fa fa-shopping-cartDto"></i> Add to cartDto</a>
                                        <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href="">Sony Smart TV - 2015</a></h2>

                                <div class="product-carousel-price">
                                    <ins> 700.00</ins> <del> 100.00</del>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/product-2.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="" class="add-to-cartDto-link"><i class="fa fa-shopping-cartDto"></i> Add to cartDto</a>
                                        <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href="">Apple new mac book 2015 March :P</a></h2>
                                <div class="product-carousel-price">
                                    <ins> 899.00</ins> <del> 999.00</del>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/product-3.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="" class="add-to-cartDto-link"><i class="fa fa-shopping-cartDto"></i> Add to cartDto</a>
                                        <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href="">Apple new i phone 6</a></h2>

                                <div class="product-carousel-price">
                                    <ins> 400.00</ins> <del> 425.00</del>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/product-4.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="" class="add-to-cartDto-link"><i class="fa fa-shopping-cartDto"></i> Add to cartDto</a>
                                        <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href="">Sony playstation microsoft</a></h2>

                                <div class="product-carousel-price">
                                    <ins> 200.00</ins> <del> 225.00</del>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/product-5.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="" class="add-to-cartDto-link"><i class="fa fa-shopping-cartDto"></i> Add to cartDto</a>
                                        <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href="">Sony Smart Air Condtion</a></h2>

                                <div class="product-carousel-price">
                                    <ins> 1200.00</ins> <del> 1355.00</del>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/product-6.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="" class="add-to-cartDto-link"><i class="fa fa-shopping-cartDto"></i> Add to cartDto</a>
                                        <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href="">Samsung gallaxy note 4</a></h2>

                                <div class="product-carousel-price">
                                    <ins> 400.00</ins>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/user/common/js.jsp"></jsp:include>
</body>
</html>