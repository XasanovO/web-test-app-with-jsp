package com.example.exam.entity;


import com.example.exam.entity.enums.QuestionLevel;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String text;
    private byte[] image;
    @Enumerated(EnumType.STRING)
    private QuestionLevel level;
    @ManyToOne
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Test test;

    @ElementCollection
    private List<String> options =new ArrayList<>();

    private String correctOption;

    public String getBase64Photo() {
        if (image != null) {
            return Base64.getEncoder().encodeToString(image);
        }
        return null;
    }
}
