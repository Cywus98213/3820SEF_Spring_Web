package com.comp3820sef.webapp.entity;


import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "POLLCOMMENTS")
public class PollComments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "comment_id", unique = true, nullable = false)
    private int pollCommentId;

    @ManyToOne
    @JoinColumn(name = "poll_id")
    private Polls poll;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

    @Column(name = "comment_text", nullable = false)
    private String commentText;

    @Column(name = "created_at", nullable = false)
    private Date createAt;

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public int getPollCommentId() {
        return pollCommentId;
    }

    public void setPollCommentId(int pollCommentId) {
        this.pollCommentId = pollCommentId;
    }

    public Polls getPoll() {
        return poll;
    }

    public void setPoll(Polls poll) {
        this.poll = poll;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }
}
