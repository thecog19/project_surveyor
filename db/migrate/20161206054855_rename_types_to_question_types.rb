class RenameTypesToQuestionTypes < ActiveRecord::Migration[5.0]
  def change
    rename_table :types, :question_types
    rename_column :questions, :type_id, :question_type_id
  end
end
