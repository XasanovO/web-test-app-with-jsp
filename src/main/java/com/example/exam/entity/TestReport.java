package com.example.exam.entity;


import com.example.exam.entity.enums.TestStatus;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class TestReport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    private User user;
    private LocalDateTime endTime;
    @Enumerated(EnumType.STRING)
    private TestStatus status;
    private String level;
    private Integer totalQuestions;
    private Integer correctAnswers;
    private Integer incorrectAnswers;
}
