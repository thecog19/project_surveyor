class RefactorResponsesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :responses, :survey_response_id, :integer
    rename_table :responses, :question_responses
  end
end
