class RefactorAnswer < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :question, foreign_key: true
    remove_reference :answers, :question_option
    rename_column :answers, :custom_answer, :answer

  end
end
