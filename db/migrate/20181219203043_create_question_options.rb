class CreateQuestionOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :question_options do |t|
      t.belongs_to :question, index: true, null: false
      t.string :content

      t.timestamps
    end
  end
end
