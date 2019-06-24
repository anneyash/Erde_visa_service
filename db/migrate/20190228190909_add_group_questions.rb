class AddGroupQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :is_group_view, :boolean
  end
end
