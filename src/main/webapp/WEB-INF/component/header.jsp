<%@ page import="com.qlns.model.TaiKhoan" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<header id="header">
    <ul class="header-list-items">
        <li class="header-item header-item-withHover">
            <a href="<%= request.getContextPath()%>/nhanvien/" class="header-item-context header-item-context--nhanvien">Nhân viên</a>
        </li>
        <li class="header-item header-item-withHover">
            <a href="<%= request.getContextPath()%>/phongban/" class="header-item-context header-item-context--phongban">Phòng ban</a>
        </li>
        <li class="header-item header-item-withHover">
            <a href="<%= request.getContextPath()%>/chinhanh/" class="header-item-context header-item-context--chinhanh">Chi nhánh</a>
        </li>
        <li class="header-item header-item-account" >
            <div class="header-item-account--container " >
                <div class="header-account" >
                    <p class="account-text">Tài khoản</p>
                    <img src="<%= request.getContextPath()%>/assets/image/userlogin.png" alt="" class = "account-image">
                </div>
                <div class="header-deltail-container" tabindex="0">
                    <ul class="header-deltail-list-tiems">
                        <li class="header-detail-item">
                            <%
                                TaiKhoan tk=  (TaiKhoan)session.getAttribute("account");

                            %>
                            <a href="<%=request.getContextPath()+"/nhanvien/thongtin?manv="+tk.getMaNV()%>" class="detail-item--context">
                                Quản lý thông tin cá nhân
                            </a>
                        </li>
                        <li class="header-detail-item">
                            <a href="<%=request.getContextPath()%>/taikhoan/thongtin" class="detail-item--context">
                                Đổi mật khẩu
                            </a>
                        </li>
                        <li class="header-detail-item">
                            <a href="<%=request.getContextPath()%>/logout" class="detail-item--context">
                                Đăng xuất
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="header-item header-item--more-item">
            <i class="fa-solid fa-bars header-more-item"></i>
        </li>
    </ul>
    <div class="more-options-managing">
        <img src="<%=request.getContextPath()%>/assets/image/close-button.png" alt="" class="close-button">
        <ul class="list-items--more-managing">
            <li class="item--more-managing">
                <a href="<%=request.getContextPath()%>/nhanvien/duan" class="more-managing--context">
                    Quản lý dự án
                </a>
            </li>
            <li class="item--more-managing">
                <a href="<%=request.getContextPath()%>/nhanvien/hopdong" class="more-managing--context">
                    Quản lý hợp đồng
                </a>
            </li>
            <li class="item--more-managing">
                <a href="<%=request.getContextPath()%>/nhanvien/khenthuongkyluat" class="more-managing--context">
                    Khen thưởng & Kỷ luật
                </a>
            </li>
            <li class="item--more-managing">
                <a href="<%=request.getContextPath()%>/quatrinhcongtac/" class="more-managing--context">
                    Qúa trình công tác
                </a>
            </li>
            <li class="item--more-managing">
                <a href="<%=request.getContextPath()%>/cocaucongty/" class="more-managing--context">
                    Cơ cấu công ty
                </a>
            </li>

        </ul>
    </div>
</header>
