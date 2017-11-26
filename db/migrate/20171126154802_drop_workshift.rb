class DropWorkshift < ActiveRecord::Migration
  def change
    drop_table :workshifts
  end
end
