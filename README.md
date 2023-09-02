# Interactive-Quiz-Application
The Interactive Quiz Application is an online quiz platform that allows administrators to manage quizzes, questions, and answers, while users can participate in quizzes and receive scores. 
The application is built using Java 17 and Spring Boot 3x for the backend, and JSP, Spring HTML, JavaScript, and Bootstrap 5x for the front end.
It utilizes RESTful APIs for CRUD operations and communicates with a MySQL database.

## Features

- **Admin functionalities**:
  - Add, edit, and delete quizzes.
  - Manage questions within each quiz.
  - View and analyze quiz results.

- **User functionalities**:
  - Browse available quizzes.
  - Attempt quizzes and receive scores upon completion.

## Technologies Used

### Backend

- Java 17: A programming language for the backend logic.
- Spring Boot 3x: Framework for building robust and scalable applications.
  - Spring Data JPA: Simplifies database interactions using Java Persistence API.
  - Maven: Dependency management and build tool.
- MySQL: Relational database management system for data storage.

### Frontend

- JSP (JavaServer Pages): Dynamic webpage generation.
- Spring HTML: Integration of HTML templates with Spring Boot.
- JavaScript: Enhances user interactivity and dynamic content.
- Bootstrap 5x: Frontend framework for responsive and attractive UI design.

### REST APIs

The application provides RESTful APIs for interacting with quizzes and questions, including:
- GET: Retrieve quiz/question details.
- POST: Add new quizzes/questions.
- DELETE: Remove quizzes/questions.

## Getting Started

Follow these steps to set up and run the Interactive Quiz Application:

1. Clone the repository:
   open git bash and hit,
   
   git clone https://github.com/SanketSPande/interactive-quiz-application.git
   
   cd interactive-quiz-application
   
3. Run the Spring Boot application using your preferred IDE :

    step 1 -> Open your preferred IDE and import this project as an "Existing Maven Project"
    
    step 2 -> Go to "src/main/java" 
    
    step 3 -> Select "ProjectApplication.java" in the "com/quiz/project" package

    step 4 -> "Right Click" and select "Run as" and then "Java Application"

## Backend Setup:

Make sure you have Java 17 and MySQL installed.

Configure your MySQL database settings in src/main/resources/application.properties.

Currently, the server port number is 3030 and MySql is running on port number 3306, if you want, you may customize it in src/main/resources/application.properties.


## Access the Application:

Open your web browser and go to http://localhost:3030 to use the Interactive Quiz Application.
