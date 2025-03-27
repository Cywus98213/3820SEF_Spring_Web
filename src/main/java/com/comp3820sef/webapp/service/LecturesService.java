package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.Lectures;
import com.comp3820sef.webapp.repository.LecturesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class LecturesService {
    @Autowired
    private LecturesRepository lecturesRepository;

    public List<Lectures> getLecturesByCourseId(int courseId) {
        return lecturesRepository.findAll().stream()
                .filter(lecture -> lecture.getCourse().getCourseId() == courseId)
                .collect(Collectors.toList());
    }
}