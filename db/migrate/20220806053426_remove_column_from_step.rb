class RemoveColumnFromStep < ActiveRecord::Migration[6.1]
  def change
    remove_column :steps, :procedure_id, :string
  end
end
