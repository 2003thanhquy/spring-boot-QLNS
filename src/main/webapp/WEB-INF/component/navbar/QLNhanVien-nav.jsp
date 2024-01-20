<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>

<nav id="nav">
    <div class="nav-human-infor">
        <div class="" style="text-align: center; z-index: 1;">
            <div class="avatar-container">
                <div class="avatar-nav"></div>
            </div>
            <p class="nav-human-name"></p>
        </div>
    </div>
    <div class="brand-nav">
        <div class="nav-main-brand">
            <div class="brand-logo">
                <img src="<%= request.getContextPath()%>/assets/image/logo.png" alt="" class="brand-logo-image">
                <p class="brand-name">
                    Quản Lý Nhân Sự
                </p>
            </div>
            <p class="brand-describe">
                Công ty 111
            </p>
        </div>

    </div>

    <div class="menu-nav">
        <ul class="nav-list-items">
            <li class="nav-menu-item">
                <a href="<%= request.getContextPath()%>/nhanvien/" class="nav-item-context nav-item--danhsachnhanvien">
                    <i class="fa-solid fa-list icon-menu"></i>
                    <p class="menu-item-text" item-tag="1">Danh sách nhân viên</p>
                </a>
            </li>
            <li class="nav-menu-item">
                <a href="<%= request.getContextPath()%>/nhanvien/themnhanvien" class="nav-item-context nav-item--themnhanvien">
                    <i class="fa-solid fa-plus icon-menu"></i>
                    <p class="menu-item-text" item-tag="2">Thêm nhân viên</p>
                </a>
            </li>
        </ul>
    </div>
</nav>

