Users
  name
  email
  have many surveys

Surveys
  has many questions
  has many users


Questions
  Many possible options 
  Many Responses
  Type_id :default text 
  Survey_id 

Type 
  description
  has many questions

Response
  belongs to a question (question_id)
  belong to an user 
  a response (body)

Options
  Question_id
  Body
  Letter
  Correct response 
  
SurveyUsersJoinTable
  user.id
  survey.id
  completed