class AddCoordinatesToLawfirms < ActiveRecord::Migration[6.1]
  def change
    add_column :lawfirms, :latitude, :float
    add_column :lawfirms, :longitude, :float
  end
end
