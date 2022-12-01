
class Treatment < ApplicationRecord
  belongs_to :professional
  belongs_to :treatment_type
end

# == Schema Information
#
# Table name: treatments
#
#  id                :bigint           not null, primary key
#  description       :string
#  downpayment       :integer
#  duration_min      :integer
#  name              :string
#  place             :string
#  price             :integer
#  room              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  professional_id   :bigint           not null
#  treatment_type_id :bigint           not null
#
# Indexes
#
#  index_treatments_on_professional_id    (professional_id)
#  index_treatments_on_treatment_type_id  (treatment_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (professional_id => professionals.id)
#  fk_rails_...  (treatment_type_id => treatment_types.id)
#
