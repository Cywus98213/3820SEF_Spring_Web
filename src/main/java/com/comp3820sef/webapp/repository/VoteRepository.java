package com.comp3820sef.webapp.repository;

import com.comp3820sef.webapp.entity.Vote;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface VoteRepository extends JpaRepository<Vote, Integer> {

    Optional<Vote> findByPollsPollIdAndUserUserId(int pollId, int userId);

    List<Vote> findVoteByUser_UserId(int userId);
}
