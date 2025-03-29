package com.comp3820sef.webapp.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "polls") // Maps the entity to the "polls" table
public class Polls {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "poll_id")
    private int pollId;

    @Column(name = "poll_question", nullable = false)
    private String pollQuestion;

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
}