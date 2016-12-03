class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.integer :question_id
      t.text :body
      t.string :letter
      t.text :correct_response

      t.timestamps
    end
  end
end
