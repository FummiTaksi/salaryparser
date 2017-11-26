class AddWageToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :wage, :float
  end
end
