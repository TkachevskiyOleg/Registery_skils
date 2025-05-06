package edu.itstep.teacherapp.repository;

import edu.itstep.teacherapp.model.Skill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface SkillRepository extends JpaRepository<Skill, Long> {
    // Додаткові методи (приклад пошуку за назвою)
    Optional<Skill> findByName(String name);
}