<!DOCTYPE html>
<html lang="en">
<head>
    <title>Poll</title>
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

        .subCon{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
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

        .options-container {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin: 2.5rem 0;
        }

        .option-btn {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.25rem 1.5rem;
            background: #f8fafc;
            border: 2px solid transparent;
            border-radius: 12px;
            color: var(--text-dark);
            font-weight: 500;
            text-align: left;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 3px 9px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
        }

        .option-btn:hover:not(:disabled) {
            background: #eff6ff;
            transform: translateY(-2px);
            border-color: var(--primary-color);
            box-shadow: 0 6px 18px rgba(59, 130, 246, 0.1);
        }

        .option-btn:disabled {
            background: #f1f5f9;
            color: #94a3b8;
            cursor: not-allowed;
        }

        .vote-count {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 600;
            color: var(--primary-color);
            background: rgba(219, 234, 254, 0.5);
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.9em;
            min-width: 80px;
            justify-content: center;
        }

        .btn-edit {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: var(--primary-color);
            color: white;
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            transition: all 0.2s ease;
            text-decoration: none;
            margin-top: 2rem;
            border: 2px solid transparent;
        }

        .btn-edit:hover {
            background: var(--accent-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
        }

        .progress-bar {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 3px;
            background: var(--success-green);
            transition: width 0.8s ease;
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

        .comment-form textarea {
            background: var(--input-bg);
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 1rem;
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            width: 100%;
            resize: vertical;
        }

        .comment-form textarea:focus {
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
            border-color: transparent;
        }

        .btn-success-green {
            background: var(--success-green);
            color: white;
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

            .option-btn {
                padding: 1rem;
                flex-direction: column;
                align-items: flex-start;
                gap: 0.75rem;
            }

            .vote-count {
                align-self: flex-end;
            }
        }
    </style>
    <script>
        function enableVotingButtons() {
            const votingButtons = document.querySelectorAll('.option-btn');
            votingButtons.forEach(button => {
                button.disabled = false;
            });
            const editButton = document.querySelector('.btn-edit');
            editButton.style.display = 'none';
        }

        function toggleCommentForm() {
            const form = document.getElementById('commentForm');
            const btn = document.getElementById('addCommentBtn');
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
            btn.innerHTML = form.style.display === 'none'
                ? '<i class="fas fa-plus me-2"></i>Add Comment'
                : '<i class="fas fa-times me-2"></i>Cancel';
        }
    </script>
</head>
<body>
<div class="container">

    <a href="/" class="btn-back">
        <i class="fas fa-arrow-left"></i>
        <span>Back</span>
    </a>


    <h1>${poll.pollQuestion}</h1>


    <form action="/poll/${poll.pollId}/vote" method="post">
        <div class="options-container">
            <c:forEach items="${options}" var="option">
                <button type="submit"
                        name="optionId"
                        value="${option.optionId}"
                        class="option-btn"
                    ${userVote != null ? 'disabled' : ''}>
                    <span>${option.optionText}</span>
                    <span class="vote-count">
                        <i class="fas fa-chart-bar"></i>
                        ${option.voteCount}
                    </span>
                    <div class="progress-bar" style="width: ${(option.voteCount/totalVotes)*100}%"></div>
                </button>
            </c:forEach>
        </div>
    </form>

    <div class="text-center">
        <c:if test="${userVote != null}">
            <button class="btn-edit" onclick="enableVotingButtons()">
                <i class="fas fa-edit me-2"></i>
                Edit Vote
            </button>
        </c:if>
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
        <form id="commentForm" action="/poll/addPollComment" method="POST" class="comment-form" style="display: none;">
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
            <input type="hidden" name="pollId" value="${pollId}">
        </form>

        <!-- Comments List -->
        <c:choose>
            <c:when test="${not empty pollComments}">
                <div class="comment-list">
                    <c:forEach var="comment" items="${pollComments}">
                        <div class="comment">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <div class="d-flex align-items-center gap-2">
                                    <strong>${comment.user.username}</strong>
                                    <c:if test="${comment.user.roles == 'teacher'}">
                                        <i class="fas fa-check-circle" style="color: var(--success-green); font-size: 0.9em;"></i>
                                    </c:if>
                                </div>
                                <small class="text-muted">${comment.createAt}</small>
                            </div>
                            <div>
                                <p class="mb-0" id="comment-text-${comment.pollCommentId}">
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