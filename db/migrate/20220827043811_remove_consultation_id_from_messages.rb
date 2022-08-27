class RemoveConsultationIdFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :consultation_id, :string
  end
end
