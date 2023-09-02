package com.quiz.project.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.quiz.project.bean.Answer;
import com.quiz.project.bean.Question;
import com.quiz.project.bean.Quiz;
import com.quiz.project.service.QuizService;
@SessionAttributes({"quizList","listOfAnswers","listOfQuestionsForResult"})
@Controller
public class QuizController {
	
	@Autowired
	private QuizService quizService;
	
	//Root URL for Landing Page
	@GetMapping("/")
	public String getHomePage() {
		return "index";
	}
	
	private Integer index=0;
	
	// API's Related to Quiz
	
	
	//Method to get New Quiz creation form
	@GetMapping("createQuiz")
	public String getNewQuizForm(ModelMap model){
		//System.out.println("Quiz id GET in CONTROLLER = "+quizId);	
		LocalDateTime localDateTime = LocalDateTime.now();
		Quiz quiz = new Quiz();
		quiz.setActivationDateTime(localDateTime);
		model.put("quiz",quiz);
		return "newQuizCreateForm";
	}
	
	//Method to post New Quiz creation form
	@PostMapping("createQuiz")
	public String createQuiz(@ModelAttribute("quiz")Quiz quiz,ModelMap model) {
		//System.out.println("Quiz id POST in CONTROLLER = "+quiz.getQuizId());	
		
		Integer quizIdAfterSaving = quizService.saveTheQuiz(quiz);
		//System.out.println("Quiz id in POST controller after saving the Quiz Object = "+quizIdAfterSaving);
		model.put("question", new Question());
		model.put("quizId", quizIdAfterSaving);
		
		return "redirect:showQuizListToAdmin"; 
	}
	
	@GetMapping("updateQuiz")
	public String getUpdateQuizForm(@RequestParam Integer quizId,ModelMap model){
		Quiz quiz = quizService.getQuizById(quizId);
		model.put("quiz", quiz);
		return "updateQuizForm";
	}
	
	@PostMapping("updateQuiz")
	public String postUpdatedQuiz(@ModelAttribute("quiz")Quiz quiz) {
		quizService.saveTheQuiz(quiz);
		return "redirect:showQuizListToAdmin";
	}
	
	
	
	@GetMapping("deleteQuiz")
	public String deleteAQuiz(@RequestParam Integer quizId) {
		//System.out.println("Quiz id in deleteQuiz controller = "+quizId);
		quizService.deleteAQuiz(quizId);
		return "redirect:showQuizListToAdmin" ;
	}		
		
	
	@GetMapping("showQuizListToAdmin")
	public String getAllQuizes(ModelMap model) {
		List<Quiz>quizList = quizService.getListOfAllQuiz();
		model.put("quizList", quizList);
		
		return "quizListForAdmin";
	}

	@GetMapping("showQuizListToUser")
	public String getAllQuizesForUser(ModelMap model) {
		//System.out.println("Flag in showQuizListToUser controller before status = "+flag);
				
		
		 quizService.refreshStatusOfQuizes();
		 List<Quiz>quizList = quizService.getListOfAllQuiz();
		
		//System.out.println("Flag in showQuizListToUser controller After status = "+flag);
		model.put("quizList", quizList);
		
		return "quizListForUser";
	}
	
	@GetMapping("quizRules/{quizId}")
	public String getQuizRules(@PathVariable Integer quizId,ModelMap model) {
		Quiz quiz = quizService.getQuizById(quizId);	
		model.put("quiz", quiz);
		return "quizRulesAndDetails";
	}
	
	@GetMapping("attempt/{quizId}")
	public String attemptQuestionByUserPage(@PathVariable Integer quizId,ModelMap model) {
		System.out.println("Quiz id in ATTEMPT GETTT controller = "+quizId);
		Quiz quiz = quizService.getQuizById(quizId);		
		List<Question> listOfQuestionsToAttempt = quiz.getListOfQuestions();		
		String quizName = quiz.getQuizName();
		Question question = listOfQuestionsToAttempt.get(0);		
		
		model.put("question", question);
		model.put("answer",  new Answer());
		model.put("quizName", quizName);
		model.put("quizId", quizId);
		model.put("index", index + 1);
		
		index=1;
		return "attemptQuestionByUser";
	}
	
