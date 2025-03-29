CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    roles ENUM('student', 'teacher') NOT NULL
);

CREATE TABLE Lectures (
        lecture_id INT PRIMARY KEY AUTO_INCREMENT,
        lecture_title VARCHAR(255) NOT NULL
);

CREATE TABLE LectureNotes (
        note_id INT PRIMARY KEY AUTO_INCREMENT,
        lecture_id INT NOT NULL,
        note_link VARCHAR(500) NOT NULL,
        FOREIGN KEY (lecture_id) REFERENCES Lectures(lecture_id) ON DELETE CASCADE
);

CREATE TABLE LectureComment (
        comment_id INT PRIMARY KEY AUTO_INCREMENT,
        lecture_id INT NOT NULL,
        user_id INT NOT NULL,
        comment_text TEXT NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (lecture_id) REFERENCES Lectures(lecture_id) ON DELETE CASCADE,
        FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


CREATE TABLE Polls (
        poll_id INT PRIMARY KEY AUTO_INCREMENT,
        poll_question VARCHAR(255) NOT NULL
);

CREATE TABLE  PollOptions (
        option_id INT PRIMARY KEY AUTO_INCREMENT,
        poll_id INT NOT NULL,
        option_text VARCHAR(255) NOT NULL,
        vote_count INT DEFAULT 0,
        FOREIGN KEY (poll_id) REFERENCES Polls(poll_id) ON DELETE CASCADE
);
CREATE TABLE Votes (
        vote_id INT PRIMARY KEY AUTO_INCREMENT,
        poll_id INT NOT NULL,
        user_id INT NOT NULL,
        option_id INT NOT NULL,
        FOREIGN KEY (poll_id) REFERENCES Polls(poll_id) ON DELETE CASCADE,
        FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
        FOREIGN KEY (option_id) REFERENCES PollOptions(option_id) ON DELETE CASCADE,
        UNIQUE (poll_id, user_id) -- Ensure each user can vote only once per poll
);


CREATE TABLE  PollComments (
         comment_id INT PRIMARY KEY AUTO_INCREMENT,
         poll_id INT NOT NULL,
         user_id INT NOT NULL,
         comment_text TEXT NOT NULL,
         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
         FOREIGN KEY (poll_id) REFERENCES Polls(poll_id) ON DELETE CASCADE,
         FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);




