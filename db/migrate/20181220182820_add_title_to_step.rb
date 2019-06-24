class AddTitleToStep < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :title, :string
  end
end
