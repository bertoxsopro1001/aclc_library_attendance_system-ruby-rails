class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :reason
      t.references :s_attendance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
