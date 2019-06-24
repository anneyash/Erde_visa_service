class CreateSteps < ActiveRecord::Migration[5.2]

  def change
    create_table :steps do |t|
      t.belongs_to :form, index: true
      t.integer :order_id

      t.timestamps
    end
  end
end