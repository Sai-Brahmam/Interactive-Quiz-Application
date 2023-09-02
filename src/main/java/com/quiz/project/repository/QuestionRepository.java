package com.quiz.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.quiz.project.bean.Question;

public interface QuestionRepository extends JpaRepository<Question, Integer> {
	
	@Modifying
	@Transactional
	@Query(value="DELETE FROM Question WHERE quiz_quiz_id=?1", nativeQuery=true)	
    void deleteByQuizId(int quizId);

}
