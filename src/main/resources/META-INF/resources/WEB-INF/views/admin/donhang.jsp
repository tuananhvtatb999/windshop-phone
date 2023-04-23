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
                                            <th>Trạng thái đơn hàng</th>
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
                                                <td><c:if test="${order.statusOrder == 0 }">
																<span
                                                                        class="badge badge-pill badge-soft-danger font-size-12"><c:out
                                                                        value="Đang chuẩn bị"/></span>
                                                </c:if> <c:if test="${order.statusOrder == 1 }">
																<span
                                                                        class="badge badge-pill badge-soft-warning font-size-12"><c:out
                                                                        value="Đang giao"/></span>
                                                </c:if> <c:if test="${order.statusOrder == 2 }">
																<span
                                                                        class="badge badge-pill badge-soft-success font-size-12"><c:out
                                                                        value="Đã hoàn thành"/></span>
                                                </c:if>
                                                    <c:if test="${order.statusOrder == 3 }">
																<span
                                                                        class="badge badge-pill badge-soft-danger font-size-12"><c:out
                                                                        value="Đã huỷ"/></span>
                                                    </c:if>
                                                </td>
                                                <td id="status-delete-${order.id}"><c:if test="${order.status == 0 }">
																<span
                                                                        class="badge badge-pill badge-soft-danger font-size-12"><c:out
                                                                        value="Đơn hàng đã bị xoá"/></span>
                                                </c:if> <c:if test="${order.status == 1 }">
																<span
                                                                        class="badge badge-pill badge-soft-primary font-size-12"><c:out
                                                                        value="Đơn hàng  chưa bị xoá"/></span>
                                                </c:if></td>
                                                <td><a class="text-black btn" data-toggle="modal"
                                                       data-placement="top" title="" data-original-title="Xem"
                                                       data-target="#exampleModal-${order.id }"><i
                                                        class="mdi mdi-pencil font-size-18"></i></a>


                                                    <div class="modal fade bd-example-modal-lg" tabindex="-1"
                                                         role="dialog" aria-labelledby="myLargeModalLabel"
                                                         id="exampleModal-${order.id}"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <form class="p-5">
                                                                    <div class="form-group">
                                                                        <label for="name">Tên khách hàng:</label> <input
                                                                            type="text" class="form-control"
                                                                            name="name" id="name"
                                                                            value="${order.user.firstName} ${order.user.lastName}" readonly>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="email">Địa chỉ email:</label> <input
                                                                            type="email" class="form-control" id="email"
                                                                            name="email" value="${order.user.email }"
                                                                            readonly>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="phone">Điện thoại liên hệ:</label>
                                                                        <input
                                                                                type="text" class="form-control"
                                                                                id="phone"
                                                                                name="phone"
                                                                                value="${order.user.phoneNumber }"
                                                                                readonly>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="address">Địa chỉ giao hàng:</label>
                                                                        <input
                                                                                type="text" class="form-control"
                                                                                id="address"
                                                                                name="address"
                                                                                value="${order.user.address }"
                                                                                readonly>
                                                                    </div>

                                                                    <fieldset class="form-group">
                                                                        <div class="row">
                                                                            <legend class="col-form-label col-sm-3 pt-0">
                                                                                Trạng
                                                                                thái đơn hàng
                                                                            </legend>
                                                                            <div class="col-sm-9">
                                                                                <c:if test="${order.statusOrder == 0 }">
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="0" checked> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios1">
                                                                                        Đang chuẩn bị</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="1"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios2">
                                                                                        Đang giao</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="2"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios3">
                                                                                        Đã hoàn thành</label></div>
                                                                                        <div class="form-check">
                                                                                            <input class="form-check-input"
                                                                                                   type="radio"
                                                                                                   name="gridRadios${order.id}"
                                                                                                   value="3"> <label
                                                                                                class="form-check-label"
                                                                                                for="gridRadios3">
                                                                                            Đã huỷ</label>
                                                                                    </div>
                                                                                </c:if>

                                                                                <c:if test="${order.statusOrder == 1 }">
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="0"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios1">
                                                                                        Đang chuẩn bị</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="1" checked> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios2">
                                                                                        Đang giao</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="2"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios3">
                                                                                        Đã hoàn thành</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="3"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios4">
                                                                                        Đã huỷ</label>
                                                                                    </div>
                                                                                </c:if>

                                                                                <c:if test="${order.statusOrder == 2 }">
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="0"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios1">
                                                                                        Đang chuẩn bị</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="1"> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios2">
                                                                                        Đang giao</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="2" checked> <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios3">
                                                                                        Đã hoàn thành</label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input"
                                                                                               type="radio"
                                                                                               name="gridRadios${order.id}"
                                                                                               value="3" > <label
                                                                                            class="form-check-label"
                                                                                            for="gridRadios4">
                                                                                        Đã huỷ</label>
                                                                                    </div>
                                                                                </c:if>
                                                                                        <c:if test="${order.statusOrder == 3 }">
                                                                                            <div class="form-check">
                                                                                                <input class="form-check-input"
                                                                                                       type="radio"
                                                                                                       name="gridRadios${order.id}"
                                                                                                       value="0"> <label
                                                                                                    class="form-check-label"
                                                                                                    for="gridRadios1">
                                                                                                Đang chuẩn bị</label>
                                                                                            </div>
                                                                                            <div class="form-check">
                                                                                                <input class="form-check-input"
                                                                                                       type="radio"
                                                                                                       name="gridRadios${order.id}"
                                                                                                       value="1"> <label
                                                                                                    class="form-check-label"
                                                                                                    for="gridRadios2">
                                                                                                Đang giao</label>
                                                                                            </div>
                                                                                            <div class="form-check">
                                                                                                <input class="form-check-input"
                                                                                                       type="radio"
                                                                                                       name="gridRadios${order.id}"
                                                                                                       value="2" > <label
                                                                                                    class="form-check-label"
                                                                                                    for="gridRadios3">
                                                                                                Đã hoàn thành</label>
                                                                                            </div>
                                                                                            <div class="form-check">
                                                                                                <input class="form-check-input"
                                                                                                       type="radio"
                                                                                                       name="gridRadios${order.id}"
                                                                                                       value="3" checked> <label
                                                                                                    class="form-check-label"
                                                                                                    for="gridRadios4">
                                                                                                Đã huỷ</label>
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
                                                                                            width="200px"
                                                                                            height="180px">
                                                                                </c:forEach></td>
                                                                                <td>${item.quantity }</td>
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
                                                                        <c:if test="${order.statusOrder != 2 }">
                                                                        <div class="col-sm-10">
                                                                            <button type="button" onclick="Order.updateStatus(${order.id})"
                                                                                    class="btn btn-primary">Sửa đổi
                                                                            </button>
                                                                        </div>
                                                                        </c:if>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a class="text-danger" data-toggle="modal"
                                                       data-placement="top" title="" data-original-title="Xóa"
                                                       data-target="#modalDelete-${order.id}"><i
                                                            class="mdi mdi-close font-size-18"></i></a>

                                                    <div class="modal fade" id="modalDelete-${order.id}" tabindex="-1"
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
                                <nav aria-label="Page navigation" class="mt-3">
                                    <ul class="pagination pagesss" id="pagination"></ul>
                                </nav>
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
    <jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
    <!-- Footer End-->

</div>
<!-- END layout-wrapper -->


<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<jsp:include page="/WEB-INF/views/admin/common/js.jsp" />
<script type="text/javascript">
    document.getElementById('search').onkeypress = function (e) {
        if (e.keyCode == 13) {
            document.getElementById('search').click();
        }
    }
    $(function() {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages : ${total},
            startPage: ${currentPage},
            onPageClick : function(event, page) {
                console.info(page + ' (from options)');
            }
        }).on('page', function(event, page) {
            window.location.href = "${pageContext.request.contextPath}/admin/list-orders?page=" + page;
        });
    });
</script>
</body>
</html>