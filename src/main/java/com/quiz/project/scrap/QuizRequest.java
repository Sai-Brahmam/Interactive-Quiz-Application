package com.quiz.project.scrap;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import com.quiz.project.bean.Question;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "buildQuiz")
@NoArgsConstructor
public class QuizRequest {
	
	private String quizName;
	
	private List<Question> listOfQuestions;
	
	private LocalTime timeLimit;
	
	private LocalDateTime activationDateTime;
	
	private LocalDateTime deactivationDateTime;	

}
