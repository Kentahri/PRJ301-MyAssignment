<%-- 
    Document   : homepage
    Created on : Jun 12, 2025, 9:41:38 AM
    Author     : anhqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
            />
        <link rel="stylesheet" href="../css/homepage.css"/>
        <script src="../js/clock.js" defer></script>
    </head>
    <body>
        <div class="sidebar">
            <h2>Menu</h2>
            <a href="create.jsp"><i class="fas fa-file-alt"></i> Tạo đơn nghỉ phép</a>
            <a href="accepted.jsp"><i class="fas fa-check-circle"></i> Duyệt đơn nghỉ phép</a>
            <a href="#"><i class="fas fa-history"></i> Lịch sử tạo đơn</a>
            <a href="#"><i class="fas fa-folder-open"></i> Lịch sử duyệt đơn</a>
            <a href="#"><i class="fas fa-calendar-alt"></i> Lịch làm việc</a>
        </div>

        <div class="main">
            <div class="topbar">
                <div class="clock" id="clock">
                    <i class="fas fa-calendar-days"></i>
                    <span id="clock-text"></span>
                </div>
                <div class="user-info">
                    <i class="fas fa-user"></i>
                    <span>Nguyễn Văn A</span>
                </div>
                <button class="logout-btn">Đăng xuất</button>
            </div>

            <div class="content">
                <div class="notification">
                    <i class="fas fa-bell"></i>
                    <span>Bạn có 1 đơn nghỉ phép đang chờ duyệt.</span>
                    <button
                        class="close-btn"
                        onclick="this.parentElement.style.display = 'none'"
                        >
                        ×
                    </button>
                </div>
                <div class="notification">
                    <i class="fas fa-bell"></i>
                    <span>Hệ thống sẽ bảo trì vào lúc 23:00 tối nay.</span>
                    <button
                        class="close-btn"
                        onclick="this.parentElement.style.display = 'none'"
                        >
                        ×
                    </button>
                </div>
                <div class="notification">
                    <i class="fas fa-bell"></i>
                    <span>Chào mừng bạn quay trở lại làm việc!</span>
                    <button
                        class="close-btn"
                        onclick="this.parentElement.style.display = 'none'"
                        >
                        ×
                    </button>
                </div>
            </div>
        </div>
    </body>
</html>
