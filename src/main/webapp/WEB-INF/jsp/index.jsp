<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title><spring:message code="course.title"/></title>
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

        .settings-button {
            padding: 0.6rem 0.8rem;
            margin-bottom: 2em;
            border: none;
            border-radius: 8px;
            background-color: var(--primary-color);
            color: white;
            cursor: pointer;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .settings-button:hover {
            background-color: var(--accent-color);
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
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
        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
            opacity: 0.92;
        }


        .btn-logout {
            background: linear-gradient(135deg, var(--danger-red), #dc2626);
            color: white;
        }

        .btn-login {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
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
                ? `<i class="fas fa-plus me-2"></i><spring:message code="course.lecture.add"/>`
                : `<i class="fas fa-times me-2"></i><spring:message code="general.cancel"/>`;
        }
        function togglePollForm() {
            const form = document.getElementById('pollForm');
            const btn = document.getElementById('addPollBtn');
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
            btn.innerHTML = form.style.display === 'none'
                ? `<i class="fas fa-plus me-2"></i><spring:message code="course.poll.add"/>`
                : `<i class="fas fa-times me-2"></i><spring:message code="general.cancel"/>`;
        }
    </script>
</head>
<body>
<div class="container">
    <!-- Course Title -->
    <div style="display: flex; align-items: center; justify-content: space-between; gap: 1rem;">
        <h2 style="margin: 0; flex: 1;"><spring:message code="course.title"/></h2>
        <c:if test="${role != null}">
            <a class="settings-button text-decoration-none" href="/user/setting">
                <i class="fas fa-cog"></i>
            </a>
        </c:if>
    </div>

    <!-- Welcome Message -->
    <c:if test="${pageContext.request.userPrincipal != null}">
        <div class="welcome-message">
            <i class="fas fa-user-check"></i>
            <spring:message code="course.welcome" arguments="${pageContext.request.userPrincipal.name}"/>
        </div>
    </c:if>

    <!-- Authentication Buttons -->
    <div class="auth-buttons">
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal != null}">
                <form action="/logout" method="POST">
                    <button type="submit" class="btn-auth btn-logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <spring:message code="course.logout"/>
                    </button>
                </form>
            </c:when>
            <c:otherwise>
                <a href="/login" class="btn-auth btn-login">
                    <i class="fas fa-sign-in-alt"></i>
                    <spring:message code="course.login"/>
                </a>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Lecture Section -->
    <div class="section-heading">
        <div class="d-flex align-items-center gap-2">
            <i class="fas fa-book-open"></i>
            <spring:message code="course.lectures"/>
        </div>
        <c:if test="${role == 'teacher'}">
            <button class="btn-auth btn-teacher" id="addLectureBtn" onclick="toggleLectureForm()">
                <i class="fas fa-plus"></i> <spring:message code="course.lecture.add"/>
            </button>
        </c:if>
    </div>
    <form id="lectureForm" action="/lecture/addLecture" method="POST" class="form" enctype="multipart/form-data" style="display: none;">
        <div class="mb-3">
            <input type="text" class="form-control" name="lectureTitle" id="lectureTitle"
                   placeholder="<spring:message code="course.lecture.title.placeholder"/>" required>
        </div>
        <div class="d-flex justify-content-end gap-2">
            <button type="submit" class="btn-auth btn-success">
                <i class="fas fa-check me-2"></i>
                <spring:message code="course.lecture.submit"/>
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
                            <form action="/lecture/deleteLecture" method="POST" class="d-inline">
                                <input type="hidden" name="lectureId" value="${lecture.lectureId}">
                                <input type="hidden" name="_method" value="DELETE">
                                <button type="submit" class="btn-action btn-danger btn-icon" title="<spring:message code="course.lecture.delete"/>">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <p class="no-content"><spring:message code="course.lecture.empty"/></p>
        </c:otherwise>
    </c:choose>

    <!-- Polls Section -->
    <div class="section-heading">
        <div class="d-flex align-items-center gap-2">
            <i class="fas fa-poll"></i>
            <spring:message code="course.polls"/>
        </div>
        <c:if test="${role == 'teacher'}">
            <button class="btn-auth btn-teacher" id="addPollBtn" onclick="togglePollForm()">
                <i class="fas fa-plus"></i> <spring:message code="course.poll.add"/>
            </button>
        </c:if>
    </div>
    <form id="pollForm" action="/poll/addPoll" method="POST" class="form" enctype="multipart/form-data" style="display: none;">
        <div class="mb-3">
            <input type="text" class="form-control" name="pollTitle" id="pollTitle"
                   placeholder="<spring:message code="course.poll.title.placeholder"/>" required>
        </div>
        <div class="mb-3">
            <input type="text" class="form-control" name="option1" id="option1"
                   placeholder="<spring:message code="course.poll.option" arguments="1"/>" required>
        </div>
        <div class="mb-3">
            <input type="text" class="form-control" name="option2" id="option2"
                   placeholder="<spring:message code="course.poll.option" arguments="2"/>" required>
        </div>
        <div class="mb-3">
            <input type="text" class="form-control" name="option3" id="option3"
                   placeholder="<spring:message code="course.poll.option" arguments="3"/>" required>
        </div>
        <div class="mb-3">
            <input type="text" class="form-control" name="option4" id="option4"
                   placeholder="<spring:message code="course.poll.option" arguments="4"/>" required>
        </div>
        <div class="d-flex justify-content-end gap-2">
            <button type="submit" class="btn-auth btn-success">
                <i class="fas fa-check me-2"></i>
                <spring:message code="course.poll.submit"/>
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
                            <form action="/poll/deletePoll" method="POST" class="d-inline">
                                <input type="hidden" name="pollId" value="${poll.pollId}">
                                <input type="hidden" name="_method" value="DELETE">
                                <button type="submit" class="btn-action btn-danger btn-icon" title="<spring:message code="course.poll.delete"/>">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <p class="no-content"><spring:message code="course.poll.empty"/></p>
        </c:otherwise>
    </c:choose>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>