	@PostMapping("attempt/{quizId}")  
	public String submitQuestion(@ModelAttribute("answer")Answer answer,@PathVariable Integer quizId,ModelMap model)  
	{  
		System.out.println(index+"."+"Quiz id in ATTEMPT PosTTT controller = "+quizId);

		Quiz quiz = quizService.getQuizById(quizId);	
		
		List<Question> listOfQuestions = quiz.getListOfQuestions();
		quizService.appendListOfAnswers(answer);

		
		if(index< (listOfQuestions.size())) {
			
		String quizName = quiz.getQuizName();
		Question question = listOfQuestions.get(index++);
		model.put("question", question);
		model.put("answer",  new Answer());
		model.put("quizName", quizName);
		model.put("quizId", quizId);
		model.put("index", index);		
		System.out.println(answer);
		return "attemptQuestionByUser";
		
		}		
		
		else {
			int score=0;
			int i = 0;
			List<Answer> listOfAnswers = quizService.getListOfAllAns();
			List<Question> listOfQuestion = quiz.getListOfQuestions();

			for(Answer answeritr : listOfAnswers) {
				if((answeritr.getChoice()) == (listOfQuestion.get(i++).getCorrectOptionNo())) {
					score++;
				}
			}
			model.put("score", score);
			model.put("listOfAnswers", listOfAnswers);
			model.put("listOfQuestionsForResult", listOfQuestion);
			System.out.println(score);
			for(Answer answeritr : listOfAnswers) {
				System.out.println("choice = "+answeritr.getChoice());
			}
			quizService.emptyTheAnswerList();
			index=0;
		return "result";  
		}
	} 
		
	
	
	
	//------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------
		
	
	
	
	
	//API's Related to Question
	
	@GetMapping("createQuestion/{quizId}")
	public String getAddQuestionForm(@PathVariable Integer quizId,ModelMap model) {
		//System.out.println("Quiz id in GET controller = "+quizId);		
		//System.out.println("Question no reached in GET controller = "+questionNo);		
		//System.out.println("We have Set the question no in controller and rendered the form to = "+question.getQuestionNo());		
		
		model.put("question", new Question());		
		Quiz quiz = quizService.getQuizById(quizId);
		model.put("quizName", quiz.getQuizName());
		model.put("quizId", quizId);
		
		
		return "newQuestionCreateForm";
	}
	
	@PostMapping("createQuestion/{quizId}")
	public String addQuestionandOptionsInAQuizPage(@ModelAttribute("question")Question question,@PathVariable Integer quizId,ModelMap myModel) {
		//System.out.println("Quiz id in POST controller = "+quizId);
		//System.out.println("Question no reached in POST controller = "+question.getQuestionNo());

		Integer questionNo = quizService.saveTheQuestion(question,quizId);	
		//System.out.println("Question no after persisting the object in POST controller = "+questionNo);	
			
		return "redirect:/reviewQuestions/"+ Integer.toString(quizId);

	}		
	
	
	@GetMapping("deleteQuestion/{quizId}")
	public String deleteQuestion(@RequestParam Integer questionNo,@PathVariable Integer quizId) {
		//System.out.println("questionNo in DELETE controller = "+questionNo);
		quizService.deleteQuestion(questionNo);
		return "redirect:/reviewQuestions/"+Integer.toString(quizId);
	}
	
	@GetMapping("updateQuestion/{quizId}")
	public String getUpdateQuestionForm(@PathVariable Integer quizId,@RequestParam Integer questionNo,ModelMap model) {
//		System.out.println("Quiz id in update GET CONTROLLER = "+quizId);
//		System.out.println("questionNo in GET controller = "+questionNo);
		Question question = quizService.findQuestion(questionNo);
		Quiz quiz = quizService.getQuizById(quizId);
//		System.out.println(question);
//		System.out.println(question.getQuiz().getQuizId());
		model.put("question", question);
		model.put("quiz", quiz);
		return "updateQuestionForm";
	}
	
	@PostMapping("updateQuestion/{quizId}")
	public String updateQuestion(@ModelAttribute("question")Question question,@PathVariable Integer quizId) {
		//System.out.println("questionNo in update POST controller = "+question.getQuestionNo());
		//System.out.println("Quiz id in Post controller = "+quizId);
		quizService.saveTheQuestion(question, quizId);
		return "redirect:/reviewQuestions/"+Integer.toString(quizId);
	}
	@GetMapping("reviewQuestions/{quizId}")
	public String reviewQuizByAdminPage(@PathVariable Integer quizId,ModelMap model) {
		//System.out.println("Quiz id in REVIEW controller = "+quizId);
		Quiz quiz = quizService.getQuizById(quizId);
		
		List<Question> listOfQuestions = quiz.getListOfQuestions();
		String quizName = quiz.getQuizName();
		model.put("listOfQuestions", listOfQuestions);
		model.put("quizName", quizName);
		model.put("quizId", quizId);
		
		return "paginatedQuizForAdmin";
	}
		
	
	 

}
