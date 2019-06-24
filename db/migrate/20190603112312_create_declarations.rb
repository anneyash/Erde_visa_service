class CreateDeclarations < ActiveRecord::Migration[5.2]
  def change
    create_table :declarations do |t|
      t.string :title
      t.string :body
      t.integer :step
      t.belongs_to :form, foreign_key: true

      t.timestamps
    end
  end
end
