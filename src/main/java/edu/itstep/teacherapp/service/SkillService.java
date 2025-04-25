package edu.itstep.teacherapp.service;

import edu.itstep.teacherapp.model.Skill;
import java.util.List;
import java.util.Optional;

public interface SkillService {
    List<Skill> getAllSkills();
    Optional<Skill> getSkillById(Long id);
    void saveSkill(Skill skill);
    void deleteSkill(Long id);
}