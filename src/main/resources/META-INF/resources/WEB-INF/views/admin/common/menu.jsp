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
                                    <span>Quản lí Sản phẩm</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="${pageContext.request.contextPath}/admin/products">Danh sách sản phẩm</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/products-seller">Danh sách sản phẩm bán chạy</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/add-product">Thêm sản phẩm</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/admin/list-orders"><!-- class="has-arrow waves-effect" -->
                                    <i class="fas fa-clipboard-check"></i>
                                    <span>Quản lí Đơn hàng</span>
                                </a>
                            </li>
							<li>
                                <a href="${pageContext.request.contextPath}/admin/brands">
                                    <i class="fas fa-copyright"></i>
                                    <span>Quản lí nhãn hàng</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/category">
                                    <i class="fas fa-tag"></i>
                                    <span>Quản lí danh mục</span>
                                </a>
                            </li>
                            
                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="bx bx-envelope"></i>
                                    <span>Phản hồi khách hàng</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="${pageContext.request.contextPath}/admin/email">Inbox</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/user-management">
                                    <i class="fa fa-user fa-2xl"></i>
                                    <span>Quản lí người dùng</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                    <!-- Sidebar -->
                </div>
            </div>