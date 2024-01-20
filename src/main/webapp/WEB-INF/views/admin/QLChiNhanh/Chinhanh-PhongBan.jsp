<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/component/all_css.jsp"%>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/ChiNhanh-PhongBan.css">
    <title>Quản lý nhân sự</title>
    <style>
        .header-item-context--chinhanh {
            color: var(--color-header-selected);
        }
        .header-item-context--chinhanh:hover {
            color: var(--color-header-selected);
        }
        .nav-item--phongban {
            background-color: var(--backcolor-menu-selected) ;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<div id="main-web" >
    <%@include file="/component/navbar/QLChiNhanh-nav.jsp"%>
    <%@include file="/component/header.jsp"%>
    <div id="content">
        <div id="main-content">
            <div class="container-md cnpb-container">
                <div class="row">
                    <div class="col-sm-12 col-xl-6">
                        <div class="cnpb-cn--container">
                            <h1  style="text-align: center;font-weight: 700; color: #1a4978;">DANH SÁCH CHI NHÁNH</h1>
                            <div class="cnpb-cn--content">
                                <div class="table100 ver1 m-b-110">
                                    <div class="table100-head">
                                        <table>
                                            <thead>
                                            <tr class="row100 head">
                                                <th class="cell100 column1">Mã chi nhánh</th>
                                                <th class="cell100 column2">Tên chi nhánh</th>
                                                <th class="cell100 column3">Địa chỉ</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="table100-body js-pscroll">
                                        <table>
                                            <tbody >
                                            <c:forEach items="${listcn}" var="chinhanh" >
                                                <tr class="row100 body dscn-table-tr" onclick="xacnhan('${chinhanh.maCN}')">
                                                    <td class="cell100 column1">${chinhanh.maCN}</td>
                                                    <td class="cell100 column2">${chinhanh.tenChiNhanh}</td>
                                                    <td class="cell100 column3">${chinhanh.diaChi}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-6">
                        <div class="cnpb-pb--container">
                            <h1 style="text-align: center;font-weight: 700;color: #1a4978;">DANH SÁCH PHÒNG BAN</h1>
                            <div class="cnpb-pb--content">
                                <div class="table100 ver1 m-b-110">
                                    <div class="table100-head">
                                        <table>
                                            <thead>
                                            <tr class="row100 head">
                                                <th class="cell100 column1">Mã phòng ban</th>
                                                <th class="cell100 column2">Tên phòng ban</th>
                                                <th class="cell100 column3">Chi nhánh</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="table100-body js-pscroll">
                                        <table>
                                            <tbody id="bodydata">
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

<%@include file="/component/all_javascript.jsp"%>

<script>
    var dulieu = document.getElementById("bodydata");

    function  xacnhan(MaCN){
        jQuery.ajax({
            type: "GET",
            url: "${request.getContextPath()}/QLNhanSu_war_exploded/chinhanh/xemphongbantheochinhanh",
            data: {
                macn  : MaCN,
            },
            success: function (data) {
                console.log(data);

                dulieu.innerHTML=data;
            },
            error: function (error) {
                console.log(error);
            }
        });
    }




</script>

</body>
</html>
