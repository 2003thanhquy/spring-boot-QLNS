<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/component/all_css.jsp"%>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/CoCauCongTy.css">
    <title>Quản lý nhân sự</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<div id="main-web" >
    <%@include file="/component/navbar/NoneMenu-nav.jsp"%>
    <%@include file="/component/header.jsp"%>
    <div id="content">
        <div id="main-content">
            <div class="cocaucongty--container">
                <div class="cocaucongty--heading">
                    <div>
                        <ul class="parent">
                            <li class="child" tree-level="1">
                                <span class="tree-text" onclick="icon_active(this)"><i class="fa-solid fa-play icon-play icon-play-1" ></i>Công ty</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>

<%@include file="/component/all_javascript.jsp"%>
        <script>

            jQuery(document).ready(function () {
                jQuery(".tree-text").one('click', function() {
                    callAjaxFirstClicked(this);
                });
            });

            const URL_WITH_TREE_LEVEL = {
                1: "<%=request.getContextPath()%>/cocaucongty/chinhanh", //return list of ChiNhanh
                2: "<%=request.getContextPath()%>/cocaucongty/pbcha", //return list of PhongBanCha
                3: "<%=request.getContextPath()%>/cocaucongty/pbcon", //return list of PhongBanCon
            }

            function collapseEffect(element) {
                element.toggle("slow");
            }

            function callAjax(url, queryParams) {
                return new Promise(function(resolve, reject) {
                    jQuery.ajax({
                        url: url,
                        type: "GET",
                        dataType: "json",
                        data: queryParams,
                        success: function(data) {
                            resolve(data);
                        },
                        error: function(error) {
                            console.error('Call API error with endpoint: ' + url);
                            reject(error);
                        }
                    });
                });
            }


            //"this" is span clicked
            function callAjaxFirstClicked(element) {
                let liParent = jQuery(element).parent();
                let params = {};
                let url = URL_WITH_TREE_LEVEL[liParent.attr("tree-level")];

                //get params from parent li of span attributes
                liParent.each(function() {
                    jQuery.each(this.attributes, function() {
                        if(this.specified && this.name.includes("param-")) {
                            console.log(this.name, this.value);
                            let paramName = this.name.substring("param-".length);
                            params[paramName] = this.value;
                        }
                    });
                })

                console.log('Tree level', liParent.attr("tree-level"));
                console.log('url :', url);
                console.log('params: ', params);

                callAjax(url, params)
                    .then(data => {
                        //data is json objects
                        liParent.append("<ul class='parent' style='display: none;'></ul>");
                        let ul = liParent.find(">ul");
                        data.forEach(element => {

                            let liHtml = "<li class='child' tree-level='" + (parseInt(liParent.attr("tree-level")) + 1).toString() + "'>"
                                + "<span class='tree-text' onclick='icon_active(this)'></span>"
                                + "</li>";

                            let liDOM = jQuery(liHtml);
                            for (const [key, value] of Object.entries(element)) {
                                if (key.includes("ten")) {
                                    liDOM.find(">.tree-text").text(value);
                                    liDOM.find(">.tree-text").prepend("<i class='fa-solid fa-play icon-play icon-play-`${i}`'></i>");
                                }
                                else {
                                    liDOM.attr("param-"+key, value);
                                }

                            }

                            liDOM.find(">.tree-text").one('click', function() {
                                callAjaxFirstClicked(this);
                            });

                            ul.append(liDOM);
                        });
                    })
                    .then(() => {
                        collapseEffect(liParent.find("> ul"));
                        liParent.find("> .tree-text").on('click', function() {
                            collapseEffect(liParent.find("> ul"));
                        });
                    })
                    .catch((error) => {
                        // Handle any errors from the AJAX call
                        console.error(error);
                    });

            }
            function icon_active(element){
                var iconselect = element.querySelector(".icon-play")
                iconselect.classList.toggle("active");
            }

        </script>
</body>
</html>