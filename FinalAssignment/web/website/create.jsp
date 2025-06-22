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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/create.css"/>
        <script src="${pageContext.request.contextPath}/js/clock.js"></script>
    </head>
    <body>
        <div class="sidebar">
            <h2>Menu</h2>
            <a href="website/create"><i class="fas fa-file-alt"></i> Tạo đơn nghỉ phép</a>
            <a href="website/accepted"><i class="fas fa-check-circle"></i> Duyệt đơn nghỉ phép</a>
            <a href="#"><i class="fas fa-history"></i> Lịch sử tạo đơn</a>
            <a href="website/history"><i class="fas fa-folder-open"></i> Lịch sử duyệt đơn</a>
            <a href="website/agenda"><i class="fas fa-calendar-alt"></i> Lịch làm việc</a>
        </div>

        <div class="main">
            <div class="topbar">
                <div class="clock" id="clock">
                    <i class="fas fa-calendar-days"></i>
                    <span id="clock-text"></span>
                </div>
                <div class="user-info">
                    <i class="fas fa-user"></i>
                    <span>${sessionScope.account.displayname}</span>
                </div>
                <form action="${pageContext.request.contextPath}/logout" method="post">
                    <button type="submit" class="logout-btn">Đăng xuất</button>
                </form>
            </div>

            <div class="content">
                <h2 style="margin-bottom: 20px; color: #2c3e50"></h2>
                <form class="leave-form" action="create" method="post">
                    <fieldset>
                        <legend>Đơn xin nghỉ phép</legend>

                        <p>
                            User: <strong>${sessionScope.account.displayname}</strong>, Role: <strong>${sessionScope.account.roles[0].name}</strong>
                            Dep: <strong>phòng IT</strong>
                        </p>

                        <label for="from-date">Từ ngày:</label>
                        <input type="date" id="from-date" name="fromDate" required />

                        <label for="to-date">Tới ngày:</label>
                        <input type="date" id="to-date" name="toDate" required />

                        <label for="reason">Lý do:</label>
                        <textarea id="reason" name="reason" rows="4" required></textarea>

                        <button type="submit">Gửi</button>
                    </fieldset>
                </form>

            </div>
        </div>
    </body>
</html>
