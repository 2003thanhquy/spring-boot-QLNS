<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/7/2023
  Time: 2:35 PM
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
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/DanhSachChiNhanh.css">
    <title>Quản lý nhân sự</title>
    <style>
        .header-item-context--chinhanh {
            color: var(--color-header-selected);
        }
        .header-item-context--chinhanh:hover {
            color: var(--color-header-selected);
        }
        .nav-item--xemchinhanh {
            background-color: var(--backcolor-menu-selected) ;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<h1> hello</h1>
<div id="main-web" >
    <%@include file="/component/navbar/QLChiNhanh-nav.jsp"%>
    <%@include file="/component/header.jsp"%>
    <div id="content">
        <div id="main-content">
            <div class=" container-md dscn-container">
                <div class="row">
                    <div class="col-sm-12 col-xl-6">
                        <div class="dscn-cn--container">
                            <h1 class="dscn-cn--heading" style="text-align: center">DANH SÁCH CHI NHÁNH</h1>
                            <div class="dscn-cn--content">
                                <div class="dscn-cn-table table100 ver2 m-b-110">
                                    <div class="table100-head ">
                                        <table>
                                            <thead>
                                            <tr class="row100 head ">
                                                <th class="cell100 column1">Mã chi nhánh</th>
                                                <th class="cell100 column2">Tên chi nhánh</th>
                                                <th class="cell100 column3">Địa chỉ</th>
                                                <th class="cell100 column4">Ngày thành lập</th>
                                                <th class="cell100 column5">Mã giám đốc</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="table100-body js-pscroll">
                                        <table>
                                            <tbody id="bodydata">
                                            <c:forEach items="${listcn}" var="chinhanh" >
                                            <tr class="row100 body dscn-table-tr" onclick="handleItemClick('${chinhanh.maCN}','${chinhanh.tenChiNhanh}','${chinhanh.diaChi}','${chinhanh.ngayBD}','${chinhanh.maGiamDoc}')">
                                                <td class="cell100 column1">${chinhanh.maCN}</td>
                                                <td class="cell100 column2">${chinhanh.tenChiNhanh}</td>
                                                <td class="cell100 column3">${chinhanh.diaChi}</td>
                                                <td class="cell100 column4">${chinhanh.ngayBD}</td>
                                                <td class="cell100 column5">${chinhanh.maGiamDoc}</td>
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
                        <div class="dscn-ttcn--container">
                            <h1 class="dscn--ttcn--heading" style="text-align: center">THAO TÁC</h1>
                            <div class="dscn-ttcn--content">
                               <form action="" method="post" class="dscn-ttcn--form">
                                   <div class="dscn-ttnv--main-input">
                                       <div class="dscn--ttcn--input-container">
                                           <label class="dscn-ttcn-label-input" for="dscn--ttcn-idchinhanh">Mã chi nhánh</label>
                                           <input class="dscn-ttcn-input-element" type="text" id="dscn--ttcn-idchinhanh" name="dscn--ttcn-idchinhanh">
                                       </div>
                                       <div class="dscn--ttcn--input-container">
                                           <label class="dscn-ttcn-label-input" for="dscn--ttcn-tenchinhanh">Tên chi nhánh</label>
                                           <input class="dscn-ttcn-input-element" type="text" id="dscn--ttcn-tenchinhanh" name="dscn--ttcn-tenchinhanh">
                                       </div>
                                       <div class="dscn--ttcn--input-container">
                                           <label class="dscn-ttcn-label-input" for="dscn--ttcn-diachi">Địa chỉ</label>
                                           <input class="dscn-ttcn-input-element" type="text" id="dscn--ttcn-diachi" name="dscn--ttcn-diachi">
                                       </div>
                                       <div class="dscn--ttcn--input-container">
                                           <label class="dscn-ttcn-label-input" for="dscn--ttcn-ngaythanhlap">Ngày thành lập</label>
                                           <input class="dscn-ttcn-input-element" type="date" id="dscn--ttcn-ngaythanhlap" name="dscn--ttcn-ngaythanhlap">
                                       </div>
                                       <div class="dscn--ttcn--input-container">
                                           <label class="dscn-ttcn-label-input" for="dscn--ttcn-idgiamdoc">Mã giám đốc</label>
                                           <input class="dscn-ttcn-input-element" type="text" id="dscn--ttcn-idgiamdoc" name="dscn--ttcn-idgiamdoc">
                                       </div>
                                   </div>
                               </form>
                                   <div class="button-container">
                                        <div class="dscn-ttcn--thaotac-button">
                                            <button class="btn btn-primary dscn-ttcn-thembutton dscn-ttcn--button" onclick="themcn()">Thêm</button>
                                            <button class="btn btn-warning dscn-ttcn-capnhatbutton dscn-ttcn--button" onclick="capnhatcn()">Cập nhật</button>
                                        </div>
                                       <div class="dscn-ttcn--confirm-button">
                                           <button class="btn btn-secondary dscn-ttcn-huytbutton dscn-ttcn--button" onclick="huy()">Hủy</button>
                                           <button class="btn btn-success dscn-ttcn-xacnhantbutton dscn-ttcn--button" onclick="xacnhan()">Xác nhận</button>
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
    var macn = document.getElementById("dscn--ttcn-idchinhanh");
    var tencn =document.getElementById("dscn--ttcn-tenchinhanh");
    var diachi = document.getElementById("dscn--ttcn-diachi");
    var ngaythanhlap = document.getElementById("dscn--ttcn-ngaythanhlap");
    var magiamdoc = document.getElementById("dscn--ttcn-idgiamdoc");


    macn.disabled = true;
    tencn.disabled = true;
    diachi.disabled = true;
    ngaythanhlap.disabled = true;
    magiamdoc.disabled = true;


    var kieucapnhat;
    var dulieu = document.getElementById("bodydata");


     function  handleItemClick(MaCN,TenCN,DiaChi,NgayThanhLap,Magd){
         macn.value = MaCN;
         tencn.value= TenCN;
         diachi.value = DiaChi;
         ngaythanhlap.value = NgayThanhLap;
         magiamdoc.value = Magd;
         macn.disabled = true;
         tencn.disabled = true;
         diachi.disabled = true;
         ngaythanhlap.disabled = true;
         magiamdoc.disabled = true;

     }
    document.getElementsByClassName(".row100 body dscn-table-tr")[1][1].click();
     function  themcn(){
         kieucapnhat = "them";
         macn.value = '';
         tencn.value = '';
         diachi.value = '';
         ngaythanhlap.value = '';
         magiamdoc.value = '';


         macn.disabled = true;
         tencn.disabled = false;
         diachi.disabled = false;
         ngaythanhlap.disabled = false;
         magiamdoc.disabled = false;

     }
     function  capnhatcn(){
         kieucapnhat = "capnhat";
         macn.disabled = true;
         tencn.disabled = false;
         diachi.disabled = false;
         ngaythanhlap.disabled = false;
         magiamdoc.disabled = false;
     }
     function  xoacn(){
         kieucapnhat = "xoa";
     }
    function  huy(){

        macn.disabled = true;
        tencn.disabled = true;
        diachi.disabled = true;
        ngaythanhlap.disabled = true;
        magiamdoc.disabled = true;
    }
    function  xacnhan(){
        jQuery.ajax({
            type: "GET",
            url: "${request.getContextPath()}/QLNhanSu_war_exploded/chinhanh/capnhatchinhanh",
            data: {
                kieucapnhat: kieucapnhat,
                macn  : macn.value,
                tencn : tencn.value,
                diachi : diachi.value,
                ngaythanhlap  :ngaythanhlap.value,
                magiamdoc : magiamdoc.value,
            },
            success: function (data) {
                console.log(data);
                alert(kieucapnhat+ " thành công");
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
