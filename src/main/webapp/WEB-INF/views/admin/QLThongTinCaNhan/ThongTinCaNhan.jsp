<%@ page import="com.qlns.model.Thongtinnhanvien" %><%--
Created by IntelliJ IDEA.
User: Dell
Date: 12/7/2023
Time: 2:35 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="/component/all_css.jsp" %>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/thongtincanhan.css">
    <title>Quản lý nhân sự</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<div id="main-web">

    <% TaiKhoan tkdangnhap = (TaiKhoan)session.getAttribute("account");
        Thongtinnhanvien nhanvienhienthi = (Thongtinnhanvien)request.getAttribute("ttnv");
    %>
    <div class="quatrinhcontac-container ">
        <div class="quatrinhcongtac--content">
            <div class="quatrinhcontac-heading--container">
                <h2 class="quatrinhcongtac-heading--text">QUÁ TRÌNH CÔNG TÁC</h2>
                <button class="quatrinhcontac--closebutton btn btn-danger"><i class="fa-solid fa-xmark"></i></button>
            </div>
            <div class="qtct-maincontent--container">
                <div class="qtct-tt--element">
                    <label for="qtct-tt--idnhanvien" class="qtct-tt-label">Mã nhân viên:</label>
                    <span class="qtct-tt--text" id="qtct-tt--idnhanvien"><%=nhanvienhienthi.getMaNV()%></span>
                </div>
                <div class="qtct-tt--element">
                    <label for="qtct-tt--tennhanvien" class="qtct-tt-label">Họ và tên:</label>
                    <span class="qtct-tt--text" id="qtct-tt--tennhanvien"><%=nhanvienhienthi.getHoTen()%></span>
                </div>
                <div class="qtct-tt-table--container">
                    <h2 class="qtct-tt-headingtable">Quá trình công tác</h2>
                    <div class="qtct-tt-table--content">
                        <table>
                            <thead>
                            <tr>
                                <th>Nội dung</th>
                                <th>Ngày bắt đầu</th>
                                <th>Tên chức vụ</th>
                            </tr>
                            </thead>
                            <tbody id="dataquatrinhcongtac" >
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/component/navbar/NoneMenu-nav.jsp" %>
    <%@include file="/component/header.jsp" %>
    <div id="content">
        <div id="main-content">
            <div class="container-sm content-container">
                <div class="thongtin-container">
                    <h1 class="thongtin-header">THÔNG TIN CÁ NHÂN</h1>
                    <div class="thongtin-content">
                        <div class="formthongtin-container">
                            <form class="formthongtin" action="" method="post" enctype="multipart/form-data">
                                <div class="thongtin-input-element--container container">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="thongtin-avatar-container ">
                                                <div id="thongtin-imageContainer-avatar">
                                                    <c:if test="${!empty ttnv.hinhAnh}">
                                                        <img class="thongtin-image-avatar"
                                                             src="<%= request.getContextPath()%>/uploads/${ttnv.hinhAnh}"/>
                                                    </c:if>
                                                </div>
                                                <label class="thongtin-avatar--label" for="thongtin-fileInput-avatar">Đổi ảnh đại diện</label>
                                                <input class="btn btn-outline-info" type="file"
                                                       id="thongtin-fileInput-avatar" name="image" accept="image/*">
                                            </div>
                                        </div>
                                        <div class="col-8 container">
                                            <div class="row">
                                                <div class="col-9">
                                                    <div class="cntt-container">
                                                        <div class="thongtin-input-elements">
                                                            <div class="thongtin-input--container">
                                                                <label class="thongtin-input--label" for="thongtin-input-hoten">Họ
                                                                    và tên</label>
                                                                <input class="thongtin-input--element" value="${ttnv.hoTen}"
                                                                       name="tnv-hovaten" id="thongtin-input-hoten">
                                                            </div>
                                                            <div class="thongtin-input--container">
                                                                <label class="thongtin-input--label"
                                                                       for="thongtin-input-cccd">CCCD/CMND</label>
                                                                <input class="thongtin-input--element" value="${ttnv.cccd}"
                                                                       name="tnv-cmnd" id="thongtin-input-cccd">
                                                            </div>
                                                            <div class="thongtin-input--container">
                                                                <label class="thongtin-input--label"
                                                                       for="thongtin-input-diachi">Địa chỉ</label>
                                                                <input class="thongtin-input--element" value="${ttnv.diaChi}"
                                                                       name="tnv-diachi" id="thongtin-input-diachi">
                                                            </div>
                                                            <div class="thongtin-input--container">
                                                                <label class="thongtin-input--label" for="thongtin-input-sdt">Số
                                                                    điện thoại</label>
                                                                <input class="thongtin-input--element"
                                                                       value="${ttnv.soDienThoai}" name="tnv-sdt"
                                                                       id="thongtin-input-sdt">
                                                            </div>
                                                            <div class="thongtin-input--container">
                                                                <label class="thongtin-input--label"
                                                                       for="thongtin-input-ngaysinh">Ngày sinh</label>
                                                                <input class="thongtin-input--element" type="date"
                                                                       value="${ttnv.namSinh}" name="tnv-ngaysinh"
                                                                       id="thongtin-input-ngaysinh">
                                                            </div>
                                                            <div class="thongtin-input--container">
                                                                <label class="thongtin-input-text ">Giới tính</label>
                                                                <div class="thongtin-gioitinh-radiobutton">
                                                                    <label class="thongtin-gioitinh-text">
                                                                        <input type="radio" name="gender" id="nam" value="Nam"
                                                                               <c:if test="${ttnv.gioiTinh eq 'Nam'}">checked</c:if>>
                                                                        Nam
                                                                    </label>
                                                                    <label class="thongtin-gioitinh-text"
                                                                           style="margin-left: 8px">
                                                                        <input type="radio" name="gender" id="nu" value="Nữ"
                                                                               <c:if test="${ttnv.gioiTinh eq 'Nữ'}">checked</c:if> >
                                                                        Nữ
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="thongtin-input--container">
                                                                <label class="thongtin-input--label"
                                                                       for="thongtin-input-phongban">Phòng ban</label>
                                                                <select class="thongtin-input--element"
                                                                        id="thongtin-input-phongban" name="tnv-maphongban">
                                                                    <c:forEach items="${lstPB}" var="pb">
                                                                        <option value="${pb.maPB}"
                                                                                <c:if test="${pb.maPB eq ttnv.maPB}">selected</c:if>>${pb.tenPB}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="thongtin-input--container">
                                                                <label class="thongtin-input--label"
                                                                       for="thongtin-input-bacluong">Bậc lương</label>
                                                                <select class="thongtin-input--element"
                                                                        id="thongtin-input-bacluong" name="tnv-idbacluong">
                                                                    <c:forEach items="${lstLuong}" var="l">
                                                                        <option value="${l.idBacLuong}"
                                                                                <c:if test="${l.idBacLuong eq ttnv.bacLuong}">selected</c:if>>${l.idBacLuong}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="thongtin-input--container">
                                                                <label class="thongtin-input--label"
                                                                       for="thongtin-input-chucvu">Chức vụ</label>
                                                                <select class="thongtin-input--element"
                                                                        id="thongtin-input-chucvu" name="tnv-idchucvu">
                                                                    <c:forEach items="${lstCV}" var="cv">
                                                                        <option value="${cv.idChucVu}"
                                                                                <c:if test="${cv.tenChucVu eq ttnv.tenChucVu}">selected</c:if>>${cv.tenChucVu}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="thongtin-input--container">
                                                                <label class="thongtin-input--label"
                                                                       for="thongtin-input-trinhdo">Trình độ</label>
                                                                <select class="thongtin-input--element"
                                                                        id="thongtin-input-trinhdo" name="tnv-idtrinhdo">
                                                                    <c:forEach items="${lstTD}" var="td">
                                                                        <option value="${td.idTrinhDo}"
                                                                                <c:if test="${td.tenTrinhDo eq ttnv.tenTrinhDo}">selected</c:if>>${td.tenTrinhDo}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="  btn btn-warning" id="btnUpdate"
                                                             onclick="UpdateNV()">Chỉnh sửa thông tin
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="final-container">
                                                        <div class="thongtin-more--button">
                                                            <div class="thongtin-more-button--container">
                                                                <i class="thongtin-more--icon fa-solid fa-ellipsis-vertical"></i>
                                                                <div class="more-icon--menu">
                                                                    <ul class="list-more--menu">
                                                                        <li class="more-menu--item qtct-item">Quá trình công tác</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thongtin-button--container">
                                                            <button class="thongtin-button btn btn-danger" id="btnCancel"
                                                                    onclick="CancelNV()">Hủy
                                                            </button>
                                                            <button type="submit" class="thongtin-button btn btn-success "
                                                                    id="btnConfirm" onclick="Confirm()">Xác nhận

                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/component/all_javascript.jsp" %>





