package com.comp3820sef.webapp.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "POLLOPTIONS")
public class PollOptions {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "option_id")
    private int optionId;

    @ManyToOne
    @JoinColumn(name = "poll_id", nullable = false)
    private Polls polls;

    @Column(name = "option_text")
    private String optionText;

    private int voteCount;

    public int getVoteCount() {
        return voteCount;
    }

    public void setVoteCount(int voteCount) {
        this.voteCount = voteCount;
    }

    public String getOptionText() {
        return optionText;
    }

    public void setOptionText(String optionText) {
        this.optionText = optionText;
    }

    public Polls getPolls() {
        return polls;
    }

    public void setPolls(Polls polls) {
        this.polls = polls;
    }

    public int getOptionId() {
        return optionId;
    }

    public void setOptionId(int optionId) {
        this.optionId = optionId;
    }


}
