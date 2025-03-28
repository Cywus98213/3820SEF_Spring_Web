CREATE TABLE  Users (
        user_id INT PRIMARY KEY AUTO_INCREMENT,
        fullName VARCHAR(255) NOT NULL,
        username VARCHAR(255) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE,
        phoneNumber VARCHAR(15),
        roles VARCHAR(255) NOT NULL
);

CREATE TABLE Courses (
        course_id INT PRIMARY KEY AUTO_INCREMENT,
        course_name VARCHAR(255) NOT NULL
);

CREATE TABLE Lectures (
        lecture_id INT PRIMARY KEY AUTO_INCREMENT,
        course_id INT NOT NULL,
        lecture_title VARCHAR(255) NOT NULL,
        lecture_notes_link VARCHAR(255),
        lecture_comment VARCHAR(255),
        FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

CREATE TABLE Polls (
        poll_id INT PRIMARY KEY AUTO_INCREMENT,
        lecture_id INT NOT NULL,
        poll_question VARCHAR(255) NOT NULL,
        FOREIGN KEY (lecture_id) REFERENCES Lectures(lecture_id) ON DELETE CASCADE
);

CREATE TABLE  PollOptions (
        option_id INT PRIMARY KEY AUTO_INCREMENT,
        poll_id INT NOT NULL,
        option_text VARCHAR(255) NOT NULL,
        vote_count INT DEFAULT 0,
        FOREIGN KEY (poll_id) REFERENCES Polls(poll_id) ON DELETE CASCADE
);


CREATE TABLE  PollComments (
         comment_id INT PRIMARY KEY AUTO_INCREMENT,
         poll_id INT NOT NULL,
         user_id INT NOT NULL,
         comment_text TEXT NOT NULL,
         FOREIGN KEY (poll_id) REFERENCES Polls(poll_id) ON DELETE CASCADE,
         FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);




