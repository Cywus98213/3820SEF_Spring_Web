<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title><spring:message code="history.title"/></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Use the same CSS variables and base styles from previous pages */
        :root {
            --primary-color: #2563eb;
            --accent-color: #3b82f6;
            --text-dark: #1e293b;
            --danger-red: #ef4444;
            --success-green: #22c55e;
            --input-bg: #f8fafc;
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
            padding: 3.5rem;
            margin: 0 auto;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: var(--text-dark);
            font-weight: 800;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 1.5rem;
            font-size: 2.25rem;
            text-align: center;
            padding-top: 1.5rem;
        }

        h1::after {
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

        .vote-item {
            padding: 1.5rem;
            background: #f8fafc;
            border-radius: 12px;
            margin-bottom: 1rem;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.03);
            transition: all 0.2s ease;
        }

        .vote-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        .vote-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .vote-option {
            color: var(--primary-color);
            font-weight: 500;
            background: rgba(219, 234, 254, 0.5);
            padding: 0.5rem 1rem;
            border-radius: 6px;
            display: inline-block;
        }

        .no-content {
            color: #64748b;
            font-style: italic;
            padding: 1.5rem;
            text-align: center;
            background: #f8fafc;
            border-radius: 12px;
            border: 2px dashed #e2e8f0;
            margin: 1rem 0;
        }

        .btn-back {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: var(--primary-color);
            color: white;
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.2s ease;
            margin-bottom: 2rem;
            border: 2px solid transparent;
        }

        .btn-back:hover {
            background: var(--accent-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
        }

        @media (max-width: 768px) {
            .container {
                padding: 2rem;
                border-radius: 16px;
            }

            h1 {
                font-size: 1.75rem;
                margin-bottom: 1.5rem;
            }

            .vote-meta {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <a href="/user/setting" class="btn-back">
        <i class="fas fa-arrow-left"></i>
        <span><spring:message code="history.back"/></span>
    </a>

    <h1><spring:message code="history.vote.title"/></h1>

    <c:choose>
        <c:when test="${not empty votes}">
            <div class="vote-list">
                <c:forEach var="vote" items="${votes}">
                    <div class="vote-item">
                        <div class="vote-meta">
                            <div class="user-info">
                                <strong>${vote.polls.pollQuestion}</strong>
                            </div>
                            <small class="text-muted">${vote.createAt}</small>
                        </div>
                        <div class="vote-option">
                            <i class="fas fa-vote-yea me-2"></i>
                                ${vote.option.optionText}
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-content"><spring:message code="history.vote.empty"/></div>
        </c:otherwise>
    </c:choose>

    <h1><spring:message code="history.lecture.comments.title"/></h1>

    <c:choose>
        <c:when test="${not empty lectureComment}">
            <div class="vote-list">
                <c:forEach var="comment" items="${lectureComment}">
                    <div class="vote-item">
                        <div class="vote-meta">
                            <div class="user-info">
                                <strong>${comment.lecture.lectureTitle}</strong>
                            </div>
                            <small class="text-muted">${comment.createAt}</small>
                        </div>
                        <div class="vote-option">
                            <i class="fas fa-comment me-2"></i>
                                ${comment.commentText}
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-content"><spring:message code="history.comments.empty"/></div>
        </c:otherwise>
    </c:choose>

    <h1><spring:message code="history.poll.comments.title"/></h1>

    <c:choose>
        <c:when test="${not empty pollComment}">
            <div class="vote-list">
                <c:forEach var="comment" items="${pollComment}">
                    <div class="vote-item">
                        <div class="vote-meta">
                            <div class="user-info">
                                <strong>${comment.poll.pollQuestion}</strong>
                            </div>
                            <small class="text-muted">${comment.createAt}</small>
                        </div>
                        <div class="vote-option">
                            <i class="fas fa-comment me-2"></i>
                                ${comment.commentText}
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-content"><spring:message code="history.comments.empty"/></div>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>