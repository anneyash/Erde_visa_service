class AddOptionalTextAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :has_optional_answer, :boolean
  end
end
