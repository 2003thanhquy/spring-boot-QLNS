<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/common/taglib.jsp"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/component/all_css.jsp"%>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/XemNhanVien.css">
    <title>Quản lý nhân sự</title>
    <style>
        .header-item-context--nhanvien {
            color: var(--color-header-selected);
        }
        .header-item-context--nhanvien:hover {
            color: var(--color-header-selected);
        }
        .nav-item--danhsachnhanvien {
            background-color: var(--backcolor-menu-selected) ;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<div id="main-web" >
    <%@include file="/component/navbar/QLNhanVien-nav.jsp" %>
    <%@include file="/component/header.jsp"%>
    <div id="content">
        <div id="main-content">
            <div class="dsnv-container container-sm">
                <div class="dsnv--main-container">
                    <h2 class="dsnv--heading">DANH SÁCH NHÂN VIÊN</h2>
                    <div class="dsnv--table">
                        <div class="danhsachnhanvien-table-wrapper ">
                            <div class="table-scroll">
                                <table class="danhsachnhanvien-table">
                                    <thead>
                                    <tr>
                                        <th class="column-1"><span class="text ">Mã nhân viên</span></th>
                                        <th class="column-2"><span class="text">Họ và tên</span></th>
                                        <th class="column-3"><span class="text">Chức vụ</span></th>
                                        <th class="column-4"><span class="text">Phòng ban</span></th>
                                        <th class="column-5"><span class="text chitiet-text">Chi tiết</span></th>
                                        <th class="column-6"><span class="text">Xóa</span></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listnv}" var="nhanVien">
                                        <tr>
                                            <td class="column-1">${nhanVien.maNV}</td>
                                            <td class="column-2" >${nhanVien.hoTen}</td>
                                            <td class="column-3" >${nhanVien.tenChucVu}</td>
                                            <td class="column-4">${nhanVien.tenPhongBan}</td>
                                            <td class="column-5"><a href="thongtin?manv=<c:out value='${nhanVien.maNV}' />"><i class="fa-solid fa-eye thongtinnhanvien-icon" data-nhanvien="${nhanVien}"></i></a></td>
                                            <td class="column-6"><i class="fa-solid fa-trash xoanhanvien-icon" data-user-id="<c:out value='${nhanVien.maNV}'/>" onclick="deleteUser('<c:out value='${nhanVien.maNV}'/>')"></i></td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="/component/all_javascript.jsp"%>
<script>
    function deleteUser(manv){
        let url = window.location.href + "xoa";
        jQuery.ajax({
            url: url,
            method: "GET",
            data:{
                manv:manv
            },
            success: function (){
                alert("Xoa thanh cong "+ manv)
                location.reload()
            },
            error: function(){
                console.error("Adding failed!")
            }
        })
    }
</script>
</body>
</html>