<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/component/all_css.jsp"%>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/NhanVien_DuAn.css">
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
            <div class = "nvda-container container">
                <div class="row">
                    <div class="col-sm-12 col-xl-8">
                        <div class="nvda-ttda--container">
                            <div class="nvda-ttda--maduan">
                                <h3 class="nvda-ttda--label">Mã dự án:</h3>
                                <h3 class="nvda-ttda--content"></h3>
                            </div>
                            <div class="nvda-ttda--tenduan">
                                <h3 class="nvda-ttda--label">Tên dự án:</h3>
                                <h3 class="nvda-ttda--content"></h3>
                            </div>
                        </div>


                        <div class="nvda-dsnv--container">
                            <h2>Danh sách nhân viên</h2>
                            <div class="nvda-dsnv--content">
                                <div class="table100 ver5 m-b-110">
                                    <div class="table100-body js-pscroll">
                                        <table id="tbl-nvda">
                                            <thead>
                                            <tr class="row100 head">
                                                <th class="cell100 column1">Mã nhân viên</th>
                                                <th class="cell100 column2">Mã dự án</th>
                                                <th class="cell100 column3">Trạng thái</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-4">
                        <div class="nvda-ttnv--container">
                            <h2 style="text-align: center">Nhân viên</h2>
                            <form class="nv-nvda--form" action="" method="post">
                                <div class="nvda-ttnv--input">
                                    <div class="nvda-ttnv-input--container">
                                        <label class="nvda-ttnv--label">Mã nhân viên</label>
                                        <input class="nvda-ttnv-input--element" type="text" id="nvda-ttnv--idnhanvien" name="nvda-ttnv--idnhanvien" disabled>
                                    </div>
                                </div>
                                <div class="nvda-ttnv--input">
                                    <div class="nvda-ttnv-input--container">
                                        <label class="nvda-ttnv--label">Trạng thái</label>
                                        <input class="nvda-ttnv-input--element" type="text" id="nvda-ttnv--trangthai" name="nvda-ttnv--trangthai" disabled>
                                    </div>
                                </div>
                                <div class= "nvda-ttnv--button">
                                    <div class="nvda-ttnv--controlbutton">
                                        <button class="nvda-ttnv--thembutton nvda-ttnv--button btn btn-outline-primary" id="them" type="button" onclick="handleThemClicked()">Thêm vào dự án</button>
                                        <button class="nvda-ttnv--suabutton nvda-ttnv--button btn btn-outline-warning" id="sua" type="button" onclick="handleCapNhatClicked()">Cập nhật</button>
                                        <button class="nvda-ttnv--xoabutton nvda-ttnv--button btn btn-outline-danger" id="xoa" type="button" onclick="handleXoaClicked()">Xóa khỏi dự án</button>
                                    </div>
                                    <div class="nvd-ttnv--confirmbutton">
                                        <button class="nvda-ttnv--huybutton nvda-ttnv--button btn btn-outline-secondary" id="huy" type="button" onclick="handleHuyClicked()">Hủy</button>
                                        <button type="button" class="nvda-ttnv--xacnhanbutton nvda-ttnv--button btn btn-outline-success" id="xacnhan"  onclick="XacNhan()"  >Xác nhận</button>
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

<%@include file="/component/all_javascript.jsp"%>
<% TaiKhoan tkdangnhap = (TaiKhoan)session.getAttribute("account"); %>

<script>
    var isUserRoleAdmin = <%= tkdangnhap != null && tkdangnhap.getUserRole().equals("admin") %>;
    if (!isUserRoleAdmin) {
        document.querySelector(".nvda-ttnv--button").style.display = "none";
    }
    const maDuAn = new URL(window.location.href).searchParams.get("maduan");
    console.log("maduan = ", maDuAn);

    var kieucapnhat = "";

    jQuery(document).ready(function() {
        getDanhSachNhanVienTrongDuAn();
    });

    function getDanhSachNhanVienTrongDuAn() {
        let url = window.location.pathname + "/danhsach?maduan=" + maDuAn;
        jQuery.ajax({
            url: url,
            type: "GET",
            dataType: "json",
            success: function (data) {
                var tbl = jQuery("#tbl-nvda tbody");
                tbl.empty();

                jQuery(data).each(function (index, element) {
                    jQuery(".nvda-ttda--maduan .nvda-ttda--content").text(`\${element.maDuAn}`);
                    jQuery(".nvda-ttda--tenduan .nvda-ttda--content").text(`\${element.tenDuAn}`);

                    tbl.append(`<tr class="row100 body">
                                    <td class="cell100 column1">\${element.maNV}</td>
                                    <td class="cell100 column2">\${element.maDuAn}</td>
                                    <td class="cell100 column3">\${element.trangThaiLamViec}</td>
                                </tr>`);
                })
            },
            error: function () {
                console.error("Call Ajax failed")
            }
        })
            .done(function () {
                //fill clicked data to form
                jQuery(".row100").on("click", function () {
                    var clickedRow = jQuery(this);

                    jQuery("#nvda-ttnv--idnhanvien").val(clickedRow.find(".column1").text());
                    jQuery("#nvda-ttnv--trangthai").val(clickedRow.find(".column3").text());
                });
            });
    }

    function getData() {
        let maNV = jQuery("#nvda-ttnv--idnhanvien").val();
        let trangThaiLamViec = jQuery("#nvda-ttnv--trangthai").val();
        return {
            maDuAn: maDuAn,
            maNV: maNV,
            trangThaiLamViec: trangThaiLamViec,
        }
    }

    function handleThemClicked() {
        kieucapnhat = "/them";
        editDisabledInput(false);
        clearInput();
        $("#nvda-ttnv--idnhanvien").focus();
    }

    function handleCapNhatClicked() {
        kieucapnhat = "/sua";
        editDisabledInput(false);
        $("#nvda-ttnv--idnhanvien").focus();
    }

    function handleXoaClicked() {
        kieucapnhat="/xoa";
        XacNhan();
    }
    function handleHuyClicked() {
        clearInput();
        editDisabledInput(true);
    }

    //Handle button "XacNhan" clicked
    function XacNhan() {
        var dataObj = getData();
        let url = window.location.pathname + kieucapnhat;
        jQuery.ajax({
            url: url,
            method: "GET",
            data: dataObj,
            success: getDanhSachNhanVienTrongDuAn,
            error: function () {
                alert("Loi")
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

        editDisabledInput(true);
        clearInput();
    }

    function clearInput() {
        jQuery(".nv-nvda--form input").val("");
    }

    function editDisabledInput(value) {
        jQuery(".nv-nvda--form input").prop("disabled", value);
    }
</script>
</body>
</html>
