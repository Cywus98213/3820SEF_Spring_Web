<!DOCTYPE html>
<html>
<head>
    <title>Course Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Course Details</h2>

    <div class="mt-4">
        <h3>${course.courseName}</h3>
        <p><strong>Course ID:</strong> ${course.courseId}</p>
        <hr>

        <h4 class="mt-4">Lectures</h4>
        <c:choose>
            <c:when test="${not empty lectures}">
                <ul class="list-group">
                    <c:forEach var="lecture" items="${lectures}">
                        <li class="list-group-item">
                            <strong>${lecture.lectureTitle}</strong><br>
                            <a href="${lecture.lectureNotesLink}" target="_blank" class="text-decoration-none">Lecture Notes</a><br>
                            <p class="mt-2">${lecture.lectureComment}</p>
                            <a href="/course/${course.courseId}/lecture/${lecture.lectureId}/polls" class="btn btn-outline-secondary mt-2">View Polls</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
                <p class="text-danger">No lectures available for this course.</p>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="mt-4">
        <a href="/" class="btn btn-primary">Back to Home</a>
    </div>
</div>
</body>
</html>
