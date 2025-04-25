package edu.itstep.teacherapp.service;

import edu.itstep.teacherapp.model.Teacher;
import edu.itstep.teacherapp.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherRepository teacherRepository;

    @Override
    @Transactional
    public List<Teacher> getAllTeachers() {
        return teacherRepository.findAll();
    }

    @Override
    @Transactional
    public Optional<Teacher> getTeacherById(Long id) {
        return teacherRepository.findById(id);
    }

    @Override
    @Transactional
    public void saveTeacher(Teacher teacher) {
        teacherRepository.save(teacher);
    }

    @Override
    @Transactional
    public void deleteTeacher(Long id) {
        teacherRepository.deleteById(id);
    }
}