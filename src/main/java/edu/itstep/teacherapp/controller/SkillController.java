package edu.itstep.teacherapp.controller;

import edu.itstep.teacherapp.model.Skill;
import edu.itstep.teacherapp.service.SkillService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;

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
        model.addAttribute("skills", skillService.getAllSkills());
        return "skill/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("skill", new Skill());
        return "skill/form";
    }

    @PostMapping
    public String saveSkill(@Valid @ModelAttribute Skill skill, BindingResult result) {
        if (result.hasErrors()) {
            return "skill/form";
        }
        skillService.saveSkill(skill);
        return "redirect:/skills";
    }

    @GetMapping("/{id}/edit")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<Skill> skill = skillService.getSkillById(id);
        skill.ifPresent(value -> model.addAttribute("skill", value));
        return "skill/form";
    }

    @GetMapping("/{id}")
    public String skillDetails(@PathVariable Long id, Model model) {
        Optional<Skill> skill = skillService.getSkillById(id);
        skill.ifPresent(value -> model.addAttribute("skill", value));
        return "skill/details";
    }

    @GetMapping("/{id}/delete")
    public String deleteSkill(@PathVariable Long id) {
        skillService.deleteSkill(id);
        return "redirect:/skills";
    }
}