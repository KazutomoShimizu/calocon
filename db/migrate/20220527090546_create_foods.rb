class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.text :image
      t.text :body

      t.timestamps
    end
  end
end
