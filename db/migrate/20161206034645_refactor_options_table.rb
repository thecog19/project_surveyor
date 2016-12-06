class RefactorOptionsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :options, :letter
    remove_column :options, :correct_response
    rename_table :options, :possible_answers
  end
end
