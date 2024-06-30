package com.example.exam.repo;


import com.example.exam.entity.TestReport;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.example.exam.config.MyListener.emf;

public class TestReportRepo extends BaseRepo<TestReport, Integer> {

    public List<TestReport> findAllByUserId(Integer userId) {
        EntityManager entityManager = emf.createEntityManager();
        return entityManager.createQuery("select t from TestReport t where t.user.id = :userId", TestReport.class)
                .setParameter("userId", userId)
                .getResultList();
    }
}
