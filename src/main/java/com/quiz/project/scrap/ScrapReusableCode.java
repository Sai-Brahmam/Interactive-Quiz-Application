package com.quiz.project.scrap;

public class ScrapReusableCode {
//SCRAP CODE
	
	
//	@GetMapping("createQuiz")
//	public String getNewQuizForm(@RequestParam(required = false) Integer quizId,ModelMap model){
//		//System.out.println("Quiz id GET in CONTROLLER = "+quizId);
//		Quiz quiz;
//		
//		//Logic to reuse the API as well as relevant View(the JSP)		
//		if(quizId != null) {
//		quiz = quizService.getQuizById(quizId);				
//		model.put("relevantMessage","Overwrite The Following Quiz Details");
//		}
//		else {
//		quiz = new Quiz();
//		model.put("relevantMessage","Add Quiz Details");
//		model.put("placeHolderMessage1","Add Quiz Name");
//		model.put("placeHolderMessage2","Select time-limit for quiz");
//		model.put("placeHolderMessage3","Select activation date & time of quiz");
//		model.put("placeHolderMessage4","Select deactivation date & time of quiz");
//		}
//		
//		//System.out.println("Quiz id GETT in CONTROLLER = "+quiz.getQuizId());
//		model.put("quiz",quiz);
//		return "newQuizForm";
//	}
	
//	@GetMapping("updateQuiz")
//	public String getupdateQuizForm(@RequestParam Integer quizId) {
//		return "newQuizForm";
//	}	
	
//	@PutMapping("rest/updateQuestion")
//	public String updateQuestion(@RequestBody Question newQuestion) {
//		System.out.println("Question no = "+newQuestion.getQuestionNo());
//		Optional<Question> oldQuestion = questionRepository.findById(newQuestion.getQuestionNo());
//		System.out.println(oldQuestion);
//		System.out.println(newQuestion);
//		//questionRepository.
//		return "update is done";
//	}
//	
	
//	public void updateQuestion(Question question) {
//	System.out.println("Question in SERVICE = "+question);
//
//	restTemplate = new RestTemplate();
//    headers = new HttpHeaders();
//    headers.setContentType(MediaType.APPLICATION_JSON);
//    
//    requestEntity = new HttpEntity<>(question,headers);
//    ResponseEntity<String> responseEntity = restTemplate.exchange(baseQuizUrl+"/updateQuestion", HttpMethod.PUT,requestEntity,String.class);
//    
//}
	
	
//	static {
//	//adding objects to the collection--- initialization of the collection
//	List<Question> init_q_list = new ArrayList<>();
//	Quiz quiz = new Quiz(444);
//	init_q_list.add( new Question(601,"What is the full form of HTML?","Hypertext Markup Language","Higher Template Meadium Language"
//			                    ,"HighText Machine Language","None of these",1,quiz));
//	init_q_list.add( new Question(602," What is the term applied for splits in a blockchain network?","Mergers","Divisions"
//								,"Forks","None of the above",3,quiz));
//	init_q_list.add( new Question(603,"Which of the following is an example of web3 use cases?","Defi protocols","Non-fungible tokens"
//								,"Metaverse applications","All of the above",4,quiz));
//	init_q_list.add( new Question(604,"Which of the following produces hypotheses that are easy to read for humans?","Machine Learning","Inductive logic programming"
//								,"First-order logic"," Propositional logic",2,quiz));
//	init_q_list.add( new Question(605,"Which two features are most important for Virtual Reality to provide a smooth and enjoyable experience for the user?","advanced hardware and apps","frame rate and latency"
//								,"controllers and battery life","data input and bandwidth",2,quiz));
//			
//	//creating Quiz object
//	quiz.setQuizName("General Awareness");
//	quiz.setActivationDateTime(LocalDateTime.now());
//	quiz.setDeactivationDateTime(LocalDateTime.of(2023, 11, 4, 16, 22, 55));
//	quiz.setListOfQuestions(init_q_list);
//	
//	//saving the above Quiz object in DB by hitting relevant REST API
//	RestTemplate restTemplateInBlock= new RestTemplate();
//	String baseQuizUrlInBlock = "http://localhost:8080/rest";
//	HttpHeaders headersInBlock= new HttpHeaders();
//	HttpEntity<Object> requestEntityInBlock = new HttpEntity<>(quiz,headersInBlock);
//    headersInBlock.setContentType(MediaType.APPLICATION_JSON);	    
//    restTemplateInBlock.exchange(baseQuizUrlInBlock+"/createQuiz", HttpMethod.POST,requestEntityInBlock,Integer.class);
//	
//}
//
	
	

}
