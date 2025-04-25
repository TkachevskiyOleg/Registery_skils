package edu.itstep.teacherapp.controller;

import edu.itstep.teacherapp.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app")
public class AppController {

    private final TeacherService teacherService;

    @Autowired
    public AppController(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @GetMapping("/list")
    public String listPage(Model model) {
        model.addAttribute("teachers", teacherService.getAllTeachers());
        return "list"; // Це потребує створення JSP файлу list.jsp у директорії /WEB-INF/views/
    }
}
