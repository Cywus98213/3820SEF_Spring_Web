
-- Insert dummy data into Users
INSERT INTO Users (fullName, username, password, email, phoneNumber, roles) VALUES
       ('John Doe', 'johndoe', 'password123', 'johndoe@example.com', '1234567890', 'Student'),
       ('Jane Smith', 'janesmith', 'securepass', 'janesmith@example.com', '0987654321', 'Teacher'),
       ('Emily Davis', 'emilydavis', 'mypassword', 'emilydavis@example.com', NULL, 'Student');

-- Insert dummy data into Courses
INSERT INTO Courses (course_name) VALUES
       ('Introduction to Programming'),
       ('Advanced Databases'),
       ('Web Development');

-- Insert dummy data into Lectures
INSERT INTO Lectures (course_id, lecture_title, lecture_notes_link, lecture_comment) VALUES
       (1, 'Variables and Data Types', 'http://example.com/notes1', 'Covering basics of variables'),
       (2, 'Normalization Techniques', 'http://example.com/notes2', 'Focus on database optimization'),
       (3, 'HTML and CSS Basics', 'http://example.com/notes3', 'Introduction to web design');

-- Insert dummy data into Polls
INSERT INTO Polls (lecture_id, poll_question) VALUES
      (1, 'What is your preferred programming language?'),
      (2, 'What is the best database type?');

-- Insert dummy data into PollOptions
INSERT INTO PollOptions (poll_id, option_text, vote_count) VALUES
       (1, 'Python', 50),
       (1, 'JavaScript', 30),
       (2, 'SQL', 40),
       (2, 'NoSQL', 20);

-- Insert dummy data into PollComments
INSERT INTO PollComments (poll_id, user_id, comment_text) VALUES
       (1, 1, 'Python is beginner-friendly and versatile.'),
       (1, 2, 'JavaScript is essential for web development.'),
       (2, 3, 'SQL is widely used and has strong community support.');



