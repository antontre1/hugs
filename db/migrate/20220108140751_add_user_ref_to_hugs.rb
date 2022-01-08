class AddUserRefToHugs < ActiveRecord::Migration[6.1]
  def change
    add_reference :hugs, :user, null: false, foreign_key: true
  end
end
