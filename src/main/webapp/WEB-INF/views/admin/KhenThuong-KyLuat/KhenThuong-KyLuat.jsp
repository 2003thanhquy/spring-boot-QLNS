<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.qlns.model.TaiKhoan" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/component/all_css.jsp"%>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/KhenThuong_KyLuat.css">
    <title>Quản lý nhân sự</title>
    <style>
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
<div id="main-web" >
    <%@include file="/component/navbar/NoneMenu-nav.jsp"%>
    <%@include file="/component/header.jsp"%>
    <div id="content">
        <div id="main-content">
            <div class="tk-container container-lg">
                <div class="row">
                    <div class="col-sm-12 col-xl-8">
                        <div class="ktkl--container">
                            <h2 class="ktkl--heading" style="text-align: center">DANH SÁCH CHƯƠNG TRÌNH</h2>
                            <div class="ktkl--content">
                                <div class="table100 ver4 m-b-110">
                                    <div class="table100-head">
                                        <table>
                                            <thead>
                                            <tr class="row100 head">
                                                <th class="cell100 column1">Id</th>
                                                <th class="cell100 column2">Nội dung</th>
                                                <th class="cell100 column3">Ngày</th>
                                                <th class="cell100 column4">Số KT_KL</th>
                                                <th class="cell100 column5">Phân loại</th>
                                                <th class="cell100 column6">Mã nhân viên</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="table100-body js-pscroll">
                                        <table id="tbl-ktkl">
<%--                                            <tbody>--%>
<%--                                            <c:forEach items="${lstKtkl}" var="ktkl">--%>
<%--                                                <tr class="row100 body" onclick="handleItemClick('${ktkl.id}','${ktkl.noiDung}','${ktkl.getNgay()}','${ktkl.soKT_KL}','${ktkl.loai}','${ktkl.maNV}')">--%>
<%--                                                    <td class="cell100 column1">${ktkl.id}</td>--%>
<%--                                                    <td class="cell100 column3">${ktkl.noiDung}</td>--%>
<%--                                                    <td class="cell100 column3">${ktkl.getNgay()}</td>--%>
<%--                                                    <td class="cell100 column4">${ktkl.soKT_KL}</td>--%>
<%--                                                    <td class="cell100 column5">${ktkl.loai}</td>--%>
<%--                                                    <td class="cell100 column5">${ktkl.maNV}</td>--%>
<%--                                                </tr>--%>
<%--                                            </c:forEach>--%>
<%--                                            </tbody>--%>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-4">
                        <div class="ktkl-dsct--container">
                            <h2 class="ktkl-dsct--heading" style="text-align: center">THÔNG TIN CHI TIẾT</h2>
                            <div class="ktkl-dsct--content">
                                <form action="" >
                                    <div class="ktkl-dsct-inputs">
                                        <div class="ktkl-dsct--input">
                                            <label class="ktkl-dsct--label" for="ktkl-dsct--id">ID</label>
                                            <input type="text" class="ktkl-dsct--input_element" id="ktkl-dsct--id" name="tk-tttk--id">
                                        </div>
                                        <div class="ktkl-dsct--input">
                                            <label class="ktkl-dsct--label" for="ktkl-dsct--noidung">Nội dung</label>
                                            <input type="text" class="ktkl-dsct--input_element" id="ktkl-dsct--noidung" name="ktkl-dsct--noidung">
                                        </div>
                                        <div class="ktkl-dsct--input">
                                            <label class="ktkl-dsct--label" for="ktkl-dsct--ngayapdung">Ngày áp dụng</label>
                                            <input type="text" class="ktkl-dsct--input_element" id="ktkl-dsct--ngayapdung" name="ktkl-dsct--ngayapdung">
                                        </div>
                                        <div class="ktkl-dsct--input">
                                            <label class="ktkl-dsct--label" for="ktkl-dsct--sokt_kl">Số KT_KL</label>
                                            <input type="text" class="ktkl-dsct--input_element" id="ktkl-dsct--sokt_kl" name="ktkl-dsct--sokt_kl">
                                        </div>
                                        <div class="ktkl-dsct--input">
                                            <label class="ktkl-dsct--label" for="ktkl-dsct--phanloai">Phân loại</label>
                                            <input type="text" class="ktkl-dsct--input_element" id="ktkl-dsct--phanloai" name="ktkl-dsct--phanloai">
                                        </div>
                                        <div class="ktkl-dsct--input">
                                            <label class="ktkl-dsct--label" for="ktkl-dsct--idnhanvien">Mã nhân viên</label>
                                            <input type="text" class="ktkl-dsct--input_element" id="ktkl-dsct--idnhanvien" name="ktkl-dsct--idnhanvien">
                                        </div>
                                    </div>
                                    <div class="ktkl-dsct-buttons">
                                        <div class="ktkl-dsct-button--control">
                                            <button type="button" class="ktkl-dsct--button btn btn-primary" id="them" onclick="ThemChuongTrinh()">Thêm</button>
                                            <div class="ktkl-dsct--button btn btn-warning" id="capnhat" onclick="CapNhat()">Cập nhật</div>

                                            <button type="button" class="ktkl-dsct--button btn btn-outline-danger" id="xoa" onclick="handleXoaClicked()">Xóa</button>

                                        </div>
                                        <div class="ktkl-dsct-button--confirm">
                                            <button type="button" class="ktkl-dsct--button btn btn-secondary" id="huy" onclick="handleHuyClicked()">Hủy</button>
                                            <button type="button" class="ktkl-dsct--button btn btn-success" id="xacnhan" onclick="XacNhanChuongTrinh()">Xác nhận</button>
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
</div>

<%@include file="/component/all_javascript.jsp"%>
<% TaiKhoan tkdangnhap = (TaiKhoan)session.getAttribute("account"); %>

