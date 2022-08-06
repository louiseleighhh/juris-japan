class RemoveSpecialtyFromLawfirms < ActiveRecord::Migration[6.1]
  def change
    remove_column :lawfirms, :specialty, :string
  end
end
