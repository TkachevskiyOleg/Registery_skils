package edu.itstep.teacherapp.service;

import edu.itstep.teacherapp.model.Teacher;
import java.util.List;
import java.util.Optional;

public interface TeacherService {
    List<Teacher> getAllTeachers();
    Optional<Teacher> getTeacherById(Long id);
    void saveTeacher(Teacher teacher);
    void deleteTeacher(Long id);
}