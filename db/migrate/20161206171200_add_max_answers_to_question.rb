class AddMaxAnswersToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :max_answers, :integer
  end
end
