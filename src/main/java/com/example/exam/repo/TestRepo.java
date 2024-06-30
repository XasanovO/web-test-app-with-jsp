package com.example.exam.repo;

import com.example.exam.entity.Question;
import com.example.exam.entity.Test;

import java.util.List;

public class TestRepo extends BaseRepo<Test, Integer> {

    public void deleteTestAndRelatedEntities(Integer testId) {
        Test test = findById(testId);
        QuestionRepo questionRepo = new QuestionRepo();
        if (test != null) {
            List<Question> questions = questionRepo.findByTestId(test.getId());

            for (Question question : questions) {
                questionRepo.delete(question.getId());
            }

            delete(testId);
        }
    }
}
