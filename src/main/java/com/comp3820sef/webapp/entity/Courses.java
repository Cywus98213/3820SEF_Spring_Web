package com.comp3820sef.webapp.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Courses {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int courseId;

    private String courseName;

    // Getter for courseId
    public int getCourseId() {
        return courseId;
    }

    // Setter for courseId
    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    // Getter for courseName
    public String getCourseName() {
        return courseName;
    }

    // Setter for courseName
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}