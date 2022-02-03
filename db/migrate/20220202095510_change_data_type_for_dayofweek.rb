class ChangeDataTypeForDayofweek < ActiveRecord::Migration[5.2]
  def change
    change_column :courses, :dayofweek, :text
  end
end
