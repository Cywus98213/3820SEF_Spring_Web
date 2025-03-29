package com.comp3820sef.webapp.repository;
import com.comp3820sef.webapp.entity.LectureNotes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LectureNotesRepository extends JpaRepository<LectureNotes, Integer> {
    List<LectureNotes> findByLectureLectureId(int lectureId);
}
