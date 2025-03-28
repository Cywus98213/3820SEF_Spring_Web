package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.Courses;
import com.comp3820sef.webapp.repository.CoursesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoursesService {

    @Autowired
    private CoursesRepository coursesRepository;

    public List<Courses> getAllCourses() {
        return coursesRepository.findAll();
    }

    public Courses getCourseById(int id) {
        return coursesRepository.findById(id).orElse(null);
    }
}