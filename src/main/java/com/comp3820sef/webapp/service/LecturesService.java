package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.Lectures;
import com.comp3820sef.webapp.repository.LecturesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LecturesService {
    @Autowired
    private LecturesRepository lecturesRepository;

    public Lectures getLectureById(int lectureId) {
        return lecturesRepository.findById(lectureId).orElse(null);
    }

    public List<Lectures> getAllLecture(){
        return lecturesRepository.findAll();
    }

}