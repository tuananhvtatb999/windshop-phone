<!doctype html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html lang="en">
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <title>Sign Up</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="/login/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/login/css/style.css">
</head>
<body>
<div class="main">

    <!-- Sign up form -->
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Sign up</h2>
                    <form:form method="POST" modelAttribute="userForm" class="register-form" id="register-form"
                               action="${pageContext.request.contextPath}/sign-up">
<%--                        <div class="form-group">--%>
<%--                            <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>--%>
<%--                            <input type="text" name="name" id="name" placeholder="Your Name"/>--%>
<%--                        </div>--%>
                        <spring:bind path="firstName">
                            <div style="${status.error ? 'position: relative' : 'margin-bottom:25px'}">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label for="firstName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input type="text" name="firstName" id="firstName" placeholder="Your First Name" path="firstName"/>
                            </div>
                            <form:errors path="firstName" cssStyle="color: red ;position: absolute;bottom: -75%;"/></div>
                        </spring:bind>
                        <spring:bind path="lastName">
                            <div style="${status.error ? 'position: relative' : 'margin-bottom:25px'}">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label for="lastName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <form:input type="text" name="lastName" id="lastName" placeholder="Your Last Name" path="lastName"/>
                                </div>
                                <form:errors path="lastName" cssStyle="color: red ;position: absolute;bottom: -75%;"/></div>
                        </spring:bind>
                        <spring:bind path="email">
                        <div style="${status.error ? 'position: relative' : 'margin-bottom:25px'}">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label for="email"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input type="text" name="email" id="email" placeholder="Your Mail" path="email"/>
                            </div>
                            <form:errors path="email" cssStyle="color: red ;position: absolute;bottom: -70%;"/>
                    </div>
                        </spring:bind>
                        <spring:bind path="password">
                            <div style="${status.error ? 'position: relative' : 'margin-bottom:25px'}">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <form:input type="password" name="password" path="password" placeholder="Password"/>
                            </div>
                            <form:errors path="password" cssStyle="color: red ;position: absolute;bottom: -70%;"/>
                    </div>
                        </spring:bind>
                        <spring:bind path="rePass">
                            <div style="${status.error ? 'position: relative' : 'margin-bottom:25px'}">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                            <label for="rePass"><i class="zmdi zmdi-lock-outline"></i></label>
                            <form:input type="password" name="rePass" id="rePass" placeholder="Repeat your password" path="rePass"/>
                        </div>
                            <form:errors path="rePass" cssStyle="color: red ;position: absolute;bottom: -70%;"/>
                    </div>
                        </spring:bind>
<%--                        <div class="form-group">--%>
<%--                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term"/>--%>
<%--                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all--%>
<%--                                statements in <a href="#" class="term-service">Terms of service</a></label>--%>
<%--                        </div>--%>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                        </div>
                    </form:form>
                </div>
                <div class="signup-image">
                    <figure><img src="/login/images/sign_in.jpg" alt="sing up image"></figure>
                    <a href="${pageContext.request.contextPath}/sign-in" class="signup-image-link">I am already
                        member</a>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- JS -->
<script src="/login/vendor/jquery/jquery.min.js"></script>
<script src="/login/js/main.js"></script>
</body>
</html>
