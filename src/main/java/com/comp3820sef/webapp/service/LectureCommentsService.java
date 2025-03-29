package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.LectureComments;
import com.comp3820sef.webapp.repository.LectureCommentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureCommentsService {

    @Autowired
    private LectureCommentsRepository lectureCommentsRepository;

    public List<LectureComments> findByLectureLectureId(int lectureId) {
        return lectureCommentsRepository.findByLectureLectureId(lectureId);
    }
}
