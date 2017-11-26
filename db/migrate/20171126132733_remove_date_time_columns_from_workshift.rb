class RemoveDateTimeColumnsFromWorkshift < ActiveRecord::Migration
  def change
    remove_column :workshifts, :DateTime
  end
end
