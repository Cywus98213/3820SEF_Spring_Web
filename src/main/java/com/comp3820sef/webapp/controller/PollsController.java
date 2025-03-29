package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.service.LecturesService;
import com.comp3820sef.webapp.service.PollsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PollsController {

    @Autowired
    private PollsService pollsService;

    @Autowired
    private LecturesService lecturesService;


}
