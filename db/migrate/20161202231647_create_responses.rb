class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :response

      t.timestamps
    end
  end
end
