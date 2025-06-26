<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Đơn nghỉ phép của tôi</title>
        <link rel="stylesheet" href="../css/accepted.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
        <script src="../js/clock.js" defer></script>


        <script>
            function openModal(id, from, to, reason) {
                document.getElementById('modal').style.display = 'block';
                document.getElementById('request-id').value = id;
                document.getElementById('delete-request-id').value = id;
                document.getElementById('modal-from').value = from;
                document.getElementById('modal-to').value = to;
                document.getElementById('modal-reason').value = reason;
            }

            function closeModal() {
                document.getElementById('modal').style.display = 'none';
            }
        </script>

    </head>
    <body>
        <div class="sidebar">
            <h2>Menu</h2>
            <c:set var="permissions" value="${sessionScope.allowedEntrypoints}" />
            <c:if test="${permissions.contains('/website/create')}">
                <a href="create"><i class="fas fa-file-alt"></i> Tạo đơn nghỉ phép</a>
            </c:if>
            <c:if test="${permissions.contains('/website/myrequests')}">
                <a href="myrequests"><i class="fas fa-user-clock"></i> Đơn của tôi</a>
            </c:if>
            <c:if test="${permissions.contains('/website/accepted')}">
                <a href="accepted"><i class="fas fa-check-circle"></i> Duyệt đơn</a>
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

            <div class="request-list">
                <h2>Danh sách đơn nghỉ phép đã tạo</h2>
                <table class="request-table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Từ ngày</th>
                            <th>Đến ngày</th>
                            <th>Lý do</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="r" items="${requestScope.myRequests}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${r.startDate}</td>
                                <td>${r.endDate}</td>
                                <td>${r.reason}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${r.status == 0}">
                                            <span class="status pending">Chờ duyệt</span>
                                        </c:when>
                                        <c:when test="${r.status == 1}">
                                            <span class="status approved">Đã duyệt</span>
                                        </c:when>
                                        <c:when test="${r.status == 2}">
                                            <span class="status rejected">Từ chối</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:if test="${r.status == 0}">
                                        <button class="view-btn" onclick="openEditModal(${r.id}, '${r.startDate}', '${r.endDate}', '${r.reason}')">
                                            Chi tiết
                                        </button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div id="modal" class="modal-overlay" style="display:none;">
                <div class="modal-content">
                    <span class="close-x" onclick="closeModal()">×</span>
                    <h2>Chi tiết đơn nghỉ phép</h2>

                    <form id="editForm" method="post" action="editrequest">
                        <input type="hidden" name="id" id="request-id" />

                        <label>Từ ngày:</label>
                        <input type="date" name="fromDate" id="modal-from" required />

                        <label>Tới ngày:</label>
                        <input type="date" name="toDate" id="modal-to" required />

                        <label>Lý do:</label>
                        <textarea name="reason" id="modal-reason" rows="4" required></textarea>

                        <div class="button-group">
                            <button class="approve-btn" type="submit">
                                <i class="fas fa-pen"></i> Chỉnh sửa
                            </button>
                        </div>
                    </form>

                    <form method="post" action="deleterequest" style="margin-top:10px;">
                        <input type="hidden" name="id" id="delete-request-id" />
                        <button class="reject-btn" type="submit" onclick="return confirm('Bạn có chắc muốn xóa đơn này?')">
                            <i class="fas fa-trash"></i> Xóa
                        </button>
                    </form>

                    <button class="close-btn" onclick="closeModal()">
                        <i class="fas fa-times-circle"></i> Đóng
                    </button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
