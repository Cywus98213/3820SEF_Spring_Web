package com.comp3820sef.webapp.repository;

import com.comp3820sef.webapp.entity.PollOptions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PollOptionRepository extends JpaRepository<PollOptions, Integer> {
    List<PollOptions> findByPollsPollId(int pollId);
}
