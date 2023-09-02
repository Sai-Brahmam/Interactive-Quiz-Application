package com.quiz.project.advice;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import com.quiz.project.exception.ErrorDetails;
import com.quiz.project.exception.ResourceNotFoundException;
import com.quiz.project.service.QuizService;
//This annotation will scan all RestControllers for corresponding exceptions
@RestControllerAdvice  //This annotation will help the application for handling exceptions globally across all controllers 
public class GlobalExceptionHandler {
	@Autowired
	private QuizService quizService;
	
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ExceptionHandler(ResourceNotFoundException.class)
	public ErrorDetails questionNotFoundExceptionHandler(ResourceNotFoundException ex,WebRequest request) throws Exception{
		ErrorDetails err = new ErrorDetails(LocalDateTime.now(),
				ex.getMessage(), request.getDescription(false));
		return err;

	}
	
	@ResponseStatus(HttpStatus.CONTINUE)
	@ExceptionHandler(IndexOutOfBoundsException.class)
	public ErrorDetails indexOutOfBoundsExceptionHandler(IndexOutOfBoundsException ex,WebRequest request) throws Exception{
		quizService.emptyTheAnswerList();
		ErrorDetails err = new ErrorDetails(LocalDateTime.now(),
				ex.getMessage(), request.getDescription(false));
		return err;
	}

}
