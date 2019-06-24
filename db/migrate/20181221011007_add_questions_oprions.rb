class AddQuestionsOprions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :muted_text, :string
    add_column :questions, :placeholder, :string
  end
end
