class RemoveCityFromHugs < ActiveRecord::Migration[6.1]
  def change
    remove_column(:hugs, :city, if_exists: true)
  end
end
