class RenameQuestionColumnTypeToQuestionType < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :type, :question_type
  end

  def self.down
    rename_column :questions, :question_type, :type
  end
end
