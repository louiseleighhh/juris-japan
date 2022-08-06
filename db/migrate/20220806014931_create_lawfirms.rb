class CreateLawfirms < ActiveRecord::Migration[6.1]
  def change
    create_table :lawfirms do |t|
      t.string :name
      t.string :location
      t.string :specialty
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
