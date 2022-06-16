class AddBmrToMomentumCounts < ActiveRecord::Migration[6.0]
  def change
    add_column :momentum_counts, :bmr, :integer
  end
end
