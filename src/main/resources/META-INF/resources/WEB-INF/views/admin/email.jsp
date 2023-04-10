<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="utf-8">
<title>Email</title>
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
								<h4 class="mb-0 font-size-18">Liên hệ</h4>
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
<%--											<form method="get" action="${pageContext.request.contextPath}/admin/list-products">--%>
<%--												<div class="position-relative" id="position-relative">--%>
<%--													<input type="text" class="form-control"--%>
<%--														placeholder="Search..." id="search" name="search"> --%>
<%--														<i--%>
<%--														class="bx bx-search-alt search-icon"></i>--%>
<%--												</div></form>--%>
											</div>
										</div>

									</div>

									<div class="table-responsive">
										<table class="table table-centered table-nowrap">
											<thead class="thead-light">
												<tr>
													<th>Người gửi</th>
													<th>Số điện thoại/Email</th>
													<th>Ghi chú</th>
													<th>Ngày gửi</th>
													<th>Xóa</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="contact" items="${contacts}" varStatus="i">
													<tr>
														<td><span id="title">${contact.name}</span></td>
														<td>${contact.email}</td>
														<td>${contact.message }</td>
														<fmt:parseDate value="${contact.createdDate}" type="date"
																	   pattern="yyyy-MM-dd" var="parsedDate"/>
														<fmt:formatDate value="${parsedDate}" var='updateFormat' type='date'
																		pattern='dd-MM-yyyy'/>
														<td>${updateFormat}</td>
														<td> <a
															class="text-danger" data-toggle="modal"
															data-placement="top" title="" data-original-title="Xóa"
															data-target="#exampleModal-${contact.id}"><i
																class="mdi mdi-close font-size-18"></i></a>

															<div class="modal fade" id="exampleModal-${contact.id}" tabindex="-1"
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
																			<form action="${pageContext.request.contextPath}/admin/email?id=${contact.id }" method="post">
																				<button type="submit"
																				class="btn btn-primary">OK</button><input type="hidden" name="id" value="${contact.id }">
																			</form>
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Cancel</button>
																				
																		</div>
																	</div>
																</div>
															</div></td>
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
						<div class="col-sm-6">
							<div class="text-sm-right d-none d-sm-block">Design &
								Develop by Themesbrand</div>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>
		<!-- Footer End-->

	</div>
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
				window.location.href = "${pageContext.request.contextPath}/admin/brands?page=" + page;
			});
		});
	</script>
</body>
</html>