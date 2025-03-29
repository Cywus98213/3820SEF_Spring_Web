INSERT INTO Users (full_name, username, password, email, phone_number, roles) VALUES
          ('Alice Johnson', 'alice123', 'securepassword1', 'alice@example.com', '1234567890', 'student'),
          ('Bob Smith', 'bob_teacher', 'securepassword2', 'bob@example.com', '0987654321', 'teacher'),
          ('Charlie Brown', 'charlie_b', 'securepassword3', 'charlie@example.com', NULL, 'student'),
          ('Diana Prince', 'diana_teacher', 'securepassword4', 'diana@example.com', '9876543210', 'teacher'),
          ('user test', 'user', '1234', 'user@example.com', '123367890', 'student');


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
        (1, 'Python', 0),
        (1, 'Java', 0),
        (1, 'C++', 0),
        (2, 'Excellent', 0),
        (2, 'Good', 0),
        (2, 'Average', 0),
        (3, 'Frontend Development', 0),
        (3, 'Backend Development', 0),
        (3, 'Cloud Computing', 0);



INSERT INTO PollComments (poll_id, user_id, comment_text) VALUES
       (1, 1, 'Python is great for beginners!'),
       (1, 3, 'I like Java because it is versatile.'),
       (2, 2, 'The lecture was good, but I’d like more practical examples.'),
       (3, 4, 'Frontend development would be super helpful.');

