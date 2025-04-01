<!DOCTYPE html>
<html>
<head>
    <title>System Settings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2563eb;
            --accent-color: #3b82f6;
            --danger-red: #ef4444;
            --success-green: #22c55e;
        }

        .settings-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
        }

        .password-container {
            display: flex;
            align-items: center;
        }

        .form-control {
            flex: 1;
            margin-right: 10px;
        }
        .btn {
            cursor: pointer;
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
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.2s ease;
            text-decoration: none;
            border: 2px solid transparent;
            font-size: 0.95rem;
        }
        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
            opacity: 0.92;
        }

        .btn-teacher {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            font-size: 0.95rem;
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
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger-red);
            border: 1px solid rgba(239, 68, 68, 0.2);
        }

        .btn-danger:hover {
            background: var(--danger-red);
            color: white;
        }

        .btn-action:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
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
            box-shadow: 0 3px 9px rgba(0, 0, 0, 0.03);
            display: flex;
            align-items: center;
            gap: 1.25rem;
            text-decoration: none;
            color: var(--text-dark);
            font-weight: 500;
        }

        .list-group-item:hover {
            background: #eff6ff;
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(59, 130, 246, 0.1);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f1f5f9;
        }

        .user-card {
            background: #f8fafc;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1rem;
            transition: all 0.2s ease;
        }

        .user-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .btn-action {
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .actions {
            display: flex;
            flex-direction: row;
            gap: 0.5rem;
        }

    </style>
</head>
<body>

<div class="settings-container">
    <div class="header-actions">
        <a href="/" class="btn-action btn-back">
            <i class="fas fa-arrow-left"></i>
            Back to Course
        </a>
        <c:if test="${role == 'teacher'}">
            <button class="btn-auth btn-teacher" onclick="showAddModal()">
                <i class="fas fa-plus me-2"></i>Add User
            </button>
        </c:if>
    </div>
    <!-- Students Section -->
    <div class="mb-5">
        <div class="section-header">
            <h3>Student Management</h3>
        </div>

        <div class="user-list">
            <c:forEach var="student" items="${students}">
                <div class="user-card d-flex justify-content-between align-items-center list-group-item">
                    <div>
                        <h5 class="mb-1">${student.fullName}</h5>
                        <p class="text-muted mb-0">${student.email}</p>
                    </div>
                    <c:if test="${currentUserId == student.userId or role == 'teacher'}">
                    <div class="actions">
                            <button class="btn-action btn-icon me-2"
                                    onclick="showEditModal('student', '${student.userId}', '${student.fullName}',
                                            '${student.username}','${student.email}','${student.phoneNumber}'
                                            ,'${student.password}', '${student.roles}')">
                                <i class="fas fa-edit"></i>
                            </button>
                            <c:if test="${role == 'teacher'}">
                            <form action="/deleteUser" method="POST" >
                                <input type="hidden" name="_method" value="DELETE">
                                <input type="hidden" name="userId" value="${student.userId}">
                                <button class="btn-action btn-danger btn-icon">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                            </c:if>
                    </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Teachers Section -->
    <c:if test="${role == 'teacher'}">
    <div class="mb-5">
        <div class="section-header">
            <h3>Teacher Management</h3>
        </div>

        <div class="user-list">
            <c:forEach var="teacher" items="${teachers}">
                <div class="user-card d-flex justify-content-between align-items-center list-group-item">
                    <div>
                        <h5 class="mb-1">${teacher.fullName}</h5>
                        <p class="text-muted mb-0">${teacher.email}</p>
                    </div>
                    <div class="actions">
                        <button class="btn-action btn-icon me-2"
                                onclick="showEditModal('teacher', '${teacher.userId}', '${teacher.fullName}',
                                        '${teacher.username}','${teacher.email}','${teacher.phoneNumber}'
                                        ,'${teacher.password}', '${teacher.roles}')">
                            <i class="fas fa-edit"></i>
                        </button>
                        <form action="/deleteUser" method="POST">
                            <input type="hidden" name="_method" value="DELETE">
                            <input type="hidden" name="userId" value="${teacher.userId}">
                            <button class="btn-action btn-danger btn-icon">
                                <i class="fas fa-trash"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    </c:if>
</div>

<!-- edit modal -->
<div id="userModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form id="userForm" method="POST" action="/userAction">
                <div class="modal-body">
                    <input type="hidden" id="formType" name="formType">
                    <input type="hidden" id="userId" name="userId" value="${userId}">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" required>
                    </div>
                    <div class="mb-3" id="usernameInput">
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone number</label>
                        <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">password</label>
                        <div class="password-container ">
                            <input type="password" class="form-control" id="password" name="password" required>
                            <button type="button" id="togglePasswordBtn" class="btn btn-secondary" onclick="togglePasswordVisibility()">
                                <i id="toggleIcon" class="fas fa-eye"></i>
                            </button>
                        </div>
                    </div>


                    <div class="mb-3" id="roleField">
                        <label class="form-label">Role</label>
                        <select class="form-select" id="role" name="role">
                            <option value="student">Student</option>
                            <option value="teacher">Teacher</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function showAddModal() {
        document.getElementById('userForm').reset();
        document.getElementById('modalTitle').textContent = "Add New User" ;
        document.getElementById('formType').value = "add";
        new bootstrap.Modal(document.getElementById('userModal')).show();
    }

    function showEditModal(userType, userId, fullName, username, email, phoneNumber, password, role) {
        console.log(userType, userId, fullName, username, email, phoneNumber, password, role)
        document.getElementById('modalTitle').textContent = `Edit ` + userType;
        document.getElementById('userId').value = userId;
        document.getElementById('username').value = username;
        document.getElementById('password').value = password;
        document.getElementById('fullName').value = fullName;
        document.getElementById('email').value = email;
        document.getElementById('role').value = role;
        document.getElementById('phoneNumber').value = phoneNumber;
        document.getElementById('formType').value = "edit";
        if (role !== 'teacher'){
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