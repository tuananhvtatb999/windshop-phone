<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="com.windshop.phone.entity.User"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!
    public String getUserLogined() {
        String name = "";
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            name = ((User)principal).getUsername();
        }
        return name;
    }
%>
<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/user/account"><i class="fa fa-user"></i> My Account</a></li>
                        <li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/cart"><i class="fa fa-user"></i> My Cart</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/checkout"><i class="fa fa-user"></i> Checkout</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="header-right">
                    <ul class="list-unstyled list-inline">
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li style="font-weight: bold">
                                Hi, ${pageContext.request.userPrincipal.name}
                            </li>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <li><a href="${pageContext.request.contextPath}/sign-in"><i class="fa fa-user"></i> Login</a></li>
                        </c:if>
                        <span>|</span>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li style="font-weight: bold">
                            <a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->
<div class="site-branding-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="logo">
                    <h1><a href="${pageContext.request.contextPath}/home"><img src="/img/logo1.jpg"></a></h1>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="shopping-item">
                    <a href="${pageContext.request.contextPath}/user/cart">Cart<i class="fa fa-shopping-cartDto"></i> <span id="thong_tin_gio_hang" class="product-count">${SL_SP_GIO_HANG != null? SL_SP_GIO_HANG : 0}</span></a>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End site branding area -->