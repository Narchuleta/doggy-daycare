class AddOwnerToDogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :dogs, :owner, foreign_key: true
  end
end
