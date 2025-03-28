package com.comp3820sef.webapp.repository;

import com.comp3820sef.webapp.entity.Polls;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PollsRepository extends JpaRepository<Polls, Integer> {
    List<Polls> findPollsByLectureLectureId(int lectureId);
}
