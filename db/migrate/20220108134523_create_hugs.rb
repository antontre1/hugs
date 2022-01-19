class CreateHugs < ActiveRecord::Migration[6.1]
  def change
    create_table :hugs do |t|
      t.string :title
      t.string :description
      t.string :category
      t.float :price
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
