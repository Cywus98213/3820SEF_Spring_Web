package com.comp3820sef.webapp.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "LECTURECOMMENT")
public class LectureComments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int lectureCommentId;

    @ManyToOne
    @JoinColumn(name = "lecture_id")
    private Lectures lecture;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

    @Column(name = "comment_text", nullable = false)
    private String commentText;

    private String commentDate;


    public int getLectureCommentId() {
        return lectureCommentId;
    }

    public void setLectureCommentId(int lectureCommentId) {
        this.lectureCommentId = lectureCommentId;
    }

    public Lectures getLecture() {
        return lecture;
    }

    public void setLecture(Lectures lecture) {
        this.lecture = lecture;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(String commentDate) {
        this.commentDate = commentDate;
    }
}
