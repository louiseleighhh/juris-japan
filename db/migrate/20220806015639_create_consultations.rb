class CreateConsultations < ActiveRecord::Migration[6.1]
  def change
    create_table :consultations do |t|
      t.string :user_id
      t.string :procedure_id
      t.string :lawfirm_id

      t.timestamps
    end
  end
end
