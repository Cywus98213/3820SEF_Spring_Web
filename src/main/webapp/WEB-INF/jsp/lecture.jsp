<!DOCTYPE html>
<html lang="en">
<head>
    <title>Lecture Material</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-blue: #2563eb;
            --accent-blue: #3b82f6;
            --text-dark: #1e293b;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8fafc, #f1f5f9);
            min-height: 100vh;
            padding: 2rem 0;
        }

        .container {
            max-width: 900px;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            margin: 0 auto;
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.12);
        }

        h1 {
            color: var(--text-dark);
            font-weight: 800;
            text-align: center;
            margin-bottom: 2.5rem;
            position: relative;
            padding-bottom: 1.5rem;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 120px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-blue), var(--accent-blue));
            border-radius: 2px;
        }

        h3 {
            color: var(--text-dark);
            font-weight: 700;
            margin: 2rem 0 1.5rem;
            padding-bottom: 0.75rem;
            border-bottom: 2px solid #e2e8f0;
        }

        .list-group-item {
            border: none;
            border-radius: 12px;
            margin-bottom: 0.75rem;
            padding: 1.25rem;
            background: #f8fafc;
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .list-group-item:hover {
            background: #eff6ff;
            transform: translateY(-3px);
            box-shadow: 0 4px 6px rgba(59, 130, 246, 0.1);
        }

        .list-group-item a {
            color: var(--text-dark);
            font-weight: 500;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .list-group-item:hover a {
            color: var(--primary-blue);
        }

        .comments-section {
            background: #f8fafc;
            padding: 1.5rem;
            border-radius: 12px;
            margin-top: 2rem;
        }

        .comment {
            background: white;
            border-radius: 8px;
            padding: 1.25rem;
            margin-bottom: 1.25rem;
            position: relative;
            border-left: 4px solid var(--accent-blue);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        }

        .comment strong {
            color: var(--primary-blue);
            font-weight: 600;
            font-size: 1rem;
        }

        .comment p {
            color: #64748b;
            margin: 0.5rem 0 0;
            line-height: 1.6;
        }

        .text-muted {
            color: #94a3b8 !important;
            font-size: 0.875rem;
        }

        .no-comments {
            color: #64748b;
            font-style: italic;
            padding: 2rem;
            text-align: center;
            background: #f8fafc;
            border-radius: 8px;
            border: 2px dashed #e2e8f0;
        }

        .download-icon {
            font-size: 1.25rem;
            color: var(--primary-blue);
        }

        .btn-back {
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--primary-blue);
            color: white;
            padding: 10px 20px;
            font-size: 1rem;
            font-weight: 500;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.2s ease;
            text-decoration: none;
        }

        .btn-back:hover {
            background: var(--accent-blue);
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Go Back Button -->
    <div class="mb-3">
        <a href="/" class="btn-back">
            <i class="fas fa-arrow-left me-2"></i> Go Back
        </a>
    </div>

    <!-- Lecture Title -->
    <h1>${lecture.lectureTitle}</h1>

    <!-- Lecture Notes Section -->
    <h3>📁 Lecture Materials</h3>
    <c:choose>
        <c:when test="${not empty lectureNotes}">
            <ul class="list-group mb-4">
                <c:forEach var="lectureNote" items="${lectureNotes}">
                    <li class="list-group-item">
                        <i class="fas fa-file-download download-icon"></i>
                        <a href="${lectureNote.lectureNoteLink}">
                                ${lectureNote.lectureNoteLink}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <p class="no-comments">No lecture materials available</p>
        </c:otherwise>
    </c:choose>

    <!-- Comments Section -->
    <h3>💬 Discussion</h3>
    <c:choose>
        <c:when test="${not empty lectureComments}">
            <div class="comments-section">
                <c:forEach var="comment" items="${lectureComments}">
                    <div class="comment">
                        <div class="d-flex justify-content-between align-items-center">
                            <strong>${comment.user.username}</strong>
                            <span class="text-muted">${comment.createAt}</span>
                        </div>
                        <p>${comment.commentText}</p>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <p class="no-comments">Be the first to comment</p>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
