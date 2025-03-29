package com.comp3820sef.webapp.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "LECTURENOTES")
public class LectureNotes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int lectureNoteId;

    @ManyToOne
    @JoinColumn(name = "lecture_id", nullable = false)
    private Lectures lecture;


    @Column(name = "note_link", nullable = false, length = 500)
    private String lectureNoteLink;

    public Lectures getLecture() {
        return lecture;
    }

    public void setLecture(Lectures lecture) {
        this.lecture = lecture;
    }

    public String getLectureNoteLink() {
        return lectureNoteLink;
    }

    public void setLectureNoteLink(String lectureNoteLink) {
        this.lectureNoteLink = lectureNoteLink;
    }

    public int getLectureNoteId() {
        return lectureNoteId;
    }

    public void setLectureNoteId(int lectureNoteId) {
        this.lectureNoteId = lectureNoteId;
    }
}
