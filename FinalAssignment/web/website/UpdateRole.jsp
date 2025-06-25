<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Phân quyền người dùng</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
        <link rel="stylesheet" href="../css/accepted.css"/>
        <script src="../js/clock.js" defer></script>
        <style>
            .modal-content select {
                width: 100%;
                padding: 10px 12px;
                border: 1px solid #ccc;
                border-radius: 6px;
                background-color: #fff;
                font-size: 14px;
                box-shadow: 0 1px 2px rgba(0,0,0,0.1);
                transition: border 0.3s, box-shadow 0.3s;
                appearance: none; /* Loại bỏ mũi tên mặc định (tuỳ trình duyệt) */
                background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg fill='%233b77c0' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M7 10l5 5 5-5z'/%3E%3C/svg%3E");
                background-repeat: no-repeat;
                background-position: right 10px center;
                background-size: 18px;
            }

            .modal-content select:focus {
                outline: none;
                border-color: #3b77c0;
                box-shadow: 0 0 0 2px rgba(59, 119, 192, 0.2);
            }
            .modal-content label {
                display: block;
                margin-bottom: 6px;
                font-weight: bold;
                color: #34495e;
            }

            .modal-content select,
            .modal-content button {
                margin-bottom: 20px;
            }
            .success {
                margin: 20px auto;
                padding: 15px;
                border: 1px solid #2ecc71;
                background-color: #dff0d8;
                color: #2e7d32;
                font-weight: bold;
                text-align: center;
                max-width: 400px;
                border-radius: 6px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

        </style>
    </head>
    <body>
        <div class="sidebar">
            <h2>Menu</h2>
            <c:set var="permissions" value="${sessionScope.allowedEntrypoints}" />
            <c:if test="${permissions != null && permissions.contains('/website/create')}">
                <a href="create"><i class="fas fa-file-alt"></i> Tạo đơn nghỉ phép</a>
            </c:if>
            <c:if test="${permissions != null && permissions.contains('/website/accepted')}">
                <a href="accepted"><i class="fas fa-check-circle"></i> Duyệt đơn nghỉ phép</a>
            </c:if>
            <c:if test="${permissions != null && permissions.contains('/website/history')}">
                <a href="history"><i class="fas fa-folder-open"></i> Lịch sử duyệt đơn</a>
            </c:if>
            <c:if test="${permissions != null && permissions.contains('/website/agenda')}">
                <a href="agenda"><i class="fas fa-calendar-alt"></i> Lịch làm việc</a>
            </c:if>
            <c:if test="${permissions != null && permissions.contains('/admin/updaterole')}">
                <a href="../admin/updaterole"><i class="fas fa-user-shield"></i> Cấp quyền tài khoản</a>
            </c:if>
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
                    <button class="logout-btn">Đăng xuất</button>
                </form>
            </div>

            <c:if test="${param.message eq 'success'}">
                <div class="success">Cập nhật quyền thành công!</div>
            </c:if>

            <div class="request-list">
                <h2 style="margin-bottom: 20px; color: #2c3e50">Phân quyền tài khoản</h2>
                <form action="updaterole" method="post" class="modal-content" style="max-width:500px; margin:auto;">
                    <label>Chọn tài khoản:</label>
                    <select name="aid" required>
                        <option value="">-- Chọn tài khoản --</option>
                        <c:forEach var="acc" items="${requestScope.accounts}">
                            <option value="${acc.id}">${acc.username} (${acc.displayname})</option>
                        </c:forEach>
                    </select>

                    <label>Chọn quyền:</label>
                    <select name="rid" required>
                        <option value="">-- Chọn quyền --</option>
                        <c:forEach var="role" items="${requestScope.roles}">
                            <option value="${role.id}">${role.name}</option>
                        </c:forEach>
                    </select>

                    <br/><br/>
                    <button class="approve-btn" type="submit">
                        <i class="fas fa-check"></i> Cập nhật quyền
                    </button>
                </form>
            </div>
        </div>
    </body>
</html>
