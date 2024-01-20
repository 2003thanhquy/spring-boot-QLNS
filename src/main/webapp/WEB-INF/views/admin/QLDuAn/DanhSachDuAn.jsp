<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/component/all_css.jsp"%>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/DuAn.css">
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
            <div class="dsda-container container-fluid">
                <div class="row">
                    <div class="col-sm-12 col-xl-8 container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="dsda-da--container" style="height: 50%">
                                    <div class="dsda-da--content">
                                        <h2 class="dsda-da--header"  style="text-align: center; font-weight: 700; color: #fff" class="dsda-da--heading ">DANH SÁCH DỰ ÁN</h2>
                                        <div class="dsda-da-table table100 ver1 m-b-110">
                                            <div class="table100-body js-pscroll">
                                                <table id="tbl-duan">
                                                    <thead>
                                                    <tr class="row100 head ">
                                                        <th class="cell100 column1">Mã dự án</th>
                                                        <th class="cell100 column2">Tên dự án</th>
                                                        <th class="cell100 column3">Trang thái</th>
                                                        <th class="cell100 column4">Danh sách nhân viên</th>
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
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-4 container-fluid">
                        <div class="dsda-ttct--container">
                            <h2 class="dsda-ttct--header" style="text-align: center; font-weight: 700; color: #fff">THÔNG TIN DỰ ÁN</h2>
                            <div class="dsda-ttct--content">
                                <form class="da-dsdu--form" action="" method="post">
                                    <div class="dsda-ttct-inputs--container">
                                        <div class="dsda-input--container">
                                            <label class="dsda-input--label" for="dsda-input--idduan" >Mã dự án</label>
                                            <input class="dsda-input--element " id="dsda-input--idduan" name="dsda-input--idduan" value-old="" disabled>
                                        </div>
                                        <div class="dsda-input--container">
                                            <label class="dsda-input--label" for="dsda-input--tenduan" >Tên dự án</label>
                                            <input class="dsda-input--element " id="dsda-input--tenduan" name="dsda-input--tenduan" disabled>
                                        </div>
                                        <div class="dsda-input--container">
                                            <label class="dsda-input--label" for="dsda-input--ttlamviec" >Trạng thái </label>
                                            <input class="dsda-input--element " id="dsda-input--ttlamviec" name="dsda-input--ttlamviec" disabled>
                                        </div>
                                    </div>
                                    <div class="dsda-button--container">
                                        <div class="dsda-thaotac-button--container">
                                            <button type="button" class="dsda-button dsda-them-button btn btn-primary" id="them" onclick="handleThemClicked()">Thêm</button>
                                            <div class="dsda-button dsda-sua-button btn btn-warning" id="capnhat" onclick="handleCapNhatClicked()">Cập nhật</div>
                                            <button type="button" class="dsda-button dsda-xoa-button btn btn-outline-danger" id="xoa" onclick="handleXoaClicked()">Xóa</button>
                                        </div>
                                        <div class="dsda-confirm-button--container">
                                            <button type="button" class="dsda-button dsda-huy-button btn btn-secondary" id="huy" onclick="handleHuyClicked()">Hủy</button>
                                            <button type="button" class="dsda-button dsda-xacnhan-button btn btn-success" id="xacnhan" onclick="XacNhan()">Xác nhận</button>
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
    var isUserRoleAdmin = <%= tkdangnhap != null && tkdangnhap.getUserRole().equals("admin") %>;
    if (!isUserRoleAdmin) {
        document.querySelector(".dsda-button--container").style.display = "none";
    }
    var kieucapnhat = "";

    jQuery(document).ready(function() {
        getDanhSachDuAn();
    });

    function getDanhSachDuAn() {
        jQuery.ajax({
            url: "${pageContext.request.getContextPath()}/nhanvien/duan/danhsach",
            method: "GET",
            dateType: "json",
            success: function (data) {
                var tblbodyDuAn = jQuery("#tbl-duan tbody");
                tblbodyDuAn.empty();
                jQuery(data).each(function (index, element) {
                    tblbodyDuAn.append(
                        `<tr class="row100 body">
                            <td class="cell100 column1">\${element.maDuAn}</td>
                            <td class="cell100 column2">\${element.tenDuAn}</td>
                            <td class="cell100 column3">\${element.trangThai}</td>
                            <td style="text-align: center" class="cell100 column3">
                                <a href="${pageContext.request.getContextPath()}/nhanvien/duan/chitiet?maduan=\${element.maDuAn}">
                                    <i style="color: #0d6efd;" class="fa-solid fa-users-viewfinder"></i>
                                </a>
                            </td>
                        </tr>`);
                });
            },
            error: function (data) {
                console.error("Can't get projects list");
            },
        })
            .done(function () {
                //fill clicked data to form
                jQuery(".row100").on("click", function () {
                    var clickedRow = jQuery(this);

                    jQuery("#dsda-input--idduan").val(clickedRow.find(".column1").text());
                    jQuery("#dsda-input--idduan").attr("value-old", clickedRow.find(".column1").text());
                    jQuery("#dsda-input--tenduan").val(clickedRow.find(".column2").text());
                    jQuery("#dsda-input--ttlamviec").val(clickedRow.find(".column3").text());
                });
            });
    }

    function getData() {
        let maDuAnMoi = jQuery("#dsda-input--idduan").val();
        let tenDuAn = jQuery("#dsda-input--tenduan").val();
        let trangThai = jQuery("#dsda-input--ttlamviec").val();
        //Update DuAn có thay đổi maDuAn
        if (kieucapnhat === "/sua") {
            let maDuAnCu = jQuery("#dsda-input--idduan").attr("value-old");

            return {
                maDuAnMoi: maDuAnMoi,
                maDuAnCu: maDuAnCu,
                tenDuAn: tenDuAn,
                trangThai: trangThai,
            }
        }

        return {
            maDuAn: maDuAnMoi,
            tenDuAn: tenDuAn,
            trangThai: trangThai,
        }
    }

    function handleThemClicked() {
        kieucapnhat = "/them";
        jQuery("#dsda-input--idduan").attr("value-old", "");
        editDisabledInput(false);
        clearInput();
        $("#dsda-input--idduan").focus();
    }

    function handleCapNhatClicked() {
        kieucapnhat = "/sua";
        editDisabledInput(false);
        $("#dsda-input--idduan").focus();
    }

    function handleXoaClicked() {
        kieucapnhat="/xoa";
        jQuery("#dsda-input--idduan").attr("value-old", "");
        XacNhan();
    }
    function handleHuyClicked() {
        clearInput();
        editDisabledInput(true);
    }

    //Handle button "XacNhan" clicked
    function XacNhan() {
        var dataObj = getData();
        let url = window.location.href + kieucapnhat;
        jQuery.ajax({
            url: url,
            method: "GET",
            data: dataObj,
            success: getDanhSachDuAn,
            error: function () {
               alert("Loiiii")
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
        jQuery(".da-dsdu--form input").val("");
    }

    function editDisabledInput(value) {
        jQuery(".da-dsdu--form input").prop("disabled", value);
    }
</script>
</body>
</html>