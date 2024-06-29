package com.example.exam.repo;

import com.example.exam.entity.Question;
import com.example.exam.entity.enums.QuestionLevel;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

import java.util.List;

import static com.example.exam.config.MyListener.emf;

public class QuestionRepo extends BaseRepo<Question, Integer> {

    public List<Question> findByTestId(Integer id) {
        EntityManager entityManager = emf.createEntityManager();
        return entityManager.createQuery(
                        "SELECT q FROM Question q WHERE q.test.id = :testId", Question.class)
                .setParameter("testId", id)
                .getResultList();
    }

    public List<Question> findByTestIdAndCount(int testId, Integer countQuestions) {
        EntityManager entityManager = emf.createEntityManager();
        return entityManager.createQuery(
                        "SELECT q FROM Question q WHERE q.test.id = :testId", Question.class)
                .setParameter("testId", testId)
                .setMaxResults(countQuestions)
                .getResultList();
    }


    public List<Question> findByTestIdAndCountAndDifficulty(int testId, String difficulty, Integer countQuestions) {
        EntityManager entityManager = emf.createEntityManager();
        return entityManager.createQuery(
                        "SELECT q FROM Question q WHERE q.test.id = :testId and q.level = :lvl", Question.class)
                .setParameter("testId", testId)
                .setParameter("lvl", QuestionLevel.valueOf(difficulty))
                .setMaxResults(countQuestions)
                .getResultList();
    }


    public List<Question> findAllThicklyByLevel(int testId, int countQuestions) {
        EntityManager entityManager = emf.createEntityManager();
        return entityManager.createQuery(
                        """
                                SELECT q FROM Question q WHERE q.test.id = :testId 
                                ORDER BY case q.level 
                                    when :easy then 1 
                                    when :normal then 2 
                                    when :hard then 3 END
                                """, Question.class)
                .setParameter("testId", testId)
                .setParameter("easy", QuestionLevel.EASY)
                .setParameter("normal", QuestionLevel.NORMAL)
                .setParameter("hard", QuestionLevel.HARD)
                .setMaxResults(countQuestions)
                .getResultList();
    }
}
