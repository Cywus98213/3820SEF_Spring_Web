package com.comp3820sef.webapp.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Polls") // Maps the entity to the Polls table
public class Polls {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "poll_id")
    private int pollId;

    private String pollQuestion;

    @ManyToOne
    @JoinColumn(name = "lecture_id", nullable = false)
    private Lectures lecture;


    public int getPollId() {
        return pollId;
    }


    public void setPollId(int pollId) {
        this.pollId = pollId;
    }

    public String getPollQuestion() {
        return pollQuestion;
    }

    public void setPollQuestion(String pollQuestion) {
        this.pollQuestion = pollQuestion;
    }

    public Lectures getLecture() {
        return lecture;
    }

    public void setLecture(Lectures lecture) {
        this.lecture = lecture;
    }
}
