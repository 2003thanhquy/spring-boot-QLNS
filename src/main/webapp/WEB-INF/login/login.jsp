
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>

        <%@include file="/assets/css/login.css"%>
        <%@include file="/assets/css/bootstrap.min.css"%>
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>Login</title>
</head>
<body>

<div class="login-container">
    <div class="login-content">
        <div>
            <div class="login-heading--container">
                <div class="login-image--container">
                    <div class="image-avatar"></div>
                </div>
                <div class="login-heading--text">
                    <h4>Quản lý nhân sự</h4>
                    <p>Đăng nhập để tiếp tục</p>
                </div>
            </div>
            <div class="login-content--container container-sm">
                <%if(request.getAttribute("alter")!=null){%>
                <div class="alert alert-danger center" role="alert">
                    <p>${alter}</p>
                </div>
                <%}%>
                <form class="form-login"  action="<%=request.getContextPath()%>/login" method="post">
                    <div class="container-sm">
                        <div class="input-element--container">
                            <i class="fa-solid fa-user login-icon"></i>
                            <input type="text" name="username" id="username" placeholder="Username" class="input--element" />
                        </div>
                        <div class="input-element--container">
                            <i class="fa-solid fa-lock login-icon"></i>
                            <input type="password" name="pwd" id="pwd" placeholder="Password" class="input--element " />
                        </div>
                        <div class="login-button--container">
                            <button class="login-button"  type="submit">Đăng nhập</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

</body>
</html>
