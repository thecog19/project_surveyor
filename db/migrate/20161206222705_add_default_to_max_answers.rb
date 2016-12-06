class AddDefaultToMaxAnswers < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :max_answers, :integer, default: 1 
  end
end
