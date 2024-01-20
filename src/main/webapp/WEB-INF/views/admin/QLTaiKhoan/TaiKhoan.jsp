<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.qlns.model.TaiKhoan" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/component/all_css.jsp"%>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/TaiKhoan.css">
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

                    <div class="container-left col-sm-12 col-xl-8">
                        <div class="tk-dstk--container">
                            <h2 class="tk-dst--heading" style="text-align: center">DANH SÁCH TÀI KHOẢN</h2>
                            <div class="tk-dstk--content">
                                <div class="table100 ver4 m-b-110">
                                    <div class="table100-head">
                                        <table>
                                            <thead>
                                            <tr class="row100 head">
                                                <th class="cell100 column1">UserId</th>
                                                <th class="cell100 column2">Username</th>
                                                <th class="cell100 column3">Password</th>
                                                <th class="cell100 column4">Userrole</th>
                                                <th class="cell100 column5">Mã nhân viên</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="table100-body js-pscroll">
                                        <table id="tbl-taikhoan">
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-right col-sm-12 col-xl-4">
                        <div class="tk-tttk--container">
                            <h2 class="tk-tttk--heading" style="text-align: center">THÔNG TIN TÀI KHOẢN</h2>
                            <div class="tk-tttk--content">
                                <form action="" method="post">
                                    <div class="tk-tttk-inputs">
                                        <div class="tk-tttl--input">
                                            <label class="tk-tttk--label" for="tk-tttk--userid" >UserID</label>
                                            <input type="text" class="tk-tttk--input_element" id="tk-tttk--userid" name="tk-tttk--userid" disabled>
                                        </div>
                                        <div class="tk-tttl--input">
                                            <label class="tk-tttk--label" for="tk-tttk--username">Username</label>
                                            <input type="text" class="tk-tttk--input_element" id="tk-tttk--username" name="tk-tttk--username" disabled>
                                        </div>
                                        <div class="tk-tttl--input">
                                            <label class="tk-tttk--label" for="tk-tttk--password">Password</label>
                                            <input type="text" class="tk-tttk--input_element" id="tk-tttk--password" name="tk-tttk--password" disabled>
                                        </div>
                                        <div class="tk-tttl--input">
                                            <label class="tk-tttk--label" for="tk-tttk--userrole">Userrole</label>
                                            <input type="text" class="tk-tttk--input_element" id="tk-tttk--userrole" name="tk-tttk--userrole" disabled>
                                        </div>
                                        <div class="tk-tttl--input">
                                            <label class="tk-tttk--label" for="tk-tttk--idnhanvien">Mã nhân viên</label>
                                            <input type="text" class="tk-tttk--input_element" id="tk-tttk--idnhanvien" name="tk-tttk--idnhanvien" disabled>
                                        </div>
                                    </div>
                                    <div class="tk-tttk-buttons">
                                        <div class="tk-tttk-button--control">
                                            <button  type="button" class="tk-tttk--button btn btn-primary adminxai" onclick="handleThemClicked()" >Tạo tài khoản</button>
                                            <button type="button" class="tk-tttk--button btn btn-warning" onclick="handleCapNhatClicked()" >Đổi mật khẩu</button>
<%--                                            <button  type="button" class="tk-tttk--button btn btn-danger" onclick="handleXoaClicked()" >Xóa</button>--%>
                                        </div>
                                        <div class="tk-tttk-button--confirm">
                                            <button  type="button" class="tk-tttk--button btn btn-secondary" onclick="handleHuyClicked()" >Hủy</button>
                                            <button type="button" class="tk-tttk--button btn btn-success" onclick="XacNhan()">Xác nhận</button>
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
<script>
    var left_container = document.querySelector(".container-left");
    var right_container = document.querySelector(".container-right");
    <%TaiKhoan tkdangnhap = (TaiKhoan)session.getAttribute("account");  %>
    if(!<%=tkdangnhap.getUserRole().equals("admin")%>){
        left_container.style.display = "none";

        document.getElementById("tk-tttk--userid").value = '<%= tkdangnhap.getUserID() %>';
        document.getElementById("tk-tttk--username").value = '<%= tkdangnhap.getUserName() %>';
        document.getElementById("tk-tttk--password").value = '<%= tkdangnhap.getPassword() %>';
        document.getElementById("tk-tttk--userrole").value = '<%= tkdangnhap.getUserRole() %>';
        document.getElementById("tk-tttk--idnhanvien").value = '<%= tkdangnhap.getMaNV() %>';
        document.querySelector(".adminxai").style.display = "none";
    }

</script>
<script>
    var kieucapnhat = "";

    jQuery(document).ready(function() {
        getDanhSachTaiKhoan();
    });
    function getDanhSachTaiKhoan() {
        console.log('data')
        jQuery.ajax({
            url: "${pageContext.request.getContextPath()}/taikhoan/thongtin/danhsach",
            method: "GET",
            dateType: "json",
            success: function (data) {
                var tblTaiKhoan = jQuery("#tbl-taikhoan");
                tblTaiKhoan.empty();
                tblTaiKhoan.append("<tbody>");
                jQuery(data).each(function (index, element) {
                    tblTaiKhoan.append(`<tr class="row100 body"><td class="cell100 column1">\${element.userID}</td><td class="cell100 column2">\${element.userName}</td><td class="cell100 column3">\${element.password}</td><td class="cell100 column4">\${element.userRole}</td><td class="cell100 column5">\${element.maNV}</td></tr>`);
                });
                tblTaiKhoan.append("</tbody>");
            },
            error: function (data) {
                console.error("Can't get contracts list");
            },
        })
            .done(function () {
                //fill clicked data to form
                jQuery(".row100").on("click", function () {
                    var clickedRow = jQuery(this);

                    jQuery("#tk-tttk--userid").val(clickedRow.find(".column1").text());
                    jQuery("#tk-tttk--username").val(clickedRow.find(".column2").text());
                    jQuery("#tk-tttk--password").val(clickedRow.find(".column3").text());
                    jQuery("#tk-tttk--userrole").val(clickedRow.find(".column4").text());
                    jQuery("#tk-tttk--idnhanvien").val(clickedRow.find(".column5").text());
                });
            });
    }

    function getData() {
        let userID = jQuery("#tk-tttk--userid").val();
        let userName = jQuery("#tk-tttk--username").val();
        let password = jQuery("#tk-tttk--password").val();
        let userRole = jQuery("#tk-tttk--userrole").val();
        let maNV = jQuery("#tk-tttk--idnhanvien").val();

        return {
            userID: userID,
            userName: userName,
            password: password,
            userRole: userRole,
            maNV: maNV,
        }
    }

    function handleThemClicked() {
        kieucapnhat = "/them";
        editDisabledInput(false);
        clearInput();
        $("#tk-tttk--userid").focus();
    }

    function handleCapNhatClicked() {
        kieucapnhat = "/sua";
        editDisabledInput(false);
        $("#tk-tttk--userid").focus();
    }
    function XacNhan() {
        var dataObj = getData();
        let url = window.location.href + kieucapnhat;
        jQuery.ajax({
            url: url,
            method: "GET",
            data: dataObj,
            success: getDanhSachTaiKhoan,
            error: function () {
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
        editDisabledInput(true);
        clearInput();
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


    function clearInput() {
        jQuery(".tk-tttk--input_element").val("");
    }

    function editDisabledInput(value) {
        jQuery(".tk-tttk--input_element").prop("disabled", value);
    }
</script>

</body>
</html>