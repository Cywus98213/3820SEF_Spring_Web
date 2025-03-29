INSERT INTO Users (full_name, username, password, email, phone_number, roles) VALUES
          ('Alice Johnson', 'alice123', 'securepassword1', 'alice@example.com', '1234567890', 'student'),
          ('Bob Smith', 'bob_teacher', 'securepassword2', 'bob@example.com', '0987654321', 'teacher'),
          ('Charlie Brown', 'charlie_b', 'securepassword3', 'charlie@example.com', NULL, 'student'),
          ('Diana Prince', 'diana_teacher', 'securepassword4', 'diana@example.com', '9876543210', 'teacher');



INSERT INTO Lectures (lecture_title) VALUES
          ('Introduction to Programming'),
          ('Advanced Database Design'),
          ('Machine Learning Basics'),
          ('Web Development Best Practices');


INSERT INTO LectureNotes (lecture_id, note_link) VALUES
         (1, 'https://example.com/notes/programming_intro.pdf'),
         (2, 'https://example.com/notes/db_design.pdf'),
         (3, 'https://example.com/notes/machine_learning.pdf'),
         (4, 'https://example.com/notes/web_development.pdf');



INSERT INTO LectureComment (lecture_id, user_id, comment_text) VALUES
          (1, 1, 'This lecture was very informative. I finally understood loops!'),
          (2, 3, 'Can we have another session on normalization?'),
          (3, 1, 'The resources shared were amazing. Thank you!'),
          (4, 2, 'Looking forward to the next lecture.');



INSERT INTO Polls (poll_question) VALUES
        ('What is your favorite programming language?'),
        ('How would you rate this lecture?'),
        ('What topics should be covered next?');



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


INSERT INTO PollComments (poll_id, user_id, comment_text) VALUES
       (1, 1, 'Python is great for beginners!'),
       (1, 3, 'I like Java because it is versatile.'),
       (2, 2, 'The lecture was good, but I’d like more practical examples.'),
       (3, 4, 'Frontend development would be super helpful.');

