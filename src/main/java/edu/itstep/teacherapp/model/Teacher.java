package edu.itstep.teacherapp.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "teachers")
@Data
@NoArgsConstructor
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
    @Past(message = "Дата народження повинна бути в минулому")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "birth_date", nullable = false)
    private LocalDate birthDate;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "teacher_skills",
            joinColumns = @JoinColumn(name = "teacher_id"),
            inverseJoinColumns = @JoinColumn(name = "skill_id")
    )
    private Set<Skill> skills = new HashSet<>();

    public void addSkill(Skill skill) {
        this.skills.add(skill);
        skill.getTeachers().add(this);
    }

    public void removeSkill(Skill skill) {
        this.skills.remove(skill);
        skill.getTeachers().remove(this);
    }
}