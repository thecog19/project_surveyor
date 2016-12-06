class ChangeQuestionResponseResponsetoAwnserid < ActiveRecord::Migration[5.0]
  def change
    remove_column :question_responses, :response
  end
end
