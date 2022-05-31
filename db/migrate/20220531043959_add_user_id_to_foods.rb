class AddUserIdToFoods < ActiveRecord::Migration[6.0]
  def change
    add_reference :foods, :user, foreign_key: true
  end
end
