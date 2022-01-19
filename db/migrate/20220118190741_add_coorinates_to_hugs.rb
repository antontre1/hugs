class AddCoorinatesToHugs < ActiveRecord::Migration[6.1]
  def change
    add_column :hugs, :latitude, :float
    add_column :hugs, :longitude, :float
  end
end
