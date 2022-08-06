class AddColumnToStep < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :instruction, :text
    add_column :steps, :status, :integer
  end
end
