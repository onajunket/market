class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :company, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :country, :string
    add_column :users, :telephone, :string
    add_column :users, :description, :text
    add_column :users, :website, :string
  end
end
