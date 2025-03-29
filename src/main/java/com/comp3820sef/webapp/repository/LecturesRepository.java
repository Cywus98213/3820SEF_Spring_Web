package com.comp3820sef.webapp.repository;

import com.comp3820sef.webapp.entity.Lectures;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LecturesRepository extends JpaRepository<Lectures, Integer> {




}