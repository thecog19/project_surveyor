
module Seeder
  class << self
    def generate_surveys(n)
      n.times { Survey.create(name: survey_name,
                              description: survey_description) }
    end

    def generate_question_types(n)
      n.times { QuestionType.create(description: "Multiple Choice") }
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
        multiple_choice_type_id = 1
        n.times { Question.create(body: question_body,
                                  survey_id: survey_id,
                                  question_type_id: multiple_choice_type_id) }
      end

      def create_n_answers_for(question_id, n)
        n.times { PossibleAnswer.create(body: answer_body,
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
puts "Generating #{ n } surveys"
Seeder.generate_surveys(n)

n = 1
puts "Generating #{ n } question types"
Seeder.generate_question_types(n)

n = 3
survey_ids = Survey.pluck(:id)
puts "Generating #{ n * survey_ids.length } questions"
Seeder.generate_questions(survey_ids, n)

n = 3
question_ids = Question.pluck(:id)
puts "Generating #{ n * question_ids.length } possible answers"
Seeder.generate_possible_answers(question_ids, n)
