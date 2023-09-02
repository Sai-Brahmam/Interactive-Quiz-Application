package com.quiz.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.quiz.project.bean.Quiz;

public interface QuizRepository extends JpaRepository<Quiz, Integer> {

}
