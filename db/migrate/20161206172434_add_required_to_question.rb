class AddRequiredToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :required, :integer
  end
end
