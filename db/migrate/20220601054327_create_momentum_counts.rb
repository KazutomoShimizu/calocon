class CreateMomentumCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :momentum_counts do |t|
      t.string :name
      t.integer :magnification
      t.references :weight_history, null: false, foreign_key: true

      t.timestamps
    end
  end
end
