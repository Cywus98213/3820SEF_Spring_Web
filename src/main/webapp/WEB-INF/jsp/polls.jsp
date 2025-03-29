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
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f0f9ff, #ffffff);
            min-height: 100vh;
            padding: 2rem;
            color: var(--text-dark);
        }

        .container {
            max-width: 800px;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            margin: 0 auto;
            transition: transform 0.3s ease;
        }

        h1 {
            color: var(--text-dark);
            font-weight: 800;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 1.5rem;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 120px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
            border-radius: 2px;
        }

        .btn-back {
            display: inline-block;
            background: var(--primary-color);
            color: #fff;
            font-weight: 600;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            transition: background 0.2s ease, transform 0.2s;
        }

        .btn-back:hover {
            background: var(--accent-color);
            transform: translateY(-3px);
        }

        .options-container {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-top: 2rem;
        }

        .option-btn {
            padding: 1.25rem;
            background: #f8fafc;
            border: none;
            border-radius: 12px;
            color: var(--text-dark);
            font-weight: 500;
            text-align: left;
            position: relative;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        }

        .option-btn:hover {
            background: #eff6ff;
            transform: translateY(-3px);
            box-shadow: 0 4px 6px rgba(59, 130, 246, 0.1);
        }

        .vote-count {
            float: right;
            font-weight: 600;
            color: var(--primary-color);
            background: #dbeafe;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            margin-left: 1rem;
        }

        form {
            margin-top: 2rem;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Go Back Button -->
    <div class="mb-4">
        <a href="javascript:history.back()" class="btn-back">
            <i class="fas fa-arrow-left"></i> Go Back
        </a>
    </div>

    <!-- Poll Question -->
    <h1>${poll.pollQuestion}</h1>

    <!-- Poll Options -->
    <form action="${pageContext.request.contextPath}/poll/${poll.pollId}" method="post">
        <input type="hidden" name="pollId" value="${poll.pollId}">
        <div class="options-container">
            <c:forEach items="${options}" var="option">
                <button type="submit"
                        name="optionId"
                        value="${option.optionId}"
                        class="option-btn">
                        ${option.optionText}
                    <span class="vote-count">${option.voteCount} votes</span>
                </button>
            </c:forEach>
        </div>
    </form>
</div>
</body>
</html>
