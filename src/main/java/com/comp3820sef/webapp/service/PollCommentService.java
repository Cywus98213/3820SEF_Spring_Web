package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.PollComments;
import com.comp3820sef.webapp.entity.Polls;
import com.comp3820sef.webapp.entity.Users;
import com.comp3820sef.webapp.repository.PollCommentsRepository;
import com.comp3820sef.webapp.repository.PollsRepository;
import com.comp3820sef.webapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PollCommentService {

    @Autowired
    private PollCommentsRepository pollCommentsRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PollsRepository pollsRepository;

    public List<PollComments> findPollCommentsByPollId(int pollId) {
        return pollCommentsRepository.findPollCommentsByPoll_PollId(pollId);
    }

    public void addPollComment(int pollId, int userId, String commentText) {

        Users user = userRepository.findById(userId).orElseThrow(
                () -> new RuntimeException("User not found")
        );

        Polls poll = pollsRepository.findById(pollId).orElseThrow(
                () -> new RuntimeException("Poll not found")
        );


        PollComments pollComment = new PollComments();
        pollComment.setCommentText(commentText);
        pollComment.setPoll(poll);
        pollComment.setUser(user);
        pollComment.setCreateAt(new Date());
        pollCommentsRepository.save(pollComment);
    }
}
