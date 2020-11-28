class Applicant < ApplicationRecord
  validates :screen_name, uniqueness: true
end
