package edu.itstep.teacherapp.repository;

import edu.itstep.teacherapp.model.Skill;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public class SkillRepository {
    @PersistenceContext
    private EntityManager entityManager;

    public List<Skill> findAll() {
        return entityManager.createQuery("SELECT s FROM Skill s", Skill.class).getResultList();
    }

    public Optional<Skill> findById(Long id) {
        return Optional.ofNullable(entityManager.find(Skill.class, id));
    }

    public void save(Skill skill) {
        if (skill.getId() == null) {
            entityManager.persist(skill);
        } else {
            entityManager.merge(skill);
        }
    }

    public void deleteById(Long id) {
        Skill skill = entityManager.find(Skill.class, id);
        if (skill != null) {
            entityManager.remove(skill);
        }
    }
}