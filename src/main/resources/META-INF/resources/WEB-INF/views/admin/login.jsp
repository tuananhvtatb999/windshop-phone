<!doctype html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html lang="en">
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>

<meta charset="utf-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Premium Multipurpose Admin & Dashboard Template"
	name="description">
<meta content="Themesbrand" name="author">
<jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>

</head>
<style>
	body {
	background: #FFFFCC;
	}
}
</style>
<body>
	<div class="account-pages my-5 pt-sm-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 col-lg-6 col-xl-5">
					<div class="card overflow-hidden">
						<div class="card-body pt-0">
							<div class="p-2">

								<form class="form-horizontal"
									action="${pageContext.request.contextPath}/login_perform"
									method="post">
									<h2 class="form-heading text-center">Đăng nhập</h2>
									<c:if test="${not empty param.error}">
										<div class="alert alert-danger" role="alert">Login
											attempt was not successful, try again.</div>
									</c:if>
									<div class="form-group">
										<label for="username">Email</label> <input type="text"
											class="form-control" id="username" name="username"
											placeholder="Nhập email">
									</div>

									<div class="form-group">
										<label for="password">Mật khẩu</label> <input type="password"
											class="form-control" id="password" name="password"
											placeholder="Nhập mật khẩu">
									</div>

									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="customControlInline"> <label
											class="custom-control-label" for="customControlInline">Ghi
											nhớ đăng nhập</label>
									</div>

									<div class="mt-3">
										<button
											class="btn btn-primary btn-block waves-effect waves-light"
											type="submit">Đăng nhập</button>
									</div>

									<div class="mt-4 text-center">
										<a href="auth-recoverpw.html" class="text-muted"><i
											class="mdi mdi-lock mr-1"></i>Quên mật khẩu?</a>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
</body>
</html>
