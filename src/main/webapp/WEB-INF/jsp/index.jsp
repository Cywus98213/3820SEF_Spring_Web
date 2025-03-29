<!DOCTYPE html>
<html lang="en">
<head>
    <title>Index</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f0f9ff, #ffffff);
            min-height: 100vh;
            padding: 2rem 0;
        }

        .container {
            max-width: 900px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin: 0 auto;
            transition: transform 0.3s ease;
        }

        h2 {
            color: #1e40af;
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
            padding-bottom: 1rem;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 120px;
            height: 3px;
            background: linear-gradient(90deg, #3b82f6, #1e40af);
        }

        h3 {
            color: #1e293b;
            font-weight: 700;
            margin: 2rem 0 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #e2e8f0;
        }

        .list-group-item {
            border: none;
            border-radius: 8px;
            margin-bottom: 0.5rem;
            padding: 1.25rem;
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            background-color: #f8fafc;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .list-group-item:hover {
            background-color: #eff6ff;
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        .list-group-item a {
            color: #1e293b;
            font-weight: 500;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .list-group-item:hover a {
            color: #1e40af;
        }

        .btn-danger {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            border: none;
            border-radius: 8px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.2s ease;
        }

        .btn-danger:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 6px rgba(220, 38, 38, 0.2);
        }

        .no-content {
            color: #64748b;
            font-style: italic;
            padding: 1.5rem;
            text-align: center;
            background: #f8fafc;
            border-radius: 8px;
            border: 2px dashed #e2e8f0;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>COMP3810SEF: Design and Development</h2>

    <div class="text-end mb-4">
        <form action="/logout" method="POST">
            <button type="submit" class="btn btn-danger">Log Out</button>
        </form>
    </div>

    <!-- Lectures Section -->
    <h3>📚 Lectures</h3>
    <c:choose>
        <c:when test="${not empty lectures}">
            <ul class="list-group">
                <c:forEach var="lecture" items="${lectures}">
                    <li class="list-group-item">
                        <a href="/lecture/${lecture.lectureId}">
                            📖 ${lecture.lectureTitle}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <p class="no-content">No lectures available</p>
        </c:otherwise>
    </c:choose>

    <!-- Polls Section -->
    <h3>📋 Polls</h3>
    <c:choose>
        <c:when test="${not empty polls}">
            <ul class="list-group">
                <c:forEach var="poll" items="${polls}">
                    <li class="list-group-item">
                        <a href="/poll/${poll.pollId}">
                            📊 ${poll.pollQuestion}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <p class="no-content">No polls available</p>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>