package com.quiz.project.bean;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;

@Entity
@AllArgsConstructor(staticName = "buildQuiz")
public class Quiz {
	
	@Id
	@GeneratedValue
	private Integer quizId;
	
	private String quizName;
	
	@OneToMany(mappedBy = "quiz")
	private List<Question> listOfQuestions;	
	
	private LocalDateTime activationDateTime;
	
	private LocalDateTime deactivationDateTime;	
	
	private String activationStatus;

	public String getActivationStatus() {
		return activationStatus;
	}

	public void setActivationStatus(String activationStatus) {
		this.activationStatus = activationStatus;
	}

	public LocalDateTime getActivationDateTime() {
		return activationDateTime;
	}

	public void setActivationDateTime(LocalDateTime activationDateTime) {
		this.activationDateTime = activationDateTime;
	}

	public LocalDateTime getDeactivationDateTime() {
		return deactivationDateTime;
	}

	public void setDeactivationDateTime(LocalDateTime deactivationDateTime) {
		this.deactivationDateTime = deactivationDateTime;
	}

	public Integer getQuizId() {
		return quizId;
	}

	public void setQuizId(Integer quizId) {
		this.quizId = quizId;
	}

	public String getQuizName() {
		return quizName;
	}

	public void setQuizName(String quizName) {
		this.quizName = quizName;
	}	

	public List<Question> getListOfQuestions() {
		return listOfQuestions;
	}

	public void setListOfQuestions(List<Question> listOfQuestions) {
		this.listOfQuestions = listOfQuestions;
	}	

	public Quiz() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Quiz(Integer quizId) {
		super();
		this.quizId = quizId;
		// TODO Auto-generated constructor stub
	}

	public Quiz(Integer quizId, String quizName, List<Question> listOfQuestions, LocalDateTime activationDateTime,
			LocalDateTime deactivationDateTime) {
		super();
		this.quizId = quizId;
		this.quizName = quizName;
		this.listOfQuestions = listOfQuestions;
		this.activationDateTime = activationDateTime;
		this.deactivationDateTime = deactivationDateTime;
	}

	@Override
	public String toString() {
		return "Quiz [quizId=" + quizId + ", quizName=" + quizName + ", listOfQuestions=" + listOfQuestions
				+ ", activationDateTime=" + activationDateTime + ", deactivationDateTime=" + deactivationDateTime
				+ ", activationStatus=" + activationStatus + "]";
	}	

	
	

	
	
	

	

	
	
	

}