<script>
    <%--    Hiển thị quá trình công tác--%>
    var qtct_iem = $(".qtct-item");
    var qtct_container = $(".quatrinhcontac-container");
    var qtct_closebtn = $(".quatrinhcontac--closebutton")
    var qtct = '<%=nhanvienhienthi.getMaNV()%>'
    qtct_iem.addEventListener("click", e=>{
        jQuery.ajax({
            type: "GET",
            url: "${request.getContextPath()}/QLNhanSu_war_exploded/quatrinhcongtac/xemcongtacbanthan",
            data: {
                MaNV: qtct
            },
            success: function(data) {
                document.getElementById("dataquatrinhcongtac").innerHTML=data;


            },
            error: function(error) {
                console.log(error);
            }
        });
        qtct_container.classList.add("hienthi");
    });
    qtct_closebtn.addEventListener("click", e =>{
        qtct_container.classList.remove("hienthi");
    })
    <%--    Hiển thị quá trình công tác--%>

    var isUserRoleAdmin = <%= tkdangnhap.getUserRole().equals("admin") %>;


    var hinhanh = document.getElementById("thongtin-fileInput-avatar")
    var hoten = document.getElementById("thongtin-input-hoten")
    var cccd = document.getElementById("thongtin-input-cccd")
    var diachi = document.getElementById("thongtin-input-diachi")
    var sdt = document.getElementById("thongtin-input-sdt")
    var ngaysinh = document.getElementById("thongtin-input-ngaysinh")
    var gerder_nam = document.getElementById("nam");
    var gender_nu = document.getElementById("nu");
    var phongbang = document.getElementById("thongtin-input-phongban")
    var bacluong = document.getElementById("thongtin-input-bacluong")
    var chucvu = document.getElementById("thongtin-input-chucvu")
    var trinhdo = document.getElementById("thongtin-input-trinhdo")
    var isNhanVien;
    if (!isUserRoleAdmin) {
        isNhanVien = <%= nhanvienhienthi.getMaNV().equals(tkdangnhap.getMaNV()) %>;
        if (! isNhanVien )
        {
            document.getElementById("btnUpdate").style.display = "none";
            document.querySelector(".thongtin-button--container").style.display= "none";
        }
    }






    var btnUpdate = document.getElementById("btnUpdate")
    var btnCancel = document.getElementById("btnCancel")
    var btnConfirm = document.getElementById("btnConfirm")

    hinhanh.disabled = true
    hoten.disabled = true
    cccd.disabled = true
    diachi.disabled = true
    sdt.disabled = true
    ngaysinh.disabled = true
    gerder_nam.disabled = true
    gender_nu.disabled = true
    phongbang.disabled = true
    bacluong.disabled = true
    chucvu.disabled = true
    trinhdo.disabled = true
    btnConfirm.disabled = true;

    function UpdateNV() {

        hinhanh.disabled = false;
        hoten.disabled = false
        cccd.disabled = false
        diachi.disabled = false
        sdt.disabled = false
        ngaysinh.disabled = false
        gerder_nam.disabled = false
        gender_nu.disabled = false
        phongbang.disabled = false
        bacluong.disabled = false
        chucvu.disabled = false
        trinhdo.disabled = false
        btnConfirm.disabled = false;
        if (!isUserRoleAdmin)
        {
            hoten.disabled = true
        cccd.disabled = true
        ngaysinh.disabled = true
        gerder_nam.disabled = true
        gender_nu.disabled = true
        phongbang.disabled = true
        bacluong.disabled = true
        chucvu.disabled = true
            trinhdo.disabled = true;
         }


    }

    function Confirm()
    {
            hinhanh.disabled = false;
            hoten.disabled = false
            cccd.disabled = false
            diachi.disabled = false
            sdt.disabled = false
            ngaysinh.disabled = false
            gerder_nam.disabled = false
            gender_nu.disabled = false
            phongbang.disabled = false
            bacluong.disabled = false
            chucvu.disabled = false
            trinhdo.disabled = false
    }

    document.getElementById('thongtin-fileInput-avatar').addEventListener('change', function (event) {
        const selectedImage = event.target.files[0];
        if (selectedImage) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const imageElement = document.createElement('img');
                imageElement.classList.add("thongtin-image-avatar");
                imageElement.src = e.target.result;
                const imageContainer = document.getElementById('thongtin-imageContainer-avatar');
                imageContainer.innerHTML = '';
                imageContainer.appendChild(imageElement);
            };
            reader.readAsDataURL(selectedImage);
        }
    });



</script>
</body>
</html>
