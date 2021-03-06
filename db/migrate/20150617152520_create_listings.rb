class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :listings, :users
  end
end
