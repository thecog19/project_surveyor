class CreateSurveyusers < ActiveRecord::Migration[5.0]
  def change
    create_table :surveyusers do |t|
      t.integer :user_id
      t.integer :survey_id
      t.boolean :completed

      t.timestamps
    end
  end
end
