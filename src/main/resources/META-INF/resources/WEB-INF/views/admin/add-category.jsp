<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

    <meta charset="utf-8">
    <title>Add Category</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template"
          name="description">
    <meta content="Themesbrand" name="author">
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
                            <h4 class="mb-0 font-size-18">Danh Mục</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
                ${message }
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <form:form
                                        action="${pageContext.request.contextPath}/admin/add-category"
                                        method="post" modelAttribute="category">
                                    <div class="form-group">
                                        <label for="name">Tên Danh Mục</label>
                                        <form:input type="text" class="form-control" id="name" path="name"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label for="desc">Mô tả</label>
                                        <form:input type="text" class="form-control" id="description" path="description"></form:input>
                                    </div>
                                    <button type="submit"
                                            class="btn btn-primary mr-1 waves-effect waves-light">Lưu
                                        thay đổi</button>
                                </form:form>
                            </div>
                        </div>


                    </div>
                    <!-- end card-->
                    <!-- end row -->
                    <jsp:include page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>
                </div>
                <!-- container-fluid -->
            </div>
            <!-- End Page-content -->



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