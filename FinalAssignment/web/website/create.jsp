<%-- 
    Document   : create
    Created on : Jun 12, 2025, 10:17:33 AM
    Author     : anhqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đơn xin nghỉ phép</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
            />
        <link rel="stylesheet" href="../css/create.css"/>
        <script src="../js/clock.js"></script>
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
                <h2 style="margin-bottom: 20px; color: #2c3e50"></h2>
                <form class="leave-form">
                    <fieldset>
                        <legend>Đơn xin nghỉ phép</legend>

                        <p>
                            User: <strong>mr Tèo</strong>, Role: <strong>Nhân viên</strong>,
                            Dep: <strong>phòng IT</strong>
                        </p>

                        <label for="from-date">Từ ngày:</label>
                        <input type="date" id="from-date" name="from-date" required />

                        <label for="to-date">Tới ngày:</label>
                        <input type="date" id="to-date" name="to-date" required />

                        <label for="reason">Lý do:</label>
                        <textarea id="reason" name="reason" rows="4" required></textarea>

                        <button type="submit">Gửi</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>
