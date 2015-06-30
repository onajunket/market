class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.integer :category_id

      t.timestamps null: false
    end
      add_reference :listings, :subcategory
  end
end
