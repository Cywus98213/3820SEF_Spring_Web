package com.comp3820sef.webapp.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "LECTURECOMMENT")
public class LectureComments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "comment_id", unique = true, nullable = false)
    private int lectureCommentId;

    @ManyToOne
    @JoinColumn(name = "lecture_id")
    private Lectures lecture;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

    @Column(name = "comment_text", nullable = false)
    private String commentText;

    @Column(name = "created_at", nullable = false)
    private Date createAt;




    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Lectures getLecture() {
        return lecture;
    }

    public void setLecture(Lectures lecture) {
        this.lecture = lecture;
    }

    public int getLectureCommentId() {
        return lectureCommentId;
    }

    public void setLectureCommentId(int lectureCommentId) {
        this.lectureCommentId = lectureCommentId;
    }

}
