class AddConsultationToSteps < ActiveRecord::Migration[6.1]
  def change
    add_reference :steps, :consultation, null: false, foreign_key: true
  end
end
