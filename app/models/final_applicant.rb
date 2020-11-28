class FinalApplicant < ApplicationRecord
  validates :screen_name, uniqueness: true
end
