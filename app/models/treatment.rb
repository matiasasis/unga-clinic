class Treatment < ApplicationRecord
  belongs_to :professional
  belongs_to :treatment_type
end
