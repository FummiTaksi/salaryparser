class DropHourTime < ActiveRecord::Migration
  def change
    drop_table :hour_times;
  end
end
