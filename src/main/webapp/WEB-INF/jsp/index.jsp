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
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f0f9ff, #ffffff);
            min-height: 100vh;
            padding: 2rem;
            color: var(--text-dark);
        }

        .container {
            max-width: 900px;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.08);
            padding: 3rem;
            margin: 0 auto;
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
            display: inline-flex;
            align-items: center;
            gap: 1rem;
            font-weight: 600;
            color: var(--text-dark);
            padding: 1rem 2rem;
            border-radius: 12px;
            background: rgba(59, 130, 246, 0.1);
            border: 2px solid rgba(59, 130, 246, 0.2);
            margin-bottom: 2rem;
            width: 100%;
            justify-content: center;
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
            opacity: 0.9;
        }

        .section-heading {
            color: var(--text-dark);
            font-weight: 700;
            margin: 2.5rem 0 1.5rem;
            padding-bottom: 0.75rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            font-size: 1.5rem;
        }

        .list-group {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .list-group-item {
            padding: 1.5rem;
            background: #f8fafc;
            border: none;
            border-radius: 14px;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 3px 9px rgba(0, 0, 0, 0.03);
            display: flex;
            align-items: center;
            gap: 1rem;
            text-decoration: none;
            color: var(--text-dark);
        }

        .list-group-item:hover {
            background: #eff6ff;
            transform: translateY(-3px);
            box-shadow: 0 6px 18px rgba(59, 130, 246, 0.12);
        }

        .list-group-item i {
            width: 30px;
            text-align: center;
            font-size: 1.2rem;
        }

        .no-content {
            color: #64748b;
            font-style: italic;
            padding: 2rem;
            text-align: center;
            background: #f8fafc;
            border-radius: 12px;
            border: 2px dashed #e2e8f0;
        }

        @media (max-width: 768px) {
            .container {
                padding: 2rem;
                border-radius: 16px;
            }

            h2 {
                font-size: 1.75rem;
            }

            .auth-buttons {
                flex-direction: column;
            }
        }
    </style>
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

    <!-- Lectures Section -->
    <h3 class="section-heading">
        <i class="fas fa-book-open"></i>
        Lectures
    </h3>
    <c:choose>
        <c:when test="${not empty lectures}">
            <div class="list-group">
                <c:forEach var="lecture" items="${lectures}">
                    <a href="/lecture/${lecture.lectureId}" class="list-group-item">
                        <i class="fas fa-file-alt"></i>
                            ${lecture.lectureTitle}
                    </a>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <p class="no-content">No lectures available</p>
        </c:otherwise>
    </c:choose>

    <!-- Polls Section -->
    <h3 class="section-heading">
        <i class="fas fa-poll"></i>
        Polls
    </h3>
    <c:choose>
        <c:when test="${not empty polls}">
            <div class="list-group">
                <c:forEach var="poll" items="${polls}">
                    <a href="/poll/${poll.pollId}" class="list-group-item">
                        <i class="fas fa-chart-bar"></i>
                            ${poll.pollQuestion}
                    </a>
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