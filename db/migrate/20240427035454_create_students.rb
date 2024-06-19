class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :lastname
      t.integer :usn

      t.timestamps
    end
  end
end
