package com.comp3820sef.webapp.repository;

import com.comp3820sef.webapp.entity.Lectures;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LecturesRepository extends JpaRepository<Lectures, Integer> {
    List<Lectures> findByCourseCourseId(int courseId);




}