class Student < ApplicationRecord
    has_many :s_attendances, dependent: :destroy
    has_many :activities, through: :s_attendances
end
