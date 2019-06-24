class RefactorQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :step_id
    add_column :questions, :step, :integer
    add_column :questions, :ordering, :integer
    add_column :questions, :form_id, :integer

  end
end

