class RemoveColumnFromConsultation < ActiveRecord::Migration[6.1]
  def change
    remove_column :consultations, :step_id, :string
  end
end
