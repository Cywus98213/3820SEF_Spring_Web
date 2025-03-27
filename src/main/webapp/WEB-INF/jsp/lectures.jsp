<!DOCTYPE html>
<html>
<head>
    <title>Lectures</title>
</head>
<body>
<h1>Lectures</h1>
<ul>
    <c:forEach var="lecture" items="${lectures}">
        <li>
                ${lecture.lectureTitle}
            <a href="${lecture.lectureNotesLink}">Download Notes</a>
        </li>
    </c:forEach>
</ul>
</body>
</html>