<script>

    jQuery(document).ready(function () {
        getDanhSachChuongTrinh()
    })

    var isUserRoleAdmin = <%= tkdangnhap != null && tkdangnhap.getUserRole().equals("admin") %>;
    if (!isUserRoleAdmin) {
        document.querySelector(".ktkl-dsct-buttons").style.display = "none";
    }

    var id = document.getElementById('ktkl-dsct--id')
    var noidung = document.getElementById('ktkl-dsct--noidung')
    var ngay = document.getElementById('ktkl-dsct--ngayapdung')
    var soktkl = document.getElementById('ktkl-dsct--sokt_kl')
    var loai = document.getElementById('ktkl-dsct--phanloai')
    var manv = document.getElementById('ktkl-dsct--idnhanvien')

    var them = document.getElementById('them')
    var capnhat = document.getElementById('capnhat')
    var xoa = document.getElementById('xoa')
    var huy = document.getElementById('huy')
    var xacnhan = document.getElementById('xacnhan')
    var kieucapnhat = "";

    id.disabled = true;
    ngay.disabled = true;
    noidung.disabled = true;
    soktkl.disabled = true;
    loai.disabled = true;
    manv.disabled = true;
    huy.disabled =true;
    xacnhan.disabled = true;
    function getData() {
        let ID = id.value;
        let ngayApDung = ngay.value;
        let noiDung = noidung.value;
        let soKTKL = soktkl.value;
        let loaiCT = loai.value;
        let maNV = manv.value;
        return {
            Id: ID,
            ngayApDung: ngayApDung,
            noiDung: noiDung,
            soKTKL: soKTKL,
            loaiCT:loaiCT,
            maNV:maNV
        }
    }
    function handleXoaClicked() {
        kieucapnhat="/xoa";
        XacNhanChuongTrinh();
    }
    function handleHuyClicked() {
        clearInput();
        editDisabledInput(true);
        console.log('huy')
    }

    function XacNhanChuongTrinh(){
        var dataObj = getData();
        let url = window.location.href + kieucapnhat;
        jQuery.ajax({
            url: url,
            method: "GET",
            data:dataObj,
            success: getDanhSachChuongTrinh,
            error: function(){
                console.error("Adding failed!")
            }
        }).done(function (){
            if(kieucapnhat==='/xoa'){
                alert("Xóa thành công")
            }
            if(kieucapnhat==='/them'){
                alert("Thêm thành công")
            }
            if(kieucapnhat==='/sua'){
                alert("sửa thành công")
            }
        })
        enableInputElement(true);
        clearTextInput();
    }
    function getDanhSachChuongTrinh() {

        jQuery.ajax({
            url: "${pageContext.request.getContextPath()}/nhanvien/khenthuongkyluat/danhsach",
            method:"GET",
            dataType:'json',
            success: function(data){
                console.log( 'data'+ data)
                var tblKTKL = jQuery("#tbl-ktkl")
                tblKTKL.empty();
                tblKTKL.append("<tbody>");
                jQuery(data).each(function (index, ktkl) {
                    tblKTKL.append(`<tr class="row100 body"><td class="cell100 column1">\${ktkl.id}</td>
                                                    <td class="cell100 column2">\${ktkl.noiDung}</td>
                                                    <td class="cell100 column3">\${ktkl.Ngay}</td>
                                                    <td class="cell100 column4">\${ktkl.soKT_KL}</td>
                                                    <td class="cell100 column5">\${ktkl.loai}</td>
                                                    <td class="cell100 column6">\${ktkl.maNV}</td></tr>
                    `);
                });
                tblKTKL.append("</tbody>");
            },error: function (data) {
                console.error("Can't get contracts list");
            },
        })
            .done(function () {
                //fill clicked data to form
                jQuery(".row100").on("click", function () {
                    var clickedRow = jQuery(this);

                    jQuery("#ktkl-dsct--id").val(clickedRow.find(".column1").text());
                    jQuery("#ktkl-dsct--noidung").val(clickedRow.find(".column2").text());
                    jQuery("#ktkl-dsct--ngayapdung").val(clickedRow.find(".column3").text());
                    jQuery("#ktkl-dsct--sokt_kl").val(clickedRow.find(".column4").text());
                    jQuery("#ktkl-dsct--phanloai").val(clickedRow.find(".column5").text());
                    jQuery("#ktkl-dsct--idnhanvien").val(clickedRow.find(".column6").text());
                });

            });

    }
    function ThemChuongTrinh() {
        enableInputElement(false);
        clearTextInput();
        kieucapnhat = "/them";
    }
    function CapNhat() {
        id.disabled = false;
        ngay.disabled = false;
        noidung.disabled = false;
        soktkl.disabled = false;
        loai.disabled = false;
        manv.disabled = false;
        huy.disabled = false;
        xacnhan.disabled = false;
        kieucapnhat = "/sua"
    }

    function enableInputElement(type) {
        id.disabled = type;
        ngay.disabled = type;
        noidung.disabled = type;
        soktkl.disabled = type;
        loai.disabled = type;
        manv.disabled = type;
        huy.disabled =type;
        xacnhan.disabled = type;
    }
    function clearTextInput(){
        id.value = null;
        ngay.value = null;
        noidung.value = null;
        soktkl.value = null;
        loai.value = null;
        manv.value = null;
        huy.value =null;
        xacnhan.value = null;
    }
    function clearInput() {
        jQuery(".ktkl-dsct--input_element").val("");
        jQuery(".ktkl-dsct--input_element").val("");
    }
    function editDisabledInput(value) {
        jQuery(".ktkl-dsct--input_element").prop("disabled", value);
        jQuery(".ktkl-dsct--input_element").prop("disabled", value);
    }
</script>
</body>
</html>