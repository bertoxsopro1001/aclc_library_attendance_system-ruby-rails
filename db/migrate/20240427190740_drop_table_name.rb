class DropTableName < ActiveRecord::Migration[7.1]
  def change
    drop_table :activities
  end
end
