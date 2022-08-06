class AddKeywsToConsultations < ActiveRecord::Migration[6.1]
  def change
    remove_column :consultations, :user_id, :string
    remove_column :consultations, :procedure_id, :string
    remove_column :consultations, :lawfirm_id, :string
    add_reference :consultations, :user, null: false, foreign_key: true
    add_reference :consultations, :procedure, null: false, foreign_key: true
    add_reference :consultations, :lawfirm, foreign_key: true
  end
end
