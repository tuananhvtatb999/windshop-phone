<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

<meta charset="utf-8">
<title>Update Product</title>
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
								<h4 class="mb-0 font-size-18">Sửa Sản Phẩm</h4>

								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">Danh mục</a></li>
										<li class="breadcrumb-item active">Sửa sản phẩm</li>
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
									<form:form
										action="${pageContext.request.contextPath}/admin/update-product"
										method="post" modelAttribute="product"
										enctype="multipart/form-data">
										<div class="row">
											<div class="col-sm-6">
												<form:hidden path="id" />
												<div class="form-group">
													<label for="productname">Tên sản phẩm</label>
													<form:input id="productname" name="productname" type="text"
														path="title" class="form-control" />
												</div>
												<div class="form-group">
													<label>Hãng sản xuất</label>
													<form:select class="form-control form-control-line"
														path="brand.id">
														<form:options items="${brands}" itemValue="id"
															itemLabel="name" />
													</form:select>
												</div>
												<div class="form-group">
													<label for="price">Giá</label>
													<form:input id="price" name="price" type="text"
														class="form-control" path="price" />
												</div>
												<div class="form-group">
													<label for="price_sale">Giá giảm</label>
													<form:input id="price_sale" name="price_sale" type="text"
														class="form-control" path="priceSale" />
												</div>
												<div class="form-group">
													<label for="quantity">Số lượng</label>
													<form:input id="quantity" name="quantity" type="text"
																class="form-control" path="quantity" />
												</div>

											</div>

											<div class="col-sm-6">
												<div class="form-group">
													<label>Danh mục</label>
													<form:select class="form-control form-control-line"
														path="category.id">
														<form:options items="${categories}" itemValue="id"
															itemLabel="name" />
													</form:select>
												</div>
												<div class="form-group">
													<div>
														<label for="productImage">Hình ảnh</label>
													</div>
													<input name="product_images" type="file"
														multiple="multiple">
												</div>
												<div class="form-group">
													<label for="shortDes">Giới thiệu sản phẩm</label>
													<form:textarea class="form-control" id="productShortDesc"
														name="shortDes" path="shortDes"></form:textarea>
												</div>
												<div class="form-group">
													<label for="shortDetails">Mô tả sản phẩm</label>
													<form:textarea class="form-control" id="productDesc" name="shortDetails"
														path="shortDetails"></form:textarea>
												</div>



											</div>
										</div>

										<button type="submit"
											class="btn btn-primary mr-1 waves-effect waves-light">Lưu
											thay đổi</button>
										<button type="button" class="btn btn-secondary waves-effect">
											<a
												href="${pageContext.request.contextPath}/admin/products"
												class="text-light">Hủy bỏ</a>
										</button>
									</form:form>

								</div>
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

	</div>
	<!-- END layout-wrapper -->

	</div>

	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>
	<jsp:include page="/WEB-INF/views/admin/common/js.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#productDesc').summernote();
		});
	</script>

</body>
</html>
