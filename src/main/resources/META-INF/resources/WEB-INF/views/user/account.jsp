<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                    <h2 class="sidebar-title">Personal Information</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- content-->

<div id="content">
    <div class="container">

        <div class="col-md-12">

            <ul class="breadcrumb">
                <li><a href="#">Home</a>
                </li>
                <li>My account</li>
            </ul>

        </div>

        <div class="col-md-3">
            <div class="panel panel-default sidebar-menu">

                <div class="panel-heading">
                    <h3 class="panel-title">Customer section</h3>
                </div>

                <div class="panel-body">

                    <ul class="nav nav-pills nav-stacked">
                        <li>
                            <a href="customer-orders.html"><i class="fa fa-list"></i> My orders</a>
                        </li>
                        <li class="active">
                            <a href="customer-account.html"><i class="fa fa-user"></i> My account</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out"></i>
                                Logout</a>
                        </li>
                    </ul>
                </div>

            </div>
            <!-- /.col-md-3 -->

            <!-- *** CUSTOMER MENU END *** -->
        </div>

        <div class="col-md-9">
            <div class="box">
                <h1>My account</h1>
                <p class="lead">Change your personal details or your password here.</p>

                <h3>Change password</h3>

                <form>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="password_old">Old password</label>
                                <input type="password" class="form-control" id="password_old">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="password_1">New password</label>
                                <input type="password" class="form-control" id="password_1">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="password_2">Retype new password</label>
                                <input type="password" class="form-control" id="password_2">
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->

                    <div class="col-sm-12 text-center">
                        <button type="button" class="btn btn-primary" onclick="Account.changePassword()"><i
                                class="fa fa-save"></i> Save new password
                        </button>
                    </div>
                </form>

                <hr>

                <h3>Personal details</h3>
                    <!-- <div class="p-5">
                        <div class="rounded-circle border d-flex justify-content-center align-items-center "
                             style=" width:100px;height:100px" alt="Avatar">
                             <img src="./img/brand5.png" alt="Avatar" class="avatar" style="width:100px;height:100px; ">
                        </div>
                    </div> -->
                    <div class="row" style="padding-bottom: 30px;">
                        <form method="post" enctype="multipart/form-data">
                            <label>Avatar</label>
                            <div class="col-sm-12 rounded-circle border d-flex justify-content-center align-items-center">
                                <img id="avatar" src="../file/upload/${user.avatar}" class="avatar" alt="Avatar" width="200"
                                     height="200"/>
                            </div>
                            <input id="image" name="image" type="file" accept="image/*">

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="firstname">Firstname</label>
                                        <input type="text" class="form-control" id="firstName" value="${user.firstName}"
                                               name="firstName">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="lastname">Lastname</label>
                                        <input type="text" class="form-control" id="lastName" value="${user.lastName}"
                                               name="lastName">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <input type="text" class="form-control" id="address" value="${user.address}"
                                               name="address">
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="phone">Telephone</label>
                                        <input type="text" class="form-control" id="phoneNumber" value="${user.phoneNumber}"
                                               name="phoneNumber">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="text" class="form-control" id="email" value="${user.email}"
                                               name="email">
                                    </div>
                                </div>
                                <div class="col-sm-12 text-center" style="padding-bottom: 30px;">
                                    <button type="button" onclick="Account.changeInformation()" class="btn btn-primary">
                                        <i
                                                class="fa fa-save"></i> Save changes
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
            </div>
        </div>

    </div>
    <!-- /.container -->
</div>

<!-- End content -->


<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/user/common/js.jsp"></jsp:include>
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#avatar').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#image").change(function () {
        readURL(this);
        console.log(this.files[0])
    });
</script>

</body>
</html>