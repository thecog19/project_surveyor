class AddDescriptionToSurvey < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :description, :text
  end
end
