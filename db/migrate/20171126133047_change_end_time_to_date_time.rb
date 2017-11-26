class ChangeEndTimeToDateTime < ActiveRecord::Migration
  def change
    change_column :workshifts, :endtime, :datetime
  end
end
