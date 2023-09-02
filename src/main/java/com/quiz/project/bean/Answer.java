package com.quiz.project.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Answer {
	
	@Id
	@GeneratedValue
	private Integer ansId;
	
	private Integer choice;		

	public Integer getChoice() {
		return choice;
	}

	public void setChoice(Integer choice) {
		this.choice = choice;
	}		

	public Integer getAnsId() {
		return ansId;
	}

	public void setAnsId(Integer ansId) {
		this.ansId = ansId;
	}	

	@Override
	public String toString() {
		return "Answer [ansId=" + ansId + ", choice=" + choice + "]";
	}

	public Answer() {
		super();
		// TODO Auto-generated constructor stub
	} 
	
	

}
