package edu.itstep.teacherapp.controller;

import edu.itstep.teacherapp.model.Skill;
import edu.itstep.teacherapp.model.Teacher;
import edu.itstep.teacherapp.service.SkillService;
import edu.itstep.teacherapp.service.TeacherService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/teachers")
public class TeacherController {
    private final TeacherService teacherService;
    private final SkillService skillService;

    @Autowired
    public TeacherController(TeacherService teacherService, SkillService skillService) {
        this.teacherService = teacherService;
        this.skillService = skillService;
    }

    @GetMapping
    public String listTeachers(Model model) {
        List<Teacher> teachers = teacherService.getAllTeachers();
        model.addAttribute("teachers", teachers);
        return "teacher/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("teacher", new Teacher());
        model.addAttribute("skills", skillService.getAllSkills());
        return "teacher/form";
    }

    @PostMapping
    public String saveTeacher(
            @Valid @ModelAttribute("teacher") Teacher teacher,
            BindingResult result,
            Model model
    ) {
        if (result.hasErrors()) {
            log.error("Помилки валідації: {}", result.getAllErrors());
            model.addAttribute("skills", skillService.getAllSkills());
            return "teacher/form";
        }
        teacherService.saveTeacher(teacher);
        return "redirect:/teachers";
    }

    @GetMapping("/{id}/edit")
    public String showEditForm(@PathVariable Long id, Model model) {
        Teacher teacher = teacherService.getTeacherById(id)
                .orElseThrow(() -> new IllegalArgumentException("Невірний ID вчителя: " + id));
        model.addAttribute("teacher", teacher);
        model.addAttribute("skills", skillService.getAllSkills());
        return "teacher/form";
    }

    @GetMapping("/{id}")
    public String teacherDetails(@PathVariable Long id, Model model) {
        Teacher teacher = teacherService.getTeacherById(id)
                .orElseThrow(() -> new IllegalArgumentException("Невірний ID вчителя: " + id));
        model.addAttribute("teacher", teacher);
        return "teacher/details";
    }

    @GetMapping("/{id}/delete")
    public String deleteTeacher(@PathVariable Long id) {
        teacherService.deleteTeacher(id);
        return "redirect:/teachers";
    }

    @PostMapping("/{teacherId}/skills/{skillId}")
    public String addSkillToTeacher(@PathVariable Long teacherId, @PathVariable Long skillId) {
        Teacher teacher = teacherService.getTeacherById(teacherId)
                .orElseThrow(() -> new IllegalArgumentException("Невірний ID вчителя: " + teacherId));
        Skill skill = skillService.getSkillById(skillId)
                .orElseThrow(() -> new IllegalArgumentException("Невірний ID навички: " + skillId));
        teacher.addSkill(skill);
        teacherService.saveTeacher(teacher);
        return "redirect:/teachers/" + teacherId;
    }

    @DeleteMapping("/{teacherId}/skills/{skillId}")
    public String removeSkillFromTeacher(@PathVariable Long teacherId, @PathVariable Long skillId) {
        Teacher teacher = teacherService.getTeacherById(teacherId)
                .orElseThrow(() -> new IllegalArgumentException("Невірний ID вчителя: " + teacherId));
        Skill skill = skillService.getSkillById(skillId)
                .orElseThrow(() -> new IllegalArgumentException("Невірний ID навички: " + skillId));
        teacher.removeSkill(skill);
        teacherService.saveTeacher(teacher);
        return "redirect:/teachers/" + teacherId;
    }
}