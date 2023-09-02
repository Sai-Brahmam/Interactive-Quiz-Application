package com.quiz.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.quiz.project.bean.Answer;

public interface AnsRepository extends JpaRepository<Answer, Integer> {

}
