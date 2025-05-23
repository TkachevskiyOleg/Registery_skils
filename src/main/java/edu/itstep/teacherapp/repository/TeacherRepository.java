package edu.itstep.teacherapp.repository;

import edu.itstep.teacherapp.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher, Long> {
    // Додаткові методи (приклад кастомного запиту)
    List<Teacher> findByNameContainingIgnoreCase(String name);
}