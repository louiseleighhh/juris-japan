class AddDescriptionToLawfirms < ActiveRecord::Migration[6.1]
  def change
    add_column :lawfirms, :description, :text
  end
end
