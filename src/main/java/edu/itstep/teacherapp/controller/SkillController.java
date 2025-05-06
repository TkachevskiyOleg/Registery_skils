package edu.itstep.teacherapp.controller;

import edu.itstep.teacherapp.model.Skill;
import edu.itstep.teacherapp.service.SkillService;
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
@RequestMapping("/skills")
public class SkillController {
    private final SkillService skillService;

    @Autowired
    public SkillController(SkillService skillService) {
        this.skillService = skillService;
    }

    @GetMapping
    public String listSkills(Model model) {
        List<Skill> skills = skillService.getAllSkills();
        model.addAttribute("skills", skills);
        return "skill/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("skill", new Skill());
        return "skill/form";
    }

    @PostMapping
    public String saveSkill(
            @Valid @ModelAttribute("skill") Skill skill,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return "skill/form";
        }
        skillService.saveSkill(skill);
        return "redirect:/skills";
    }

    @GetMapping("/{id}/edit")
    public String showEditForm(@PathVariable Long id, Model model) {
        Skill skill = skillService.getSkillById(id)
                .orElseThrow(() -> new IllegalArgumentException("Невірний ID навички: " + id));
        model.addAttribute("skill", skill);
        return "skill/form";
    }

    @GetMapping("/{id}/delete")
    public String deleteSkill(@PathVariable Long id) {
        skillService.deleteSkill(id);
        return "redirect:/skills";
    }
}