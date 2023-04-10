<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
    <title>Check Out</title>
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
</div> <!-- End mainmenu area -->

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
</div>


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="single-sidebar">
                    <h2 class="sidebar-title">Search Products</h2>
                    <form action="">
                        <input type="text" placeholder="Search products...">
                        <input type="submit" value="Search">
                    </form>
                </div>

                <div class="single-sidebar">
                    <h2 class="sidebar-title">Products</h2>
                    <div class="thubmnail-recent">
                        <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins> 700.00</ins> <del> 100.00</del>
                        </div>
                    </div>
                    <div class="thubmnail-recent">
                        <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins> 700.00</ins> <del> 100.00</del>
                        </div>
                    </div>
                    <div class="thubmnail-recent">
                        <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins> 700.00</ins> <del> 100.00</del>
                        </div>
                    </div>
                    <div class="thubmnail-recent">
                        <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins> 700.00</ins> <del> 100.00</del>
                        </div>
                    </div>
                </div>

                <div class="single-sidebar">
                    <h2 class="sidebar-title">Recent Posts</h2>
                    <ul>
                        <li><a href="single-product.html">Sony Smart TV - 2015</a></li>
                        <li><a href="single-product.html">Sony Smart TV - 2015</a></li>
                        <li><a href="single-product.html">Sony Smart TV - 2015</a></li>
                        <li><a href="single-product.html">Sony Smart TV - 2015</a></li>
                        <li><a href="single-product.html">Sony Smart TV - 2015</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <form id="coupon-collapse-wrap" method="post" class="checkout_coupon collapse">

                            <p class="form-row form-row-first">
                                <input type="text" value="" id="coupon_code" placeholder="Coupon code" class="input-text" name="coupon_code">
                            </p>

                            <p class="form-row form-row-last">
                                <input type="submit" value="Apply Coupon" name="apply_coupon" class="button">
                            </p>

                            <div class="clear"></div>
                        </form>

                        <form enctype="multipart/form-data" action="${pageContext.request.contextPath}/checkout" class="checkout" method="post" name="checkout">

                            <div id="customer_details" class="col2-set">
                                <div class="col-1">
                                    <div class="woocommerce-billing-fields">
                                        <h3>Billing Details</h3>

                                        <p id="billing_first_name_field" class="form-row form-row-first validate-required" style="margin-top: 30px">
                                        <div class="form-group">
                                        <h4 class="" style="margin-bottom: 30px" >Your address</h4> <div
                                                type="text" class="form-control" id="address"
                                                ></div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <h3 id="order_review_heading">Your order</h3>

                            <div id="order_review" style="position: relative;">
                                <table class="shop_table">
                                    <thead>
                                    <tr>
                                        <th class="product-name">Product</th>
                                        <th class="product-total">Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="total" value="${0}" />
                                    <c:forEach items="${GIO_HANG.productInCarts }" var="item"
                                               varStatus="loop">
                                    <tr class="cart_item">
                                        <td class="product-name">${item.tenSanPham} <strong class="product-quantity">× ${item.soluong}</strong> </td>
                                        <td class="product-total">
                                            <span class="amount"><fmt:formatNumber type="number" maxIntegerDigits="13" value="${item.soluong*item.giaban}" /> đ</span> </td>
                                    </tr><c:set var="total" value="${total + item.soluong*item.giaban}" />
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>

                                    <tr class="cartDto-subtotal">
                                        <th>Cart Subtotal</th>
                                        <td><span class="amount"><fmt:formatNumber type="number" maxIntegerDigits="13"
                                                                                   value="${total}" /> đ</span>
                                        </td>
                                    </tr>

                                    <tr class="shipping">
                                        <th>Shipping and Handling</th>
                                        <td>30.000 đ
                                            <input type="hidden" class="shipping_method" value="free_shipping" id="shipping_method_0" data-index="0" name="shipping_method[0]">
                                        </td>
                                    </tr>


                                    <tr class="order-total">
                                        <th>Order Total</th>
                                        <td><strong><span class="amount"><fmt:formatNumber type="number" maxIntegerDigits="13"
                                                                                           value="${total - 30000}" /> đ</span></strong> </td>
                                    </tr>

                                    </tfoot>
                                </table>
                            </div>
                            <button style="float: right" type="submit" value="Checkout" name="proceed" class="checkout-button button alt wc-forward">Checkout</button>
                        </form>

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