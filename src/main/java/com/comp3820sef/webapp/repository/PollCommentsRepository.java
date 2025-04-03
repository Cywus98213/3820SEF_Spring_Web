package com.comp3820sef.webapp.repository;

import com.comp3820sef.webapp.entity.PollComments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PollCommentsRepository extends JpaRepository<PollComments, Integer> {

    List<PollComments> findPollCommentsByPoll_PollId(int pollPollId);

    List<PollComments> findCommentByUser_UserId(int userId);
}
