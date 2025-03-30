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

        h1 {
            color: var(--text-dark);
            font-weight: 800;
            margin-bottom: 2.5rem;
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

        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2.5rem;
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

        .btn-edit {
            background: var(--success-green);
            color: white;
        }

        .btn-edit-comment {
            color: var(--edit-orange);
            border-color: var(--edit-orange);
        }

        .btn-danger {
            color: var(--danger-red);
            border-color: var(--danger-red);
        }

        .btn-icon {
            padding: 0.4rem;
            border-radius: 50%;
            width: 32px;
            height: 32px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
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

        .comments-section {
            margin-top: 2.5rem;
            background: #f8fafc;
            border-radius: 14px;
            padding: 1.5rem;
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
            padding: 1.25rem;
            background: white;
            border-radius: 12px;
            margin-bottom: 1rem;
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

            h1 {
                font-size: 1.75rem;
            }

            .header-actions {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }
        }
    </style>
    <script>
        function toggleCommentForm() {
            const form = document.getElementById('commentForm');
            const btn = document.getElementById('addCommentBtn');
            if (form.style.display === 'none' || form.style.display === '') {
                form.style.display = 'block';
                btn.innerHTML = '<i class="fas fa-times me-2"></i>Cancel';
                btn.classList.remove('btn-primary');
                btn.classList.add('btn-danger');
            } else {
                form.style.display = 'none';
                btn.innerHTML = '<i class="fas fa-plus me-2"></i>Add Comment';
                btn.classList.remove('btn-danger');
                btn.classList.add('btn-primary');
            }
        }

        function toggleEditForm(commentId) {
            const commentText = document.getElementById(`comment-text-${commentId}`);
            const editForm = document.getElementById(`edit-form-${commentId}`);

            if (editForm.style.display === 'none' || editForm.style.display === '') {
                commentText.style.display = 'none';
                editForm.style.display = 'block';
            } else {
                commentText.style.display = 'block';
                editForm.style.display = 'none';
            }
        }

        function cancelEdit(commentId) {
            toggleEditForm(commentId);
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
        <c:if test="${role == 'teacher'}">
            <a href="/edit-lecture?id=${lecture.lectureId}" class="btn-action btn-edit btn-icon" title="Edit Lecture">
                <i class="fas fa-edit"></i>
            </a>
        </c:if>
    </div>

    <h1>${lecture.lectureTitle}</h1>

    <!-- Lecture Materials Section -->
    <div class="materials-section">
        <h3 class="section-heading">
            <i class="fas fa-file-alt"></i>
            Lecture Materials
        </h3>
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
                                <a href="/edit-material?id=${lectureNote.lectureNoteId}" class="btn-action btn-edit btn-icon" title="Edit Material">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
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
        <form id="commentForm" action="/addcomment" method="POST" class="comment-form" style="display: none;">
            <div class="mb-3">
                <textarea class="form-control" name="commentText" id="commentText" rows="4"
                          placeholder="Write your comment here..." required></textarea>
            </div>
            <div class="d-flex justify-content-end gap-2">
                <button type="button" class="btn-action btn-danger" onclick="toggleCommentForm()">
                    Cancel
                </button>
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
                                    <!-- Edit Button for Comment Owner -->
                                    <c:if test="${userId == comment.user.userId}">
                                        <button class="btn-action btn-edit-comment btn-icon"
                                                onclick="toggleEditForm('${comment.lectureCommentId}')"
                                                title="Edit comment">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </c:if>
                                    <!-- Delete Button for Teachers -->
                                    <c:if test="${role == 'teacher'}">
                                        <form action="/delete-comment" method="POST" class="d-inline">
                                            <input type="hidden" name="commentId" value="${comment.lectureCommentId}">
                                            <button type="submit" class="btn-action btn-danger btn-icon" title="Delete comment">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </c:if>
                                </div>
                                <small class="text-muted">${comment.createAt}</small>
                            </div>
                            <p class="mb-0" id="comment-text-${comment.lectureCommentId}">${comment.commentText}</p>

                            <!-- Edit Comment Form -->
                            <form id="edit-form-${comment.lectureCommentId}"
                                  action="/update-comment"
                                  method="POST"
                                  class="edit-comment-form"
                                  style="display: none;">
                                <input type="hidden" name="commentId" value="${comment.lectureCommentId}">
                                <div class="mt-2">
                                    <textarea class="form-control"
                                    name="updatedText"
                                     rows="3">${comment.commentText}</textarea>
                                </div>
                                <div class="d-flex justify-content-end gap-2 mt-2">
                                    <button type="button"
                                            class="btn-action btn-danger btn-sm"
                                            onclick="cancelEdit('${comment.lectureCommentId}')">
                                        Cancel
                                    </button>
                                    <button type="submit"
                                            class="btn-action btn-success-green btn-sm">
                                        Save
                                    </button>
                                </div>
                            </form>
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