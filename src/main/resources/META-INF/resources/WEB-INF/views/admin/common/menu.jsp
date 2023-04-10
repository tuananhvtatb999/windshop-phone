<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="vertical-menu">

                <div data-simplebar="" class="h-100">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <!-- Left Menu Start -->
                        <ul class="metismenu list-unstyled" id="side-menu">
                            
                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="bx bx-store"></i>
                                    <span>Sản phẩm</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="${pageContext.request.contextPath}/admin/products">Danh sách sản phẩm</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/add-product">Thêm sản phẩm</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/admin/list-orders"><!-- class="has-arrow waves-effect" -->
                                    <i class="fas fa-clipboard-check"></i>
                                    <span>Đơn hàng</span>
                                </a>
                            </li>
							<li>
                                <a href="${pageContext.request.contextPath}/admin/brands">
                                    <i class="fas fa-tag"></i>
                                    <span>Thương hiệu</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/category">
                                    <i class="fas fa-tag"></i>
                                    <span>Danh mục</span>
                                </a>
                            </li>
                            
                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="bx bx-envelope"></i>
                                    <span>Email</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="${pageContext.request.contextPath}/admin/email">Inbox</a></li>
                                    <li><a href="email-read.html">Read Email</a></li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    <!-- Sidebar -->
                </div>
            </div>