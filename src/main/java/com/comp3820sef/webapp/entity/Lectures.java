package com.comp3820sef.webapp.entity;

import jakarta.persistence.*;

@Entity
public class Lectures {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int lectureId;

    @ManyToOne
    @JoinColumn(name = "courseId")
    private Courses course; // 確保此字段存在

    private String lectureTitle;
    private String lectureNotesLink;
    private String lectureComment;

    // Getter for course
    public Courses getCourse() {
        return course;
    }

    // Setter for course
    public void setCourse(Courses course) {
        this.course = course;
    }

    // Other Getters and Setters...
}