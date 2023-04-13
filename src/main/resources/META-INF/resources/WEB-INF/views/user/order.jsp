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
        <div class="container" style="margin-top: 50px;margin-bottom: 50px;">
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

            <div class="col-md-9" id="customer-orders">
                <div class="box">
                    <h1>My orders</h1>

                    <p class="lead">Your orders on one place.</p>
                    <p class="text-muted">If you have any questions, please feel free to <a href="${pageContext.request.contextPath}/contact">contact us</a>, our customer service center is working for you 24/7.</p>

                    <hr>

                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Order</th>
                                <th>Date</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="order" items="${orders}" >
                            <tr>
                                <th>${order.code}</th>
                                <fmt:parseDate value="${order.createdDate}" type="date"
                                               pattern="yyyy-MM-dd" var="parsedDate"/>
                                <fmt:formatDate value="${parsedDate}" var='createdDate' type='date'
                                                pattern='dd-MM-yyyy'/>
                                <td>${createdDate}</td>
                                <td>${order.total}</td>
                                <c:if test="${order.statusOrder == 0 }">
                                <td><span class="label label-info">Being prepared</span></td>
                                </c:if>


                                <c:if test="${order.statusOrder == 1 }">
                                    <td><span class="label label-warning">Shipping</span></td>
                                </c:if>


                                <c:if test="${order.statusOrder == 2 }">
                                    <td><span class="label label-success">Received</span> </td>
                                </c:if>

                                <c:if test="${order.statusOrder == 3 }">
                                    <td><span class="label label-danger">Cancelled</span></td>
                                </c:if>

                                <td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->
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
                window.location.href = "${pageContext.request.contextPath}/user/order?page=" + page;
            });
        });
    </script>
</body>
</html>