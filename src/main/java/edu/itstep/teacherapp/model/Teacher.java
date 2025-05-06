package edu.itstep.teacherapp.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@Entity
@Table(name = "teachers")
public class Teacher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Ім'я обов'язкове")
    @Column(nullable = false)
    private String name;

    @NotBlank(message = "Прізвище обов'язкове")
    @Column(nullable = false)
    private String surname;

    @NotNull(message = "Дата народження обов'язкова")
    @Past(message = "Дата має бути в минулому")
    @Column(name = "birth_date")
    private LocalDate birthDate;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "teacher_skill",
            joinColumns = @JoinColumn(name = "teacher_id"),
            inverseJoinColumns = @JoinColumn(name = "skill_id")
    )
    private Set<Skill> skills = new HashSet<>();

    public void addSkill(Skill skill) {
        skills.add(skill);
        skill.getTeachers().add(this);
    }

    public void removeSkill(Skill skill) {
        skills.remove(skill);
        skill.getTeachers().remove(this);
    }
}