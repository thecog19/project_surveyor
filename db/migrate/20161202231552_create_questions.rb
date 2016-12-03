class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :type_id
      t.integer :survey_id
      t.string :body

      t.timestamps
    end
  end
end
