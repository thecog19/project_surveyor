class AddIndexToTypeName < ActiveRecord::Migration[5.0]
  def change
    add_index :question_types, :description, unique: true
  end
end
