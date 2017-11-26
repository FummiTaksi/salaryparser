class Endtimetotimestamp < ActiveRecord::Migration
  def change
    change_column :workshifts, :endtime, :timestamp
  end
end
