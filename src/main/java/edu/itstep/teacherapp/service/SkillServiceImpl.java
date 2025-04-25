package edu.itstep.teacherapp.service;

import edu.itstep.teacherapp.model.Skill;
import edu.itstep.teacherapp.repository.SkillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class SkillServiceImpl implements SkillService {
    @Autowired
    private SkillRepository skillRepository;

    @Override
    @Transactional
    public List<Skill> getAllSkills() {
        return skillRepository.findAll();
    }

    @Override
    @Transactional
    public Optional<Skill> getSkillById(Long id) {
        return skillRepository.findById(id);
    }

    @Override
    @Transactional
    public void saveSkill(Skill skill) {
        skillRepository.save(skill);
    }

    @Override
    @Transactional
    public void deleteSkill(Long id) {
        skillRepository.deleteById(id);
    }
}