package com.quiz.project.rest.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.project.bean.Answer;
import com.quiz.project.bean.Question;
import com.quiz.project.bean.Quiz;
import com.quiz.project.exception.ResourceNotFoundException;
import com.quiz.project.repository.AnsRepository;
import com.quiz.project.repository.QuestionRepository;
import com.quiz.project.repository.QuizRepository;

@RestController
public class QuizRest {
	
	@Autowired
	private QuizRepository quizRepository;
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private AnsRepository ansRepository;
	
	//REST API's Related to Question
	
	@PostMapping("rest/createQuestion")
	public Integer addQuestionandOptions(@RequestBody Question question, @RequestParam Integer quizId) {
		//System.out.println("questionNo in REST = "+question.getQuestionNo());
		Optional<Quiz> quiz = quizRepository.findById(quizId);
		
		if(!quiz.isPresent()) {
			throw new ResourceNotFoundException("Quiz Not Found With Quiz Id =: "+quizId);
		}
		
		else {				
				question.setQuiz(quiz.get()); //get() method belongs to optional class, which helps to retrieve the actual object from the optional object
				questionRepository.save(question);
				return question.getQuestionNo();
		}
	}
	
	@GetMapping("rest/retrieveQuestion")
	public Optional<Question> retrieveQuestion(@RequestParam Integer questionNo) {
		//System.out.println("questionNo in REST = "+questionNo);
		Optional<Question> question = questionRepository.findById(questionNo);
		//Question question = oquestion.get();
		//System.out.println("question in REST = "+question);
		
		if(!question.isPresent()){
			throw new ResourceNotFoundException("Question Not Found with question no : "+questionNo);
			
		}
		else {
			return question;
		}
	}
	
	@DeleteMapping("rest/deleteQuestion")
	public Integer deleteQuestion(@RequestBody Integer questionNo) {
		//System.out.println("questionNo in DELETE REST = "+questionNo);
		questionRepository.deleteById(questionNo);
		return questionNo;
	}
	
	
	
	
	
	//------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	//REST API's Related to Quiz
	
	//This REST API is reused for creating as well as updating the Quiz object
	//This is only possible becoz save() method of JpaRepository internally uses merge() method of Hibernate EntityManager which first checks if the objects already present, if present then it updates it 
	@PostMapping("rest/createQuiz")
	public Integer addNewQuiz(@RequestBody Quiz quiz) {
		Quiz q = quizRepository.save(quiz);
		//System.out.println("Quiz id in Restcontroller = "+q.getQuizId());
		return q.getQuizId();
		
	}
	
	
	@GetMapping("rest/retrieveQuiz")
	public Optional<Quiz> getQuizById(@RequestParam Integer quizId){
		
		//System.out.println("Quiz id in REST successfull reached = "+quizId);
		Optional<Quiz> quiz = quizRepository.findById(quizId);	
		if(!quiz.isPresent()) {
			throw new ResourceNotFoundException("Quiz Not Found With Quiz Id =: "+quizId);
			
		}
		else {
			return quiz;
		}
	}
	
	@GetMapping("rest/retrieveAllQuizList")
	public List<Quiz> getQuizList() {
		List<Quiz> quizList = quizRepository.findAll();
		return quizList;
	}
	
	@DeleteMapping("rest/deleteQuiz/{quizId}")
	public String deleteAQuizById(@PathVariable Integer quizId) {
		//System.out.println("Quiz id in REST = "+quizId);
		
		//Step 1 : Delete the questions in the quiz
		questionRepository.deleteByQuizId(quizId);
		//Step 2 : Delete the Quiz Object
		quizRepository.deleteById(quizId);
		
		return "Quiz Successfully Deleted";		
	}
	
	@GetMapping("rest/addStatustoQuizes")
	public String addStatustoALLQuizes() {
		//System.out.println("Flag in REST before adding status");
		List<Quiz>quizList = quizRepository.findAll();
		

		for(int i=0; i<quizList.size();i++) {
			
			Quiz quiz = quizList.get(i);
			LocalDateTime activationDateTime = ((Quiz) quiz).getActivationDateTime();
			LocalDateTime deactivationDateTime = ((Quiz) quiz).getDeactivationDateTime();
			LocalDateTime currentTime = LocalDateTime.now();
		
				boolean result = (currentTime.isEqual(activationDateTime) || currentTime.isAfter(activationDateTime)) ? (currentTime.isEqual(deactivationDateTime) || currentTime.isBefore(deactivationDateTime)): false;
				if(result){
					((Quiz) quiz).setActivationStatus("Active");							
				}
				else if(currentTime.isAfter(deactivationDateTime)) {
					((Quiz) quiz).setActivationStatus("Finished");
				}
				else {
					((Quiz) quiz).setActivationStatus("Inactive");
				}
				quizRepository.save(quiz);
		}
		//System.out.println("Flag in REST after adding status");
		
		return "done";
	}
	
	
	//REST API's related to Answer
	
	@PostMapping("rest/appendAnswer")
	public String appendAnswerObjectInDB(@RequestBody Answer answer) {
		ansRepository.save(answer);
		return "Done";
	}
	
	@DeleteMapping("rest/emptyAnsList")
	public String emptyTheAnsTable() {
		ansRepository.deleteAll();
		return "Done";
	}
	
	@GetMapping("rest/getAnsList")
	public List<Answer> getListOfAns(){
		List<Answer> listofAnswers = ansRepository.findAll();
		return listofAnswers;
		
	}

}
