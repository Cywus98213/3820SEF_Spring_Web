package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.LectureNotes;
import com.comp3820sef.webapp.repository.LectureNotesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureNotesService {

    @Autowired
    private LectureNotesRepository lectureNotesRepository;

    public List<LectureNotes> findByLectureId(int lectureId) {
        return lectureNotesRepository.findByLectureLectureId(lectureId);
    }
}
