class Starttimetotimestamp < ActiveRecord::Migration
  def change
    change_column :workshifts, :starttime, :timestamp
  end
end
