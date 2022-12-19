# frozen_string_literal: true

class Treatment < ApplicationRecord
  extend FriendlyId

  belongs_to :professional
  belongs_to :treatment_type
  has_many_attached :pictures, dependent: :destroy

  friendly_id :name, use: :slugged

  validates_uniqueness_of :name

  validates :name, :professional_id, :treatment_type_id, presence: true

  scope :show, -> { where(show: true) }

  scope :related, -> (limit = 3) { order("RANDOM()").limit(limit) }

  def to_s
    name
  end
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
#  show              :boolean          default(FALSE)
#  slug              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  professional_id   :bigint           not null
#  treatment_type_id :bigint           not null
#
# Indexes
#
#  index_treatments_on_professional_id    (professional_id)
#  index_treatments_on_slug               (slug) UNIQUE
#  index_treatments_on_treatment_type_id  (treatment_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (professional_id => professionals.id)
#  fk_rails_...  (treatment_type_id => treatment_types.id)
#
