INSERT INTO Users (full_name, username, password, email, phone_number, roles)
VALUES
    ('Alice Johnson', 'alicej', 'password123', 'alice@example.com', '1234567890', 'student'),
    ('Bob Smith', 'bobsmith', 'password456', 'bob@example.com', '0987654321', 'student'),
    ('Charlie Brown', 'charlieb', 'password789', 'charlie@example.com', '1112223333', 'teacher');


INSERT INTO Lectures (lecture_id,lecture_title)
VALUES
    (1,'Introduction to HTML'),
    (2,'CSS Fundamentals'),
    (3,'JavaScript Basics');


INSERT INTO LectureNotes (lecture_id, note_link)
VALUES
-- Notes for Lecture 1: Introduction to HTML
(1, 'https://example.com/notes/html_basics.pdf'),
(1, 'https://example.com/notes/html_examples.docx'),

-- Notes for Lecture 2: CSS Fundamentals
(2, 'https://example.com/notes/css_properties.pdf'),
(2, 'https://example.com/notes/css_examples.docx'),

-- Notes for Lecture 3: JavaScript Basics
(3, 'https://example.com/notes/javascript_intro.pdf'),
(3, 'https://example.com/notes/javascript_examples.docx');


INSERT INTO LectureComment (lecture_id, user_id, comment_text)
VALUES
-- Comments for Lecture 1
(1, 1, 'Great lecture on HTML basics!'),
(1, 2, 'The examples were very helpful!'),
(1, 3, 'Feel free to ask questions if you have any!'),

-- Comments for Lecture 2
(2, 1, 'I loved learning about CSS properties!'),
(2, 2, 'The styling examples were awesome.'),

-- Comments for Lecture 3
(3, 3, 'JavaScript is an essential skill for web developers.');


INSERT INTO Polls (lecture_id, poll_question)
VALUES
    (1, 'What is your favorite HTML tag?'),
    (2, 'Which CSS property do you use most often?'),
    (3, 'Which JavaScript feature do you find most challenging?');


INSERT INTO PollOptions (poll_id, option_text, vote_count)
VALUES
-- Poll 1 Options: HTML tags
(1, 'div', 10),
(1, 'span', 5),
(1, 'header', 3),
(1, 'section', 2),

-- Poll 2 Options: CSS properties
(2, 'color', 8),
(2, 'margin', 5),
(2, 'padding', 6),
(2, 'display', 4),

-- Poll 3 Options: JavaScript features
(3, 'Functions', 12),
(3, 'DOM Manipulation', 7),
(3, 'Promises', 10),
(3, 'Async/Await', 4);


INSERT INTO PollComments (poll_id, user_id, comment_text)
VALUES
-- Comments for Poll 1
(1, 1, 'I use div all the time for layout.'),
(1, 2, 'header tags are my favorite for structure.'),

-- Comments for Poll 2
(2, 1, 'I love using margin for spacing!'),
(2, 2, 'Padding is great for adding space inside elements.'),

-- Comments for Poll 3
(3, 3, 'DOM Manipulation was tricky at first, but it’s really powerful.');
