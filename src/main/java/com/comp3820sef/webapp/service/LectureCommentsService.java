package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.LectureComments;
import com.comp3820sef.webapp.entity.Lectures;
import com.comp3820sef.webapp.entity.Users;
import com.comp3820sef.webapp.repository.LectureCommentsRepository;
import com.comp3820sef.webapp.repository.LecturesRepository;
import com.comp3820sef.webapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class LectureCommentsService {

    @Autowired
    private LectureCommentsRepository lectureCommentsRepository;

    @Autowired
    private LecturesRepository lecturesRepository;

    @Autowired
    private UserRepository userRepository;


    public List<LectureComments> findByLectureLectureId(int lectureId) {
        return lectureCommentsRepository.findByLectureLectureId(lectureId);
    }

    public void addComment(String commentText, int lectureId, int userId) {
        // Fetch lecture by ID
        Lectures lecture = lecturesRepository.findById(lectureId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid lecture ID"));

        // Fetch user by ID
        Users user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user ID"));

        // Create and save the comment
        LectureComments comment = new LectureComments();
        comment.setLecture(lecture);
        comment.setUser(user);
        comment.setCommentText(commentText);
        comment.setCreateAt(new Date());

        lectureCommentsRepository.save(comment);
    }

    public void updateComment(String commentText, int lectureId, int userId, int commentId) {

        Lectures lecture = lecturesRepository.findById(lectureId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid lecture ID"));

        Users user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user ID"));

        LectureComments comment = lectureCommentsRepository.findById(commentId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid comment ID"));

        comment.setCommentText(commentText);
        comment.setLecture(lecture);
        comment.setUser(user);
        comment.setCreateAt(new Date());
        lectureCommentsRepository.save(comment);
    }

}
