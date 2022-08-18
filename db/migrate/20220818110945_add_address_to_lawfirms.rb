class AddAddressToLawfirms < ActiveRecord::Migration[6.1]
  def change
    add_column :lawfirms, :address, :string
  end
end
