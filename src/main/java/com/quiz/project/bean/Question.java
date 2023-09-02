package com.quiz.project.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;

@Entity
public class Question {
	@Id
	@GeneratedValue	
	private Integer questionNo;
	
	private String questionStatement;
	
	private String option1;
	
	private String option2;
	
	private String option3;
	
	private String option4;
	
	private Integer correctOptionNo;
	
	@JsonIgnore
	@ManyToOne
	private Quiz quiz;


	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}

	public Integer getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(Integer questionNo) {
		this.questionNo = questionNo;
	}	

	public String getQuestionStatement() {
		return questionStatement;
	}

	public void setQuestionStatement(String questionStatement) {
		this.questionStatement = questionStatement;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public Integer getCorrectOptionNo() {
		return correctOptionNo;
	}

	public void setCorrectOptionNo(Integer correctOptionNo) {
		this.correctOptionNo = correctOptionNo;
	}

	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}	

	@Override
	public String toString() {
		return "Question [questionNo=" + questionNo + ", questionStatement=" + questionStatement + ", option1="
				+ option1 + ", option2=" + option2 + ", option3=" + option3 + ", option4=" + option4
				+ ", correctOptionNo=" + correctOptionNo + ", quiz=" + quiz + "]";
	}

	public Question(Integer questionNo, String questionStatement, String option1, String option2, String option3,
			String option4, Integer correctOptionNo, Quiz quiz) {
		super();
		this.questionNo = questionNo;
		this.questionStatement = questionStatement;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.correctOptionNo = correctOptionNo;
		this.quiz = quiz;
	}

	

	

}
