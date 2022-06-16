class ChangeDatetypeWeightHistoryOfWeight < ActiveRecord::Migration[6.0]
  def change
    change_column :weight_histories, :weight, :float
  end
end
