<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/7/2023
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/component/all_css.jsp"%>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/CapNhatNhanVien.css">
    <title>Quản lý nhân sự</title>
    <style>
        .header-item-context--phongban {
            color: #666666;
        }
        .header-item-context--phongban:hover {
            color: #666666;
        }
        .nav-item--capnhatnhanvien {
            background-color: #4dbce8;
        }
        .phongban-item {
            cursor: pointer;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<div id="main-web" >
    <%@include file="/component/navbar/QLPhongBan-nav.jsp"%>
    <%@include file="/component/header.jsp"%>
    <div id="content">
        <div id="main-content">
            <div class="capnhatnv-container container-fluid">
                <div class="row" >
                    <div class="col-12 container-fluid">
                        <div class="row">
                            <div class="col-6">
                                <div class="capnhatnv-dspb--container">
                                    <h1 class="heading-content">DANH SÁCH PHÒNG BAN</h1>
                                    <div class="capnhatnv-dspb--content">
                                        <div class="capnhatnv-dspb-table--wrapper">
                                            <div class="table-scroll">
                                                <table class="capnhatnv-dspb-table">
                                                    <thead>
                                                    <tr>
                                                        <th class="column1"><span class="text">Mã phòng</span></th>
                                                        <th class="column2"><span class="text">Tên phòng</span></th>
                                                        <th class="column3"><span class="text">Chi nhánh</span></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${listpbtheouser}" var="phongban">
                                                    <tr onclick="hienthongtinnhanvienphongban('${phongban.maPB}')">
                                                        <td class="column1">${phongban.maPB}</td>
                                                        <td class="column2">${phongban.tenPB} </td>
                                                        <td class="column3">${phongban.tenChiNhanh}</td>
                                                    </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-6">
                               <div class="capnhatnv-dsnvdc--container">
                                   <div class="capnhatnv-dnvdc--content">
                                        <h1 class="heading-content">DANH SÁCH NHÂN VIÊN</h1>
                                       <div class="capnhatnv-dnvdc-table--wrapper">
                                           <div class="table-scroll">
                                               <table id="nhanvien-table" class="capnhatnv-dnvdc-table">
                                                   <thead>
                                                   <tr>
                                                       <th class='column-1'><span class="text">Mã Nhân viên</span></th>
                                                       <th class='column-2'><span class="text">Họ và tên</span></th>
                                                       <th class='column-3'><span class="text">Chức vụ</span></th>
                                                       <th class='column-4'><span class="text">Chi tiết</span></th>
                                                   </tr>
                                                   </thead>
                                                   <tbody id="nhanvien-tbody">
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
            </div>
        </div>
    </div>
</div>
<%@include file="/component/all_javascript.jsp"%>
</body>
</html>
<script>
    // JavaScript

    var tbody = document.getElementById("nhanvien-tbody");

    function hienthongtinnhanvienphongban(MaPB) {

        tbody.innerHTML="";
        jQuery.ajax({
            type: "GET",
            url: "${request.getContextPath()}/QLNhanSu_war_exploded/phongban/danhsachnhanvientheophongban",
            data: {
                MaPB: MaPB
            },
            success: function(data) {

                tbody.innerHTML=data;
            },
            error: function(error) {
                console.log(error);
            }
        });
    }
</script>
