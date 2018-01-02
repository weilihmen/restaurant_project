class AddRankToRestaraunts < ActiveRecord::Migration[5.1]
  def change
  	add_column(:restaurants, :rank, :integer, default: 0) #新增欄位
  end
end
