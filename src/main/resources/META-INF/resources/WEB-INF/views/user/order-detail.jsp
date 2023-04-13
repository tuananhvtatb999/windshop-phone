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
                    <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop">Shop page</a></li>
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


<!-- ---------CONTENT-------------- -->

<div id="all">

    <div id="content">
        <div class="container">
            <div class="col-md-3">
                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Customer section</h3>
                    </div>

                    <div class="panel-body">

                        <ul class="nav nav-pills nav-stacked">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/user/order"><i class="fa fa-list"></i> My orders</a>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/user/account"><i class="fa fa-user"></i> My account</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out"></i> Logout</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /.col-md-3 -->

                <!-- *** CUSTOMER MENU END *** -->
            </div>

            <div class="col-md-9" id="customer-order">
                <div class="box">
                    <h1>Order #1735</h1>

                    <p class="lead">Order #1735 was placed on <strong>22/06/2013</strong> and is currently <strong>Being prepared</strong>.</p>
                    <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>

                    <hr>

                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th colspan="2">Product</th>
                                <th>Quantity</th>
                                <th>Unit price</th>
                                <th>Discount</th>
                                <th>Total</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <a href="#">
                                        <img src="img/detailsquare.jpg" alt="White Blouse Armani">
                                    </a>
                                </td>
                                <td><a href="#">White Blouse Armani</a>
                                </td>
                                <td>2</td>
                                <td>$123.00</td>
                                <td>$0.00</td>
                                <td>$246.00</td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="#">
                                        <img src="img/basketsquare.jpg" alt="Black Blouse Armani">
                                    </a>
                                </td>
                                <td><a href="#">Black Blouse Armani</a>
                                </td>
                                <td>1</td>
                                <td>$200.00</td>
                                <td>$0.00</td>
                                <td>$200.00</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="5" class="text-right">Order subtotal</th>
                                <th>$446.00</th>
                            </tr>
                            <tr>
                                <th colspan="5" class="text-right">Shipping and handling</th>
                                <th>$10.00</th>
                            </tr>
                            <tr>
                                <th colspan="5" class="text-right">Tax</th>
                                <th>$0.00</th>
                            </tr>
                            <tr>
                                <th colspan="5" class="text-right">Total</th>
                                <th>$456.00</th>
                            </tr>
                            </tfoot>
                        </table>

                    </div>
                    <!-- /.table-responsive -->

                    <div class="row addresses">
                        <div class="col-md-6">
                            <h2>Invoice address</h2>
                            <p>John Brown
                                <br>13/25 New Avenue
                                <br>New Heaven
                                <br>45Y 73J
                                <br>England
                                <br>Great Britain</p>
                        </div>
                        <div class="col-md-6">
                            <h2>Shipping address</h2>
                            <p>John Brown
                                <br>13/25 New Avenue
                                <br>New Heaven
                                <br>45Y 73J
                                <br>England
                                <br>Great Britain</p>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <!-- /.container -->
    </div>
    <!-- /#content -->
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