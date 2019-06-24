class RefactorAnswerModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :title
    remove_column :answers, :body
    add_column :answers, :custom_answer, :string
    add_reference :answers, :question_option, foreign_key: true
  end
end
