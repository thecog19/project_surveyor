class CreateQuestionResponsesAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :question_responses_answers do |t|
      t.references :question_response, foreign_key: true
      t.references :possible_answer, foreign_key: true

      t.timestamps
    end
  end
end
