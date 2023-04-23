<!doctype html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html lang="en">
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <title>Sign In</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="/login/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/login/css/style.css">
    <link rel="stylesheet" href="/login/css/light-bootstrap-dashboard.css">
</head>
<body>
<div class="main">
    <!-- Sing in  Form -->
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <div class="signin-image">
                    <figure><img src="/login/images/signin-image.jpg" alt="sing up image"></figure>
                    <a href="${pageContext.request.contextPath}/sign-up" class="signup-image-link">Create an account</a>
                </div>

                <div class="signin-form">
                    <h2 class="form-title">Sign in</h2>
                    <form method="POST" action="<c:url value='/sign-in'/>" class="register-form" id="login-form">
                        <div class="form-group ${error != null ? 'has-error' : ''}">
                            <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="username" id="username" placeholder="Your Mail"/>
                        </div>
                        <div class="form-group">
                            <label for="password"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="password" id="password" placeholder="Password"/>
                        </div>
                        <span>${error}</span>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="form-group">
                            <input type="checkbox" name="remember-me" id="remember-me" class="agree-term"/>
                            <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember
                                me</label>
                            <a style="margin-left: 25px;" href="${pageContext.request.contextPath}/forgot-password">Forgot your password?</a>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                        </div>
                    </form>
                    <div class="social-login">
<%--                        <span class="social-label">Or login with</span>--%>
                        <ul class="socials">
<%--                            <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>--%>
<%--                            <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>--%>
<%--                            <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>--%>
                                <li><a href="${pageContext.request.contextPath}/home">Without Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>

<!-- JS -->
<script src="/login/vendor/jquery/jquery.min.js"></script>
<script src="/login/js/main.js"></script>
<jsp:include page="/WEB-INF/views/user/common/js.jsp"></jsp:include>

<script type="text/javascript">
    <% if (request.getAttribute("message").equals("success")) { %>
    showNotification('top','right','Registration success!', 1);
    <% } %>
</script>
</body>
</html>
