class ChangeStartTimeToDateTime < ActiveRecord::Migration
  def change
    change_column :workshifts, :starttime, :datetime
  end
end
