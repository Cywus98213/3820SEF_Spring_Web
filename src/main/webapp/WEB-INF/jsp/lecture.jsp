<!DOCTYPE html>
<html lang="en">
<head>
    <title>Lecture Material</title>
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
            --edit-orange: #f59e0b;
            --input-bg: #f8fafc;
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

        .btn-success {
            background: linear-gradient(135deg, var(--success-green), #16a34a);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
        }

        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
            opacity: 0.92;
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

        .btn-teacher {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            font-size: 0.95rem;
        }

        .section-heading {
            color: var(--text-dark);
            font-weight: 700;
            margin: 2rem 0 1rem;
            padding: 1rem 0;
            display: flex;
            align-items: center;
            gap: 1rem;
            font-size: 1.25rem;
            justify-content: space-between;
            border-bottom: 2px solid rgba(59, 130, 246, 0.1);
        }

        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2.5rem;
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

        .btn-primary {
            background: var(--primary-color);
            color: white;
        }

        .btn-back {
            background: var(--primary-color);
            color: white;
        }

        .btn-success-green {
            background: var(--success-green);
            color: white;
        }
        .btn-icon {
            padding: 0.4rem;
            border-radius: 8px;
            width: 32px;
            height: 32px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
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

        .list-group {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-top: 1rem;
        }


        .comments-section {
            margin-top: 2.5rem;
            background: #f8fafc;
            border-radius: 14px;
            padding: 1.5rem 2rem;
        }

        .comment-form {
            background: white;
            border-radius: 14px;
            padding: 1.5rem;
            margin: 1.5rem 0;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.03);
        }

        .comment-form textarea,
        .edit-comment-form textarea {
            background: var(--input-bg);
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 1rem;
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            width: 100%;
            resize: vertical;
        }

        .comment-form textarea:focus,
        .edit-comment-form textarea:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
        }

        .comment {
            padding: 1.5rem;
            background: white;
            border-radius: 12px;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.03);
            transition: all 0.2s ease;
        }

        .comment:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
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

        @media (max-width: 768px) {
            .container {
                padding: 2rem;
                border-radius: 16px;
            }

            h1 {
                font-size: 1.75rem;
                margin-bottom: 1.5rem;
            }

            .header-actions {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }

            .comments-section {
                padding: 1.25rem;
            }
        }
    </style>
    <script>
        // Toggle main comment form
        function toggleCommentForm() {
            const form = document.getElementById('commentForm');
            const btn = document.getElementById('addCommentBtn');
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
            btn.innerHTML = form.style.display === 'none'
                ? '<i class="fas fa-plus me-2"></i>Add Comment'
                : '<i class="fas fa-times me-2"></i>Cancel';
        }
        function toggleUploadForm() {
            const form = document.getElementById('fileForm');
            const btn = document.getElementById('uploadBtn');
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
            btn.innerHTML = form.style.display === 'none'
                ? '<i class="fas fa-plus me-2"></i>Upload'
                : '<i class="fas fa-times me-2"></i>Cancel';
        }
    </script>
</head>
<body>
<div class="container">
    <div class="header-actions">
        <a href="/" class="btn-action btn-back">
            <i class="fas fa-arrow-left"></i>
            Back to Lectures
        </a>
    </div>

    <h1>${lecture.lectureTitle}</h1>

    <div class="materials-section">
        <div class="section-heading">
            <div class="d-flex align-items-center gap-2">
                <i class="fas fa-book-open"></i>
                Notes
            </div>
            <c:if test="${role == 'teacher'}">
                <button class="btn-action btn-primary btn-teacher" id="uploadBtn" onclick="toggleUploadForm()">
                    <i class="fas fa-cloud-upload me-2"></i>
                    Upload Files
                </button>
            </c:if>
        </div>

        <!-- File Upload -->
        <form id="fileForm" action="/lecture/uploadFile" method="POST" class="form" enctype="multipart/form-data" style="display: none;">
            <div class="mb-3">
                <input type="file" class="form-control" name="lectureFile" id="lectureFile" required>
                <small class="form-text text-muted">Upload lecture materials (PDF, DOCX, etc.)</small>
            </div>

            <!-- Submit Button -->
            <div class="d-flex justify-content-end gap-2">
                <button type="submit" class="btn-auth btn-success">
                    <i class="fas fa-check me-2"></i>
                    Upload
                </button>
            </div>
            <input type="hidden" name="lectureId" value=${lecture.lectureId}>
        </form>
        <c:choose>
            <c:when test="${not empty lectureNotes}">
                <div class="list-group">
                    <c:forEach var="lectureNote" items="${lectureNotes}">
                        <div class="list-group-item">
                            <i class="fas fa-file-download"></i>
                            <a href="${lectureNote.lectureNoteLink}" class="text-decoration-none flex-grow-1">
                                    ${lectureNote.lectureNoteTitle}
                            </a>
                            <c:if test="${role == 'teacher'}">
                                <form action="/lecture/deleteNote" method="POST" class="d-inline">
                                    <input type="hidden" name="lectureId" value="${lecture.lectureId}">
                                    <input type="hidden" name="noteId" value="${lectureNote.lectureNoteId}">
                                    <input type="hidden" name="_method" value="DELETE">
                                    <button type="submit" class="btn-action btn-danger btn-icon" title="Delete Note">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-content">No lecture materials available</div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Comments Section -->
    <div class="comments-section">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="mb-0">
                <i class="fas fa-comments me-2"></i>
                Discussion
            </h3>
            <button class="btn-action btn-primary" id="addCommentBtn" onclick="toggleCommentForm()">
                <i class="fas fa-plus me-2"></i>
                Add Comment
            </button>
        </div>

        <!-- Add Comment Form -->
        <form id="commentForm" action="/lecture/addcomment" method="POST" class="comment-form" style="display: none;">
            <div class="mb-3">
                <textarea class="form-control" name="commentText" id="commentText" rows="4"
                          placeholder="Write your comment here..." required></textarea>
            </div>
            <div class="d-flex justify-content-end gap-2">
                <button type="submit" class="btn-action btn-success-green">
                    <i class="fas fa-check me-2"></i>
                    Post Comment
                </button>
            </div>
            <input type="hidden" name="lectureId" value="${lecture.lectureId}">
        </form>

        <!-- Comments List -->
        <c:choose>
            <c:when test="${not empty lectureComments}">
                <div class="comment-list">

                    <c:forEach var="comment" items="${lectureComments}">
                        <div class="comment">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <div class="d-flex align-items-center gap-2">
                                    <strong>${comment.user.username}</strong>
                                    <c:if test="${comment.user.roles == 'teacher'}">
                                        <i class="fas fa-check-circle" style="color: var(--success-green); font-size: 0.9em;"></i>
                                    </c:if>

                                    <!-- Teacher Only -->
                                    <!-- delete comment -->
                                    <c:if test="${role == 'teacher'}">
                                        <form action="/lecture/deleteComment" method="POST" class="d-inline">
                                            <input type="hidden" name="lectureId" value="${lecture.lectureId}">
                                            <input type="hidden" name="commentId" value="${comment.lectureCommentId}">
                                            <input type="hidden" name="_method" value="DELETE">
                                            <button type="submit" class="btn-action btn-danger btn-icon" title="Delete comment">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </c:if>
                                </div>
                                <small class="text-muted">${comment.createAt}</small>
                            </div>
                            <!-- Original Comment Text -->
                            <div>
                                <p class="mb-0" id="comment-text-${comment.lectureCommentId}">
                                        ${comment.commentText}
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-content">No comments yet. Be the first to share your thoughts!</div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>