package com.comp3820sef.webapp.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "VOTES")
public class Vote {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int voteId;

    @ManyToOne
    @JoinColumn(name = "Poll_Id", nullable = false)
    private Polls polls;

    @ManyToOne
    @JoinColumn(name = "user_Id", nullable = false)
    private Users user;

    @ManyToOne
    @JoinColumn(name = "option_id", nullable = false)
    private PollOptions option;

    @Column(name = "created_at", nullable = false)
    private Date createAt;

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public int getVoteId() {
        return voteId;
    }

    public void setVoteId(int voteId) {
        this.voteId = voteId;
    }

    public Polls getPolls() {
        return polls;
    }

    public void setPolls(Polls polls) {
        this.polls = polls;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public PollOptions getOption() {
        return option;
    }

    public Integer getOptionId() {
        return option.getOptionId();
    }

    public void setOptionId(int optionId) {
        this.option.setOptionId(optionId);
    }

    public void setOption(PollOptions option) {
        this.option = option;
    }


}
