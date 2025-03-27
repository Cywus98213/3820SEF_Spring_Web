<!DOCTYPE html>
<html>
<head>
    <title>Index</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Web Applications: Design and Development</h2>

    <h3 class="mt-4">Courses</h3>
    <c:choose>
        <c:when test="${not empty courses}">
            <ul class="list-group">
                <c:forEach var="course" items="${courses}">
                    <li class="list-group-item">
                            ${course.courseName}
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
                            ${poll.pollQuestion}
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