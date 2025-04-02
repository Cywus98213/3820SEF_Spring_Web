<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="system.settings.title"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2563eb;
            --accent-color: #3b82f6;
            --danger-red: #ef4444;
            --success-green: #22c55e;
            --text-dark: #1e293b;
            --edit-orange: #f59e0b;
            --input-bg: #f8fafc;
            --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        body {
            background: #f8fafc;
            min-height: 100vh;
        }

        .settings-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.05);
        }

        .password-container {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-control {
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .form-control:focus {
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
        }

        .btn-back {
            background: var(--primary-color);
            color: white;
        }

        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2.5rem;
        }

        .btn-auth {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            text-decoration: none;
            border: 2px solid transparent;
        }

        .btn-teacher {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            box-shadow: var(--shadow-sm);
        }

        .btn-teacher:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(59, 130, 246, 0.2);
        }

        .btn-action {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.2s ease;
            text-decoration: none;
            border: 1px solid #e2e8f0;
            background: white;
            color: var(--text-dark);
        }

        .btn-danger {
            background: rgba(239, 68, 68, 0.08);
            color: var(--danger-red);
            border-color: rgba(239, 68, 68, 0.15);
        }

        .btn-danger:hover {
            background: var(--danger-red);
            color: white;
            border-color: transparent;
        }

        .btn-icon {
            padding: 0.4rem;
            border-radius: 8px;
            width: 36px;
            height: 36px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
        }

        .list-group-item {
            padding: 1.25rem 1.5rem;
            background: #f8fafc;
            border: none;
            border-radius: 12px;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: var(--shadow-sm);
            display: flex;
            align-items: center;
            gap: 1.25rem;
            margin-bottom: 0.75rem;
        }

        .list-group-item:hover {
            background: #eff6ff;
            transform: translateY(-3px);
            box-shadow: 0 6px 18px rgba(59, 130, 246, 0.1);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.75rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f1f5f9;
        }

        .section-header h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-dark);
            margin: 0;
        }

        .user-card {
            background: #f8fafc;
            border-radius: 12px;
            padding: 1.25rem;
            margin-bottom: 1rem;
            transition: all 0.2s ease;
        }

        .user-card h5 {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
            color: var(--text-dark);
        }

        .user-card p {
            font-size: 0.9rem;
            color: #64748b;
        }

        .modal-header {
            border-bottom: 1px solid #e2e8f0;
            padding: 1.25rem 1.5rem;
        }

        .modal-title {
            font-weight: 600;
            color: var(--text-dark);
        }

        .modal-footer {
            border-top: 1px solid #e2e8f0;
            padding: 1.25rem 1.5rem;
        }

        #togglePasswordBtn {
            border-radius: 8px;
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

    </style>
</head>
<body>

<div class="settings-container">
    <div class="header-actions">
        <a href="/" class="btn-action btn-back">
            <i class="fas fa-arrow-left"></i>
            <spring:message code="button.back"/>
        </a>
        <div class="sub-action">
            <c:if test="${role == 'teacher'}">
                <button class="btn-auth btn-teacher" onclick="showAddModal()">
                    <i class="fas fa-plus me-2"></i>
                    <spring:message code="button.add.user"/>
                </button>
            </c:if>
            <a href="/user/setting/${currentUserId}/history" class="btn-action btn-back btn-auth">
                <i class="fas fa-clock"></i>
                <spring:message code="button.history"/>
            </a>
        </div>
    </div>

    <!-- Students Section -->
    <div class="mb-5">
        <div class="section-header">
            <h3><spring:message code="user.management.students"/></h3>
        </div>
        <!-- 其他学生列表内容保持不变 -->
    </div>

    <!-- Teachers Section -->
    <div class="mb-5">
        <div class="section-header">
            <h3><spring:message code="user.management.teachers"/></h3>
        </div>
        <!-- 其他教师列表内容保持不变 -->
    </div>
</div>

<!-- Modal表单中的国际化 -->
<div id="userModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form id="userForm" method="POST" action="/user/userAction">
                <div class="modal-body">
                    <!-- 其他表单字段 -->
                    <div class="mb-3">
                        <label class="form-label"><spring:message code="user.fullname"/></label>
                        <input type="text" class="form-control" id="fullName" name="fullName" required>
                    </div>
                    <!-- 更多字段... -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <spring:message code="button.cancel"/>
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <spring:message code="button.save"/>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function showAddModal() {
        document.getElementById('modalTitle').textContent = '<spring:message code="modal.title.add"/>';
        document.getElementById('userForm').reset();
        document.getElementById('modalTitle').textContent = "Add New User" ;
        document.getElementById('formType').value = "add";
        new bootstrap.Modal(document.getElementById('userModal')).show();
    }

    function showEditModal(userType, userId, fullName, username, email, phoneNumber, password, role, userRole) {
        console.log(userType, userId, fullName, username, email, phoneNumber, password, role, userRole)
        document.getElementById('modalTitle').textContent = `Edit ` + userType;
        document.getElementById('userId').value = userId;
        document.getElementById('username').value = username;
        document.getElementById('password').value = password;
        document.getElementById('fullName').value = fullName;
        document.getElementById('email').value = email;
        document.getElementById('role').value = role;
        document.getElementById('phoneNumber').value = phoneNumber;
        document.getElementById('formType').value = "edit";
        if (userRole === 'student'){
            document.getElementById('roleField').style.display = 'none';
            document.getElementById('usernameInput').style.display = 'none';
        }

        new bootstrap.Modal(document.getElementById('userModal')).show();
    }

    function togglePasswordVisibility() {
        const passwordInput = document.getElementById("password");
        const toggleIcon = document.getElementById("toggleIcon");

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            toggleIcon.classList.remove("fa-eye");
            toggleIcon.classList.add("fa-eye-slash");
        } else {
            passwordInput.type = "password";
            toggleIcon.classList.remove("fa-eye-slash");
            toggleIcon.classList.add("fa-eye");
        }
    }
</script>
</body>
</html>