<!DOCTYPE html>
<html lang="en">
<head>
    <title>COMP3820SEF: Design and Development</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2563eb;
            --accent-color: #3b82f6;
            --text-dark: #1e293b;
            --danger-red: #ef4444;
            --success-green: #22c55e;
            --border-color: #e2e8f0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f0f9ff, #ffffff);
            min-height: 100vh;
            padding: 2rem;
            color: var(--text-dark);
            line-height: 1.6;
        }

        .container {
            max-width: 900px;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.08);
            padding: 3rem;
            margin: 3rem auto;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: var(--text-dark);
            font-weight: 800;
            margin-bottom: 2.5rem;
            position: relative;
            padding-bottom: 1.5rem;
            font-size: 2.25rem;
            text-align: center;
            letter-spacing: -0.5px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color) 0%, rgba(59,130,246,0.2) 100%);
            border-radius: 2px;
        }

        .welcome-message {
            display: flex;
            align-items: center;
            gap: 1rem;
            font-weight: 600;
            color: var(--text-dark);
            padding: 1.25rem 2rem;
            border-radius: 12px;
            background: rgba(59, 130, 246, 0.1);
            border: 2px solid rgba(59, 130, 246, 0.15);
            margin: 2rem 0;
            font-size: 1.1rem;
        }

        .auth-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
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

        .btn-logout {
            background: linear-gradient(135deg, var(--danger-red), #dc2626);
            color: white;
        }

        .btn-login {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
        }

        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
            opacity: 0.92;
        }

        .section-heading {
            color: var(--text-dark);
            font-weight: 700;
            margin: 3rem 0 1.5rem;
            padding: 0.75rem 0;
            display: flex;
            align-items: center;
            gap: 1rem;
            font-size: 1.25rem;
            justify-content: space-between;
            border-bottom: 2px solid rgba(59, 130, 246, 0.1);
        }

        .form {
            background: white;
            border-radius: 14px;
            padding: 1.5rem;
            margin: 1.5rem 0;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
            border: 1px solid var(--border-color);
        }

        .form input,
        .edit-comment-form textarea {
            background: #f8fafc;
            border: 2px solid var(--border-color);
            border-radius: 10px;
            padding: 1rem;
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            width: 100%;
            resize: vertical;
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

        .btn-action:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        }

        .lecture-form input:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
            outline: none;
        }

        .list-group {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-top: 1.5rem;
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

        .no-content {
            color: #64748b;
            font-style: italic;
            padding: 2rem;
            text-align: center;
            background: #f8fafc;
            border-radius: 12px;
            border: 2px dashed #e2e8f0;
            margin: 2rem 0;
        }

        .btn-teacher {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            font-size: 0.95rem;
        }

        .btn-success {
            background: linear-gradient(135deg, var(--success-green), #16a34a);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
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

        .form-group label {
            font-weight: 600;
            margin-bottom: 0.75rem;
            color: var(--text-dark);
            font-size: 0.95rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1.5rem;
                margin: 1rem auto;
                border-radius: 16px;
            }

            h2 {
                font-size: 1.75rem;
                margin-bottom: 2rem;
            }

            .auth-buttons {
                flex-direction: column;
                gap: 0.75rem;
            }

            .section-heading {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }

            .welcome-message {
                padding: 1rem;
                font-size: 1rem;
            }
        }
    </style>
    <script>
        function toggleLectureForm() {
            const form = document.getElementById('lectureForm');
            const btn = document.getElementById('addLectureBtn');
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
            btn.innerHTML = form.style.display === 'none'
                ? '<i class="fas fa-plus me-2"></i>Add Lecture'
                : '<i class="fas fa-times me-2"></i>Cancel';
        }
        function togglePollForm() {
            const form = document.getElementById('pollForm');
            const btn = document.getElementById('addPollBtn');
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
            btn.innerHTML = form.style.display === 'none'
                ? '<i class="fas fa-plus me-2"></i>Add Poll'
                : '<i class="fas fa-times me-2"></i>Cancel';
        }
    </script>
</head>
<body>
<div class="container">
    <!-- Course Title -->
    <h2>COMP3820SEF: Design and Development</h2>

    <!-- Welcome Message -->
    <c:if test="${pageContext.request.userPrincipal != null}">
        <div class="welcome-message">
            <i class="fas fa-user-check"></i>
            Welcome back, ${pageContext.request.userPrincipal.name}!
        </div>
    </c:if>

    <!-- Authentication Buttons -->
    <div class="auth-buttons">
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal != null}">
                <form action="/logout" method="POST">
                    <button type="submit" class="btn-auth btn-logout">
                        <i class="fas fa-sign-out-alt"></i>
                        Log Out
                    </button>
                </form>
            </c:when>
            <c:otherwise>
                <a href="/login" class="btn-auth btn-login">
                    <i class="fas fa-sign-in-alt"></i>
                    Log In
                </a>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Lecture Section -->
    <div class="section-heading">
        <div class="d-flex align-items-center gap-2">
            <i class="fas fa-book-open"></i>
            Lectures
        </div>
        <c:if test="${role == 'teacher'}">
            <button class="btn-auth btn-teacher" id="addLectureBtn"  onclick="toggleLectureForm()">
                <i class="fas fa-plus"></i> Add Lecture
            </button>
        </c:if>
    </div>
    <form id="lectureForm" action="/addLecture" method="POST" class="form" enctype="multipart/form-data" style="display: none;">
        <!-- Lecture Title -->
        <div class="mb-3">
            <input type="text" class="form-control" name="lectureTitle" id="lectureTitle"
                   placeholder="Enter lecture title" required>
        </div>
        <!-- Submit Button -->
        <div class="d-flex justify-content-end gap-2">
            <button type="submit" class="btn-auth btn-success">
                <i class="fas fa-check me-2"></i>
                Post Lecture
            </button>
        </div>
    </form>
    <c:choose>
        <c:when test="${not empty lectures}">
            <div class="list-group">
                <c:forEach var="lecture" items="${lectures}">
                    <div class="list-group-item">
                        <a href="/lecture/${lecture.lectureId}" class="flex-grow-1 text-decoration-none">
                            <i class="fas fa-file-alt"></i>
                                ${lecture.lectureTitle}
                        </a>
                        <c:if test="${role == 'teacher'}">
                            <form action="/deleteLecture" method="POST" class="d-inline">
                                <input type="hidden" name="lectureId" value="${lecture.lectureId}">
                                <input type="hidden" name="_method" value="DELETE">
                                <button type="submit" class="btn-action btn-danger btn-icon" title="Delete Lecture">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <p class="no-content">No lectures available</p>
        </c:otherwise>
    </c:choose>

    <!-- Polls Section -->
    <div class="section-heading">
        <div class="d-flex align-items-center gap-2">
            <i class="fas fa-poll"></i>
            Polls
        </div>
        <c:if test="${role == 'teacher'}">
            <button class="btn-auth btn-teacher" id="addPollBtn" onclick="togglePollForm()">
                <i class="fas fa-plus"></i> Add Poll
            </button>
        </c:if>
    </div>
    <form id="pollForm" action="/addPoll" method="POST" class="form" enctype="multipart/form-data" style="display: none;">
        <!-- Poll Title -->
        <div class="mb-3">
            <input type="text" class="form-control" name="pollTitle" id="pollTitle"
                   placeholder="Enter Your Poll Title Here" required>
        </div>

        <!-- Option 1 -->
        <div class="mb-3">
            <input type="text" class="form-control" name="option1" id="option1"
                   placeholder="Option 1" required>
        </div>

        <!-- Option 2 -->
        <div class="mb-3">
            <input type="text" class="form-control" name="option2" id="option2"
                   placeholder="Option 2" required>
        </div>

        <!-- Option 3 -->
        <div class="mb-3">
            <input type="text" class="form-control" name="option3" id="option3"
                   placeholder="Option 3" required>
        </div>

        <!-- Option 4 -->
        <div class="mb-3">
            <input type="text" class="form-control" name="option4" id="option4"
                   placeholder="Option 4" required>
        </div>

        <!-- Submit Button -->
        <div class="d-flex justify-content-end gap-2">
            <button type="submit" class="btn-auth btn-success">
                <i class="fas fa-check me-2"></i>
                Add Poll
            </button>
        </div>
    </form>

    <c:choose>
        <c:when test="${not empty polls}">
            <div class="list-group">
                <c:forEach var="poll" items="${polls}">
                    <div class="list-group-item">
                        <a href="/poll/${poll.pollId}" class="flex-grow-1 text-decoration-none">
                            <i class="fas fa-chart-bar"></i>
                                ${poll.pollQuestion}
                        </a>
                        <c:if test="${role == 'teacher'}">
                            <form action="/deletePoll" method="POST" class="d-inline">
                                <input type="hidden" name="pollId" value="${poll.pollId}">
                                <input type="hidden" name="_method" value="DELETE">
                                <button type="submit" class="btn-action btn-danger btn-icon" title="Delete Poll">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <p class="no-content">No polls available</p>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>