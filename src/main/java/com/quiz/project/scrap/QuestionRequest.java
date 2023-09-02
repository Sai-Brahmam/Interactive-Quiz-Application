package com.quiz.project.scrap;

import com.quiz.project.bean.Quiz;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor(staticName = "buildQuestion")
@NoArgsConstructor
public class QuestionRequest {
	
	private String questionStatement;
	
	private String option1;
	
	private String option2;
	
	private String option3;
	
	private String option4;
	
	private Integer correctOptionNo;
	
	private Quiz quiz;
	
	

}
