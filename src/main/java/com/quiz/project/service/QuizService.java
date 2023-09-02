package com.quiz.project.service;

import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.quiz.project.bean.Answer;
import com.quiz.project.bean.Question;
import com.quiz.project.bean.Quiz;

@Service
public class QuizService {	
	
	private	RestTemplate restTemplate;
	private	HttpHeaders headers;
	private	HttpEntity<Object> requestEntity;
	@Value("${baseQuizUrl}")
	private	String baseQuizUrl;


	
	
	//Methods Related to Quiz
	
	public Integer saveTheQuiz(Quiz quiz) {
		
		restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    requestEntity = new HttpEntity<>(quiz,headers);
	    
	    ResponseEntity<Integer> responseEntity = restTemplate.exchange(baseQuizUrl+"/createQuiz", HttpMethod.POST,requestEntity,Integer.class);
		HttpStatusCode statusCode = responseEntity.getStatusCode();
		Integer id = responseEntity.getBody();
		//System.out.println("Quiz id in Service = "+id);
		return id;
	}
	
	public Quiz getQuizById(Integer quizId) {
		//System.out.println("Quiz id in SERVICE successfull reached = "+quizId);
		
		restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);

	    String parameterizedUrl = baseQuizUrl + "/retrieveQuiz?quizId={quizId}";
	    
	    Map<String, String> param = new HashMap<String, String>();
	    param.put("quizId", Integer.toString(quizId));
	    requestEntity = new HttpEntity<>(headers);
	    
	    ResponseEntity<Quiz> responseEntity = restTemplate.exchange(parameterizedUrl, HttpMethod.GET,requestEntity,Quiz.class,param);
	    
	    //Quiz quiz = restTemplate.getForObject(parameterizedUrl, Quiz.class, param);
	    
		return responseEntity.getBody();
	}
	
	public List<Quiz> getListOfAllQuiz() {
		
		restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    requestEntity = new HttpEntity<>(headers);
	    //List<Quiz> quizList = restTemplate.getForObject(baseQuizUrl+"/retrieveAllQuizList", );
	    
	    ResponseEntity<List<Quiz>> responseEntity = restTemplate.exchange(baseQuizUrl+"/retrieveAllQuizList", HttpMethod.GET,requestEntity,new ParameterizedTypeReference<List<Quiz>>() {});	    
	    return responseEntity.getBody();
	    

	}
	
	public void deleteAQuiz(Integer quizId) {
		//System.out.println("Quiz id in SERVICE = "+quizId);
		restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    
	    Map<String, String> param = new HashMap<String, String>();
	    param.put("quizId", Integer.toString(quizId));
	    
	    String endPointUrl = baseQuizUrl + "/deleteQuiz/{quizId}";
	    requestEntity = new HttpEntity<>(headers);
	    
	    ResponseEntity<String> responseEntity = restTemplate.exchange(endPointUrl, HttpMethod.DELETE,requestEntity,String.class,param);
	    
	}
	
	public void refreshStatusOfQuizes() {
		// TODO Auto-generated method stub
		//System.out.println("Flag in SERVIEC before status = "+flag);

		restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    requestEntity = new HttpEntity<>(headers);
	    ResponseEntity<String> responseEntity = restTemplate.exchange(baseQuizUrl+"/addStatustoQuizes", HttpMethod.GET,requestEntity,String.class);
	    
		
		//System.out.println("Flag in SERVIEC before status = "+flag);

	}
	
	
	
	//------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------
	
	
	
	
	//Methods Related to Answers
	
	public List<Answer> getListOfAllAns(){
		restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    requestEntity = new HttpEntity<>(headers);
	    ResponseEntity<List<Answer>> responseEntity = restTemplate.exchange(baseQuizUrl+"/getAnsList", HttpMethod.GET,requestEntity,new ParameterizedTypeReference<List<Answer>>() {});    
		
		return responseEntity.getBody();
		
	}
	
	public void appendListOfAnswers(Answer answer){
		restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    requestEntity = new HttpEntity<>(answer,headers);
	    ResponseEntity<String> responseEntity = restTemplate.exchange(baseQuizUrl+"/appendAnswer", HttpMethod.POST,requestEntity,String.class);    
		
	}
	
	public void emptyTheAnswerList() {
		restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    requestEntity = new HttpEntity<>(headers);
	    ResponseEntity<String> responseEntity = restTemplate.exchange(baseQuizUrl+"/emptyAnsList", HttpMethod.DELETE,requestEntity,String.class);    
	}

	
	
	
	
	
	
	//------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------
		
	
	
	
	
	
	
	
	//Methods Related to Questions
	
	public Integer saveTheQuestion(Question question,Integer quizId) {
		//System.out.println("Quiz id in SERVICE successfully reached = "+quizId);    
	    restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    
	    String parameterizedUrl = baseQuizUrl + "/createQuestion?quizId={quizId}";
	    
	    Map<String, String> param = new HashMap<String, String>();
	    param.put("quizId", Integer.toString(quizId));
	    
	    requestEntity = new HttpEntity<>(question,headers);
	    
		ResponseEntity<Integer> responseEntity = restTemplate.exchange(parameterizedUrl, HttpMethod.POST,requestEntity,Integer.class,param);
		HttpStatusCode statusCode = responseEntity.getStatusCode();
		//System.out.println("Status Code For Post Question API = "+statusCode);
		return responseEntity.getBody();
	}
	
	
	
	public void deleteQuestion(Integer questionNo) {
		//System.out.println("questionNo in DELETE service = "+questionNo);
		restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
//	    Map<String, String> param = new HashMap<String, String>();
//	    param.put("questionNo", Integer.toString(questionNo));
	    requestEntity = new HttpEntity<>(questionNo,headers);
	    ResponseEntity<Integer> responseEntity = restTemplate.exchange(baseQuizUrl+"/deleteQuestion", HttpMethod.DELETE,requestEntity,Integer.class);
	    
	}
	

	
	public Question findQuestion(Integer questionNo) {
		//System.out.println("questionNo in SERVICE = "+questionNo);
		restTemplate = new RestTemplate();
	    
	    URI targetUrl= UriComponentsBuilder.fromUriString(baseQuizUrl)  // Build the base link
	    	    .path("/retrieveQuestion")                            // Add path
	    	    .queryParam("questionNo", questionNo)                                // Add one or more query params
	    	    .build()                                                 // Build the URL
	    	    .encode()                                                // Encode any URI items that need to be encoded
	    	    .toUri();                                                // Convert to URI

	    return restTemplate.getForObject(targetUrl, Question.class);
	    
	}
	


	
	

}
