class UpdateDataTypeForDayofweek < ActiveRecord::Migration[5.2]
  def change
    change_column :courses, :dayofweek, :string, array: true
  end
end
