
module Seeder
  class << self
    def generate_surveys(n)
      n.times { Survey.create!(name: survey_name,
                              description: survey_description) }
    end

    def generate_question_types(n)
      n.times { QuestionType.create!(description: "Multiple Choice") }
    end

    def generate_questions(survey_ids, questions_per)
      survey_ids.each do |survey_id|
        create_n_questions_for(survey_id, questions_per)
      end
    end

    def generate_possible_answers(question_ids, answers_per)
      question_ids.each do |question_id|
        create_n_answers_for(question_id, answers_per)
      end
    end

    private
      def create_n_questions_for(survey_id, n)
        n.times { Question.create!(body: question_body,
                                   survey_id: survey_id,
                                   question_type_id: QuestionType.first.id,
                                   max_answers: Faker::Number.between(1,2)) }
      end

      def create_n_answers_for(question_id, n)
        n.times { PossibleAnswer.create!(body: answer_body,
                                  question_id: question_id) }
      end

      def survey_name
        Faker::Company.buzzword
      end

      def survey_description
        Faker::Company.catch_phrase
      end

      def question_body
        Faker::Company.bs + "?"
      end

      def answer_body
        Faker::Hacker.ingverb
      end
  end
end

n = 10
Seeder.generate_surveys(n)
puts "Generated #{ Survey.count } surveys"

n = 1
Seeder.generate_question_types(n)
puts "Generated #{ QuestionType.count } question types"

n = 3
survey_ids = Survey.pluck(:id)
Seeder.generate_questions(survey_ids, n)
puts "Generated #{ Question.count } questions"

n = 3
question_ids = Question.pluck(:id)
Seeder.generate_possible_answers(question_ids, n)
puts "Generated #{ PossibleAnswer.count } possible answers"
