<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>

    <meta charset="utf-8">
    <title>Add Blog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template"
          name="description">
    <meta content="Themesbrand" name="author">
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>

</head>

<body data-sidebar="dark">

<!-- Begin page -->
<div id="layout-wrapper">

    <jsp:include page="/WEB-INF/views/back-end/common/header.jsp"></jsp:include>

    <!-- ========== Left Sidebar Start ========== -->
    <jsp:include page="/WEB-INF/views/back-end/common/menu.jsp"></jsp:include>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div
                                class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Blogs</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a
                                            href="javascript: void(0);">Danh mục</a></li>
                                    <li class="breadcrumb-item active">Thêm blogs</li>
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

                                <h4 class="card-title">Thông tin cơ bản</h4>
                                <p class="card-title-desc">Điền đầy đủ thông tin</p>
                                ${message }
                                <form:form
                                        action="${pageContext.request.contextPath}/admin/add-blogs"
                                        method="post" modelAttribute="blog"
                                        enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="blogTitle">Tiêu đề Blog</label>
                                                <form:input id="blogTitle" name="blogTitle" type="text"
                                                            path="title" class="form-control"/>
                                            </div>

                                            <div class="form-group">
                                                <div>
                                                    <label for="blog_image">Hình ảnh</label>
                                                </div>
                                                <input id="blog_image" name="blog_image" type="file"
                                                       multiple="multiple">
                                            </div>
                                            <div class="form-group">
                                                <label for="productShortDesc">Mô tả ngắn gọn</label>
                                                <form:textarea class="form-control" id="productShortDesc"
                                                               path="description"></form:textarea>
                                            </div>

                                        </div>

                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="productDesc">Nội dung</label>
                                                <form:textarea class="form-control" id="productDesc"
                                                               path="content"></form:textarea>
                                            </div>
                                        </div>


                                    </div>

                                    <button type="submit"
                                            class="btn btn-primary mr-1 waves-effect waves-light">Lưu
                                        thay đổi
                                    </button>
                                    <button type="button" class="btn btn-secondary waves-effect">
                                        <a
                                                href="${pageContext.request.contextPath}/admin/list-products"
                                                class="text-light">Hủy bỏ</a>
                                    </button>
                                </form:form>

                            </div>
                        </div>


                    </div>
                    <!-- end card-->
                    <!-- end row -->
                    <jsp:include page="/WEB-INF/views/back-end/common/footer.jsp"></jsp:include>
                </div>
                <!-- container-fluid -->
            </div>
            <!-- End Page-content -->


        </div>
        <!-- end main content-->

    </div>
    <!-- END layout-wrapper -->

</div>

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>
<jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
<script type="text/javascript">
    $(document).ready(function () {
        $('#productDesc').summernote();
    });
</script>

</body>
</html>