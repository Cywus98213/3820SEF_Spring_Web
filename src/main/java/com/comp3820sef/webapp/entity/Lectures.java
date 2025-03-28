package com.comp3820sef.webapp.entity;

import jakarta.persistence.*;

@Entity
public class Lectures {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int lectureId;

    @ManyToOne
    @JoinColumn(name = "courseId")
    private Courses course;

    private String lectureTitle;
    private String lectureNotesLink;
    private String lectureComment;

    public Courses getCourse() {
        return course;
    }

    public void setCourse(Courses course) {
        this.course = course;
    }

    // Getter for courseId from course
    public int getCourseId() {
        return course.getCourseId();
    }

    public int getLectureId() {
        return lectureId;
    }

    public void setLectureId(int lectureId) {
        this.lectureId = lectureId;
    }

    public String getLectureComment() {
        return lectureComment;
    }

    public void setLectureComment(String lectureComment) {
        this.lectureComment = lectureComment;
    }

    public String getLectureNotesLink() {
        return lectureNotesLink;
    }

    public void setLectureNotesLink(String lectureNotesLink) {
        this.lectureNotesLink = lectureNotesLink;
    }

    public String getLectureTitle() {
        return lectureTitle;
    }

    public void setLectureTitle(String lectureTitle) {
        this.lectureTitle = lectureTitle;
    }
}
