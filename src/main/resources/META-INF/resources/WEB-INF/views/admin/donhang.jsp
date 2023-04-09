<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
</head>
<body data-sidebar="dark">

<!-- Begin page -->
<div id="layout-wrapper">

    <jsp:include page="/WEB-INF/views/back-end/common/header.jsp"></jsp:include>

    <!-- ========== Left Sidebar Start ========== -->
    <jsp:include page="/WEB-INF/views/back-end/common/menu.jsp"></jsp:include>
    <!-- Left Sidebar End -->

    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div
                                class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Danh sách đơn hàng</h4>

                            <!-- <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a
                                        href="javascript: void(0);">Sản phẩm</a></li>
                                    <li class="breadcrumb-item active">Danh sách sản phẩm</li>
                                </ol>
                            </div> -->

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <div class="col-sm-4">
                                        <div class="search-box mr-2 mb-2 d-inline-block">
                                            <form method="get"
                                                  action="${pageContext.request.contextPath}/admin/list-orders">
                                                <div class="position-relative" id="position-relative">
                                                    <input type="text" class="form-control"
                                                           placeholder="Search..." id="search" name="search">
                                                    <i class="bx bx-search-alt search-icon"></i>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                </div>

                                <div class="table-responsive">
                                    ${message}
                                    <table class="table table-centered table-nowrap">
                                        <thead class="thead-light">
                                        <tr>

                                            <th>Mã đơn hàng</th>
                                            <th>Ngày tạo</th>
                                            <th>Ngày sửa gần nhất</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                            <th>Xem/ Xóa</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <input type="hidden" value="${order.id } " name="id">
                                            <tr>

                                                <td><a href="javascript: void(0);"
                                                       class="text-body font-weight-bold">${order.code }</a></td>
                                                <fmt:parseDate value="${order.createdDate}" type="date"
                                                               pattern="yyyy-MM-dd" var="parsedDate"/>
                                                <fmt:formatDate value="${parsedDate}" var='startFormat' type='date'
                                                                pattern='dd-MM-yyyy'/>
                                                <td>${startFormat}</td>
                                                <fmt:parseDate value="${order.updatedDate}" type="date"
                                                               pattern="yyyy-MM-dd" var="parsedDate"/>
                                                <fmt:formatDate value="${parsedDate}" var='startFormat' type='date'
                                                                pattern='dd-MM-yyyy'/>
                                                <td>${startFormat}</td>
                                                <td><span>${order.total}</span></td>
                                                <td><c:if test="${order.status == 1 }">
																<span
                                                                        class="badge badge-pill badge-soft-danger font-size-12"><c:out
                                                                        value="Chưa xử lí"/></span>
                                                </c:if> <c:if test="${order.status == 2 }">
																<span
                                                                        class="badge badge-pill badge-soft-primary font-size-12"><c:out
                                                                        value="Đang giao"/></span>
                                                </c:if> <c:if test="${order.status == 3 }">
																<span
                                                                        class="badge badge-pill badge-soft-success font-size-12"><c:out
                                                                        value="Đã hoàn thành"/></span>
                                                </c:if></td>
                                                <td><a class="text-black btn" data-toggle="modal"
                                                       data-placement="top" title="" data-original-title="Xem"
                                                       data-id="${order.id }"
                                                       data-target=".bd-example-modal-lg"><i
                                                        class="mdi mdi-pencil font-size-18"></i></a>


                                                    <div class="modal fade bd-example-modal-lg" tabindex="-1"
                                                         role="dialog" aria-labelledby="myLargeModalLabel"
                                                         id="${order.id }"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <form class="p-5">
                                                                    <div class="form-group">
                                                                        <label for="name">Tên khách hàng:</label> <input
                                                                            type="text" class="form-control"
                                                                            name="name" id="name"
                                                                            value="${order.customerName }">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="email">Địa chỉ email:</label> <input
                                                                            type="email" class="form-control" id="email"
                                                                            name="email" value="${order.customerEmail }"
                                                                            readonly>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="phone">Điện thoại liên hệ:</label>
                                                                        <input
                                                                                type="text" class="form-control"
                                                                                id="phone"
                                                                                name="phone"
                                                                                value="${order.customerPhone }"
                                                                                readonly>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="address">Địa chỉ giao hàng:</label>
                                                                        <input
                                                                                type="text" class="form-control"
                                                                                id="address"
                                                                                name="address"
                                                                                value="${order.customerAddress }"
                                                                                readonly>
                                                                    </div>

                                                                    <fieldset class="form-group">
                                                                        <div class="row">
                                                                            <legend class="col-form-label col-sm-3 pt-0">
                                                                                Trạng
                                                                                thái đơn hàng
                                                                            </legend>
                                                                            <div class="col-sm-9">
                                                                                <c:if test="${order.status ==1 }">
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios"
                                                                                               id="gridRadios1"
                                                                                               value="1" checked> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios1">
                                                                                        Chưa xử lí</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios"
                                                                                               id="gridRadios2"
                                                                                               value="2"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios2">
                                                                                        Đang giao</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios"
                                                                                               id="gridRadios3"
                                                                                               value="3"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios3">
                                                                                        Đã hoàn thành</label>
                                                                                    </div>
                                                                                </c:if>

                                                                                <c:if test="${order.status == 2 }">
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios"
                                                                                               id="gridRadios1"
                                                                                               value="1"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios1">
                                                                                        Chưa xử lí</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios"
                                                                                               id="gridRadios2"
                                                                                               value="2" checked> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios2">
                                                                                        Đang giao</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios"
                                                                                               id="gridRadios3"
                                                                                               value="3"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios3">
                                                                                        Đã hoàn thành</label>
                                                                                    </div>
                                                                                </c:if>

                                                                                <c:if test="${order.status == 3 }">
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios"
                                                                                               id="gridRadios1"
                                                                                               value="1"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios1">
                                                                                        Chưa xử lí</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios"
                                                                                               id="gridRadios2"
                                                                                               value="2"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios2">
                                                                                        Đang giao</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios"
                                                                                               id="gridRadios3"
                                                                                               value="3" checked> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios3">
                                                                                        Đã hoàn thành</label>
                                                                                    </div>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </fieldset>
                                                                    <table class="table table-striped">
                                                                        <thead>
                                                                        <tr>
                                                                            <h3>Sản phẩm</h3>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="col">#</th>
                                                                            <th scope="col">Tên sản phẩm</th>
                                                                            <th scope="col">Hình ảnh</th>
                                                                            <th scope="col">Số lượng</th>
                                                                            <th scope="col">Đơn giá</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <c:forEach items="${order.saleOrderProducts }"
                                                                                   var="item" varStatus="loop">

                                                                            <tr>
                                                                                <th scope="row">${loop.index + 1}</th>
                                                                                <td>${item.product.title }</td>
                                                                                <td><c:forEach var="productImages"
                                                                                               end="0"
                                                                                               items="${item.product.productImages}">
                                                                                    <img
                                                                                            src="../file/upload/${productImages.title}"
                                                                                            width="100px"
                                                                                            height="200px">
                                                                                </c:forEach></td>
                                                                                <td>${item.quality }</td>
                                                                                <td><c:if
                                                                                        test="${item.product.priceSale != null }">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      maxIntegerDigits="13"
                                                                                                      value="${item.price}"/>
                                                                                    đ
                                                                                </c:if> <c:if
                                                                                        test="${item.product.priceSale == null }">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      maxIntegerDigits="13"
                                                                                                      value="${item.price}"/>
                                                                                    đ
                                                                                </c:if></td>
                                                                            </tr>

                                                                        </c:forEach>
                                                                        </tbody>
                                                                    </table>
                                                                    <label class="total text-danger float-right">Tổng
                                                                        tiền : ${order.total }</label>
                                                                    <div class="clearfix"></div>
                                                                    <div class="form-group row clearfix">
                                                                        <div class="col-sm-10">
                                                                            <button type="button" onclick="Order.updateStatus(${order.id})"
                                                                                    class="btn btn-primary">Sửa đổi
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a class="text-danger" data-toggle="modal"
                                                       data-placement="top" title="" data-original-title="Xóa"
                                                       data-target="#exampleModal"><i
                                                            class="mdi mdi-close font-size-18"></i></a>

                                                    <div class="modal fade" id="exampleModal" tabindex="-1"
                                                         role="dialog" aria-labelledby="exampleModalLabel"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Thông
                                                                        báo</h5>
                                                                    <button type="button" class="close"
                                                                            data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">Bạn chắc chắn muốn xóa</div>
                                                                <div class="modal-footer">
                                                                    <button type="button"
                                                                            onclick="Product.deleteOrder(${order.id});"
                                                                            class="btn btn-primary">OK
                                                                    </button>

                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-dismiss="modal">Cancel
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <ul
                                        class="pagination pagination-rounded justify-content-end mb-2">
                                    <li class="page-item disabled"><a class="page-link"
                                                                      href="javascript: void(0);" aria-label="Previous">
                                        <i
                                                class="mdi mdi-chevron-left"></i>
                                    </a></li>
                                    <li class="page-item active"><a class="page-link"
                                                                    href="javascript: void(0);">1</a></li>
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript: void(0);">2</a></li>
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript: void(0);">3</a></li>
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript: void(0);">4</a></li>
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript: void(0);">5</a></li>
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript: void(0);" aria-label="Next"> <i
                                            class="mdi mdi-chevron-right"></i>
                                    </a></li>
                                </ul>
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
                        © Skote.
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <!-- end main content-->

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/back-end/common/footer.jsp" />
    <!-- Footer End-->

</div>
<!-- END layout-wrapper -->


<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<jsp:include page="/WEB-INF/views/back-end/common/js.jsp" />
<script type="text/javascript">
    document.getElementById('search').onkeypress = function (e) {
        if (e.keyCode == 13) {
            document.getElementById('search').click();
        }
    }
</script>
</body>
</html>