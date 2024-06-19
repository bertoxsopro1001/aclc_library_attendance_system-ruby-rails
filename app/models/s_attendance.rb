class SAttendance < ApplicationRecord
  belongs_to :student
  has_many :activities, dependent: :destroy

  
end
