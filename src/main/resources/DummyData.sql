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



INSERT INTO PollOptions (poll_id, option_text, vote_count) VALUES
        (1, 'Python', 10),
        (1, 'Java', 5),
        (1, 'C++', 3),
        (2, 'Excellent', 8),
        (2, 'Good', 6),
        (2, 'Average', 4),
        (3, 'Frontend Development', 7),
        (3, 'Backend Development', 5),
        (3, 'Cloud Computing', 3);


INSERT INTO Votes (poll_id, user_id, option_id) VALUES
        (1, 1, 1), -- Alice voted for Python
        (1, 3, 2), -- Charlie voted for Java
        (2, 1, 4), -- Alice rated the lecture "Excellent"
        (2, 2, 5), -- Bob rated the lecture "Good"
        (3, 1, 7), -- Alice chose "Frontend Development"
        (3, 2, 8); -- Bob chose "Backend Development"



INSERT INTO PollComments (poll_id, user_id, comment_text) VALUES
       (1, 1, 'Python is great for beginners!'),
       (1, 3, 'I like Java because it is versatile.'),
       (2, 2, 'The lecture was good, but I’d like more practical examples.'),
       (3, 4, 'Frontend development would be super helpful.');

