class CreateMomentumCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :momentum_counts do |t|
      t.string :work
      t.float :magnification

      t.timestamps
    end
  end
end
