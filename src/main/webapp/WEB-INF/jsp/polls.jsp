<!DOCTYPE html>
<html>
<head>
    <title>Lecture Polls</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Polls for Lecture</h2>

    <div class="mt-4">
        <h3>${lecture.lectureTitle}</h3>
        <hr>

        <h4>Polls</h4>
        <c:choose>
            <c:when test="${not empty polls}">
                <ul class="list-group">
                    <c:forEach var="poll" items="${polls}">
                        <li class="list-group-item">
                            <strong>${poll.pollQuestion}</strong>
                            <a href="/poll/${poll.pollId}" class="btn btn-outline-primary btn-sm ms-2">View Poll</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
                <p class="text-danger">No polls available for this lecture.</p>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="mt-4">
        <a href="/course/${course.courseId}" class="btn btn-secondary">Back to Course</a>
    </div>
</div>
</body>
</html>
