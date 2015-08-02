class AddBuyerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :buyer, :boolean, default: false
  end
end
