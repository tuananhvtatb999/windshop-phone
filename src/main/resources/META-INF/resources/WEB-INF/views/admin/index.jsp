.<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

<meta charset="utf-8">
<title>Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Premium Multipurpose Admin & Dashboard Template"
	name="description">
<meta content="Themesbrand" name="author">
<jsp:include page="/WEB-INF/views/admin/common/css.jsp"></jsp:include>
<style>
    .ui-datepicker-calendar {
    display: none;
    }
</style
</head>

<body data-sidebar="dark">

	<!-- Begin page -->

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
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0 font-size-18">Dashboard</h4>

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                            <li class="breadcrumb-item active">Dashboard</li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                            <label for="startDate">Month :</label>
                            <input name="startDate" id="startDate" class="date-picker" />

                        <div class="row">
                            <div class="col-xl-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title mb-4">Monthly Earning</h4>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="text-muted">This month</p>
                                                <h4>${totalMonth} đ</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium">Orders Sold</p>
                                                        <h4 class="mb-0">${quantityOrder}</h4>
                                                    </div>

                                                    <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                        <span class="avatar-title">
                                                            <i class="bx bx-copy-alt font-size-24"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium">Products Sold</p>
                                                        <h4 class="mb-0">${quantityProduct}</h4>
                                                    </div>

                                                    <div class="avatar-sm rounded-circle bg-primary align-self-center mini-stat-icon">
                                                        <span class="avatar-title rounded-circle bg-primary">
                                                            <i class="bx bx-archive-in font-size-24"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- end row -->

<%--                                <div class="card">--%>
<%--                                    <div class="card-body">--%>
<%--                                        <h4 class="card-title mb-4 float-sm-left">Email Sent</h4>--%>
<%--                                        <div class="float-sm-right">--%>
<%--                                            <ul class="nav nav-pills">--%>
<%--                                                <li class="nav-item">--%>
<%--                                                    <a class="nav-link" href="#">Week</a>--%>
<%--                                                </li>--%>
<%--                                                <li class="nav-item">--%>
<%--                                                    <a class="nav-link" href="#">Month</a>--%>
<%--                                                </li>--%>
<%--                                                <li class="nav-item">--%>
<%--                                                    <a class="nav-link active" href="#">Year</a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                        </div>--%>
<%--                                        <div class="clearfix"></div>--%>
<%--                                        <div id="stacked-column-chart" class="apex-charts" dir="ltr"></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                        <!-- end row -->

                        <!-- end row -->

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-centered table-nowrap">
                                                <thead class="thead-light">
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Ngày tạo</th>
                                                    <th>Ngày sửa gần nhất</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Trạng thái đơn hàng</th>
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
		</div>
		
		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>
		<!-- Footer End-->

	<!-- END layout-wrapper -->



	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>

	<jsp:include page="/WEB-INF/views/admin/common/js.jsp"></jsp:include>
    <script type="text/javascript">
        $(function() {
            window.pagObj = $('#pagination').twbsPagination({
                totalPages : ${total},
                startPage: ${currentPage},
                onPageClick : function(event, page) {
                    console.info(page + ' (from options)');
                }
            }).on('page', function(event, page) {
                window.location.href = "${pageContext.request.contextPath}/admin?page=" + page;
            });

            $('.date-picker').datepicker(
                                        {
                                            dateFormat: "mm/yy",
                                            changeMonth: true,
                                            changeYear: true,
                                            showButtonPanel: true,
                                            onClose: function(dateText, inst) {


                                                function isDonePressed(){
                                                    return ($('#ui-datepicker-div').html().indexOf('ui-datepicker-close ui-state-default ui-priority-primary ui-corner-all ui-state-hover') > -1);
                                                }

                                                if (isDonePressed()){
                                                    var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                                                    var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                                                    $(this).datepicker('setDate', new Date(year, month, 1)).trigger('change');

                                                     $('.date-picker').focusout()//Added to remove focus from datepicker input box on selecting date
                                                }
                                            },
                                            beforeShow : function(input, inst) {

                                                inst.dpDiv.addClass('month_year_datepicker')

                                                if ((datestr = $(this).val()).length > 0) {
                                                    year = datestr.substring(datestr.length-4, datestr.length);
                                                    month = datestr.substring(0, 2);
                                                    $(this).datepicker('option', 'defaultDate', new Date(year, month-1, 1));
                                                    $(this).datepicker('setDate', new Date(year, month-1, 1));
                                                    $(".ui-datepicker-calendar").hide();
                                                }
                                            }
                                        })
        });
    </script>

</body>
</html>