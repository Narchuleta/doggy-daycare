class AddOwnerToDog < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :owner, :string
  end
end
