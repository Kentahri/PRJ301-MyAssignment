<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>
    </head>
    <body>
        <form class="login-box" action="register" method="post">
            <%
                String message = request.getParameter("message");
                if (message == null) {
                    message = (String) request.getAttribute("message");
                }
                if ("exists".equals(message)) {
            %>
            <div class="error-message">Tài khoản đã tồn tại!</div>
            <%
                } else if ("fail".equals(message)) {
            %>
            <div class="error-message">Đăng ký thất bại. Vui lòng thử lại!</div>
            <%
                } 
            %>
            <h2>Đăng ký</h2>
            <input type="text" placeholder="Tên tài khoản" name="user" required /><br>
            <input type="password" placeholder="Mật khẩu" name="pass" required /><br>
            <input type="text" placeholder="Tên hiển thị" name="displayname" required /><br>
            <input class="button" type="submit" value="Đăng ký"><br>
            <a class="button" href="${pageContext.request.contextPath}/login">Đăng nhập</a><br>
        </form>
    </body>
</html>
