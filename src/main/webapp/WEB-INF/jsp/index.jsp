<!DOCTYPE html>
<html>
<head>
    <title>Index</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Web Applications: Design and Development</h2>

    <!-- Logout Button -->
    <div class="text-end mb-4">
        <form action="/logout" method="POST">
            <button type="submit" class="btn btn-danger">Log Out</button>
        </form>
    </div>

    <h3 class="mt-4">Courses</h3>
    <c:choose>
        <c:when test="${not empty courses}">
            <ul class="list-group">
                <c:forEach var="course" items="${courses}">
                    <li class="list-group-item">
                        <a href="/course/${course.courseId}" class="text-decoration-none">
                                ${course.courseName}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <p class="text-danger">No courses available.</p>
        </c:otherwise>
    </c:choose>

    <h3 class="mt-4">Polls</h3>
    <c:choose>
        <c:when test="${not empty polls}">
            <ul class="list-group">
                <c:forEach var="poll" items="${polls}">
                    <li class="list-group-item">
                        <a href="/poll/${poll.pollId}" class="text-decoration-none">
                                ${poll.pollQuestion}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <p class="text-danger">No polls available.</p>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
