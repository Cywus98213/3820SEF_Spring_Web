package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.service.LecturesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/lectures")
public class LecturesController {
    @Autowired
    private LecturesService lecturesService;




}