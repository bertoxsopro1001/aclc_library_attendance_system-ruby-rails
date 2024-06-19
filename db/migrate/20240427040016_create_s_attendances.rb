class CreateSAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :s_attendances do |t|
      t.datetime :time_in
      t.datetime :time_out
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
