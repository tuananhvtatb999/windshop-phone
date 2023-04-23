<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <jsp:include page="/WEB-INF/views/admin/common/css.jsp"></jsp:include>
</head>
<body data-sidebar="dark">

<!-- Begin page -->
<div id="layout-wrapper">

    <jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>

    <!-- ========== Left Sidebar Start ========== -->
    <jsp:include page="/WEB-INF/views/admin/common/menu.jsp"></jsp:include>
    <!-- Left Sidebar End -->

    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div
                                class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Danh sách sản phẩm bán chạy</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a
                                            href="javascript: void(0);">Sản phẩm</a></li>
                                    <li class="breadcrumb-item active">Danh sách sản phẩm bán chạy</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
<%--                                <div class="row mb-2">--%>
<%--                                    <div class="col-sm-4">--%>
<%--                                        <div class="search-box mr-2 mb-2 d-inline-block">--%>
<%--                                            <form method="get"--%>
<%--                                                  action="${pageContext.request.contextPath}/admin/products">--%>
<%--                                                <div class="position-relative" id="position-relative">--%>
<%--                                                    <input type="text" class="form-control"--%>
<%--                                                           placeholder="Search..." id="search" name="search">--%>
<%--                                                    <i class="bx bx-search-alt search-icon"></i>--%>
<%--                                                </div>--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
                                <h4 class="mb-4 font-size-18">Danh sách sản phẩm bán chạy theo tháng</h4>
                                <div class="table-responsive">
                                    ${message}

                                    <table class="table table-centered table-nowrap">
                                        <thead class="thead-light">
                                        <tr>

                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Hãng</th>
                                            <th>Ngày tạo</th>
                                            <th>Ngày sửa gần nhất</th>
                                            <th>Giá</th>
                                            <th>Giá sale</th>
                                            <th>Số lượng đã bán</th>
                                            <th>Doanh thu</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="product" items="${products}">
                                            <tr>
                                                <td><a href="javascript: void(0);"
                                                       class="text-body font-weight-bold">${product.id }</a></td>
                                                <td><span id="title">${product.title}</span></td>
                                                <td><span id="brand">${product.brand.name}</span></td>
                                                <fmt:parseDate value="${product.createdDate}" type="date"
                                                               pattern="yyyy-MM-dd" var="parsedDate"/>
                                                <fmt:formatDate value="${parsedDate}" var='startFormat' type='date'
                                                                pattern='dd-MM-yyyy'/>
                                                <td>${startFormat}</td>
                                                <fmt:parseDate value="${product.updatedDate}" type="date"
                                                               pattern="yyyy-MM-dd" var="parsedDate"/>
                                                <fmt:formatDate value="${parsedDate}" var='updateFormat' type='date'
                                                                pattern='dd-MM-yyyy'/>
                                                <td>${updateFormat}</td>
                                                <fmt:setLocale value="vi_VN"/>
                                                <td><span><fmt:formatNumber value="${product.price}" type="currency"  currencySymbol="đ"/></span></td>
                                                <td><span><fmt:formatNumber value="${product.priceSale}" type="currency" currencySymbol="đ"/></span></td>
                                                <td>${product.quantitySold}</td>
                                                <td><fmt:formatNumber value="${product.revenuePrice * product.quantitySold}" type="currency"  currencySymbol="đ"/></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <%--                                <div class="row mb-2">--%>
                                <%--                                    <div class="col-sm-4">--%>
                                <%--                                        <div class="search-box mr-2 mb-2 d-inline-block">--%>
                                <%--                                            <form method="get"--%>
                                <%--                                                  action="${pageContext.request.contextPath}/admin/products">--%>
                                <%--                                                <div class="position-relative" id="position-relative">--%>
                                <%--                                                    <input type="text" class="form-control"--%>
                                <%--                                                           placeholder="Search..." id="search" name="search">--%>
                                <%--                                                    <i class="bx bx-search-alt search-icon"></i>--%>
                                <%--                                                </div>--%>
                                <%--                                            </form>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>

                                <%--                                </div>--%>
                                <h4 class="mb-4 font-size-18">Danh sách sản phẩm bán chạy theo năm</h4>
                                <div class="table-responsive">
                                    ${message}

                                    <table class="table table-centered table-nowrap">
                                        <thead class="thead-light">
                                        <tr>

                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Hãng</th>
                                            <th>Ngày tạo</th>
                                            <th>Ngày sửa gần nhất</th>
                                            <th>Giá</th>
                                            <th>Giá sale</th>
                                            <th>Số lượng đã bán</th>
                                            <th>Doanh thu</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="product" items="${productsYear}">
                                            <tr>
                                                <td><a href="javascript: void(0);"
                                                       class="text-body font-weight-bold">${product.id }</a></td>
                                                <td><span>${product.title}</span></td>
                                                <td><span>${product.brand.name}</span></td>
                                                <fmt:parseDate value="${product.createdDate}" type="date"
                                                               pattern="yyyy-MM-dd" var="parsedDate"/>
                                                <fmt:formatDate value="${parsedDate}" var='startFormat' type='date'
                                                                pattern='dd-MM-yyyy'/>
                                                <td>${startFormat}</td>
                                                <fmt:parseDate value="${product.updatedDate}" type="date"
                                                               pattern="yyyy-MM-dd" var="parsedDate"/>
                                                <fmt:formatDate value="${parsedDate}" var='updateFormat' type='date'
                                                                pattern='dd-MM-yyyy'/>
                                                <td>${updateFormat}</td>
                                                <fmt:setLocale value="vi_VN"/>
                                                <td><span><fmt:formatNumber value="${product.price}" type="currency"  currencySymbol="đ"/></span></td>
                                                <td><span><fmt:formatNumber value="${product.priceSale}" type="currency" currencySymbol="đ"/></span></td>
                                                <td>${product.quantitySold}</td>
                                                <td><fmt:formatNumber value="${product.revenuePrice * product.quantitySold}" type="currency"  currencySymbol="đ"/></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <script>document.write(new Date().getFullYear())</script>
                        © Mona.
                    </div>
                    <div class="col-sm-6">
                        <div class="text-sm-right d-none d-sm-block">Design &
                            Develop by TuanAnh
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <!-- end main content-->

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>
    <!-- Footer End-->

</div>
<!-- END layout-wrapper -->


<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<jsp:include page="/WEB-INF/views/admin/common/js.jsp"></jsp:include>
</body>
</html>