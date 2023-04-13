<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
    <title>Cart</title>
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
<%--                    <li><a href="${pageContext.request.contextPath}/single-product">Single product</a></li>--%>
                    <li class="active"><a href="${pageContext.request.contextPath}/user/cart">Cart</a></li>
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
                    <h2>Shopping Cart</h2>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End Page title area -->


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-content-right">
                    <div class="woocommerce">
                            <table cellspacing="0" class="shop_table cart mt-5">
                                <thead>
                                <tr>
                                    <th class="product-remove">&nbsp;</th>
                                    <th class="product-thumbnail">&nbsp;</th>
                                    <th class="product-name">Product</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="total" value="${0}" />
                                <c:forEach items="${GIO_HANG.productInCarts }" var="item"
                                           varStatus="loop">

                                    <tr class="cart_item">
                                        <td class="product-remove">
                                            <a title="Remove this item" class="remove" onclick="location.href='${pageContext.request.contextPath}/hien-thi-san-pham-trong-gio-hang/${item.maSanPham}'">×</a>
                                        </td>
                                        <td class="product-thumbnail">
                                            <a href="${pageContext.request.contextPath}/single-product?id=${item.maSanPham}"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="../file/upload/${item.urlImage }"></a>
                                        </td>
                                        <td class="product-name">
                                            <a href="${pageContext.request.contextPath}/single-product?id=${item.maSanPham}">${item.tenSanPham }</a>
                                        </td>
                                        <td class="product-price" >
                                            <span class="amount" id="price"><fmt:formatNumber type="number" maxIntegerDigits="13"
                                                                                   value="${item.giaban}" /> đ</span>
                                        </td>

                                        <td class="product-quantity">
                                            <div class="quantity buttons_added">
                                                <input type="button" id="minus" class="minus" value="-" onclick="Cart.updateQuantity(${item.maSanPham }, ${item.giaban }, -1, ${total }, 'minus');">
                                                <input style="width: 50px" type="number" onkeypress="return runScript(event, ${item.maSanPham })" id="${item.maSanPham }"
                                                       value="${item.soluong }"
                                                       onchange="Cart.updateGioHang(${item.maSanPham }, ${item.giaban }, this.value, ${total });">
                                                <input type="button" class="plus" value="+" onclick="Cart.updateQuantity(${item.maSanPham }, ${item.giaban }, 1, ${total });">
                                            </div>
                                        </td>
                                        <td id="total-item-${item.maSanPham}"><fmt:formatNumber type="number" maxIntegerDigits="13" value="${item.soluong*item.giaban}" /> đ</td>
                                    </tr>
                                    <c:set var="total" value="${total + item.soluong*item.giaban}" />
                                </c:forEach>
                                <tr>
                                    <td class="actions" colspan="6">
                                        <button type="submit" onclick="location.href='${pageContext.request.contextPath}/user/checkout'" value="Checkout" name="proceed" class="checkout-button button alt wc-forward">Checkout</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        <div class="cart-collaterals">


                            <div class="cross-sells">
                                <h2>You may be interested in...</h2>
                                <ul class="products">
                                    <li class="product">
                                        <a href="single-product.html">
                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="/img/product-2.jpg">
                                            <h3>Ship Your Idea</h3>
                                            <span class="price"><span class="amount">£20.00</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.html">Select options</a>
                                    </li>

                                    <li class="product">
                                        <a href="single-product.html">
                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="/img/product-4.jpg">
                                            <h3>Ship Your Idea</h3>
                                            <span class="price"><span class="amount">£20.00</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.html">Select options</a>
                                    </li>
                                </ul>
                            </div>


                            <div class="cart_totals ">
                                <h2>Cart Totals</h2>

                                <table cellspacing="0">
                                    <tbody>
                                    <tr class="cart-subtotal">
                                        <th>Cart Subtotal</th>
                                        <td><span class="amount" id="total"><fmt:formatNumber type="number" maxIntegerDigits="13"
                                                                                   value="${total }" /> đ</span></td>
                                    </tr>

                                    <tr class="shipping">
                                        <th>Shipping and Handling</th>
                                        <td>30.000 đ</td>
                                    </tr>

                                    <tr class="order-total">
                                        <th>Order Total</th>
                                        <td><strong><span class="amount" id="order-total">
                                            <fmt:formatNumber type="number" maxIntegerDigits="13"
                                                              value="${total - 30000}" /> đ
                                        </span></strong> </td>
                                    </tr>
                                    </tbody>
                                </table>
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