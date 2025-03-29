package com.comp3820sef.webapp.repository;

import com.comp3820sef.webapp.entity.LectureComments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LectureCommentsRepository extends JpaRepository<LectureComments, Integer> {
    List<LectureComments> findByLectureLectureId(int lectureId);
}
