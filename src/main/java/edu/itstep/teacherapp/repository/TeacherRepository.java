package edu.itstep.teacherapp.repository;

import edu.itstep.teacherapp.model.Teacher;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public class TeacherRepository {
    @PersistenceContext
    private EntityManager entityManager;

    public List<Teacher> findAll() {
        return entityManager.createQuery("SELECT t FROM Teacher t", Teacher.class).getResultList();
    }

    public Optional<Teacher> findById(Long id) {
        return Optional.ofNullable(entityManager.find(Teacher.class, id));
    }

    public void save(Teacher teacher) {
        if (teacher.getId() == null) {
            entityManager.persist(teacher);
        } else {
            entityManager.merge(teacher);
        }
    }

    public void deleteById(Long id) {
        Teacher teacher = entityManager.find(Teacher.class, id);
        if (teacher != null) {
            entityManager.remove(teacher);
        }
    }
}