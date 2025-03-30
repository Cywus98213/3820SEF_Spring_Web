package com.comp3820sef.webapp.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "LECTURENOTES")
public class LectureNotes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="note_id", nullable=false)
    private int lectureNoteId;

    @ManyToOne
    @JoinColumn(name = "lecture_id", nullable = false)
    private Lectures lecture;


    @Column(name = "note_link", nullable = false, length = 500)
    private String lectureNoteLink;

    @Column(name = "note_title", nullable = false, length = 50)
    private String lectureNoteTitle;

    public String getLectureNoteTitle() {
        return lectureNoteTitle;
    }

    public void setLectureNoteTitle(String lectureNoteTitle) {
        this.lectureNoteTitle = lectureNoteTitle;
    }

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
