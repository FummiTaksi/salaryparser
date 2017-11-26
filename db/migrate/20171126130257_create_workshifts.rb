class CreateWorkshifts < ActiveRecord::Migration
  def change
    create_table :workshifts do |t|
      t.string :starttime
      t.string :DateTime
      t.string :endtime
      t.string :DateTime

      t.timestamps null: false
    end
  end
end
