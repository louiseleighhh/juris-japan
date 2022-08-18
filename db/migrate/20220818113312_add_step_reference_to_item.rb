class AddStepReferenceToItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :step, null: false, foreign_key: true
  end
end
