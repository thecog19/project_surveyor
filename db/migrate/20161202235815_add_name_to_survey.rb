class AddNameToSurvey < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :name, :string
  end
end
