class Addattributes < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :course, :string
    add_column :students, :year, :integer
    add_column :students, :birth_day, :date
  end
end
