package com.comp3820sef.webapp.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name = "Polls") // Maps the entity to the Polls table
public class Polls {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pollId;

    private String pollQuestion;

    @ManyToOne
    @JoinColumn(name = "lectureId", nullable = false)
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
