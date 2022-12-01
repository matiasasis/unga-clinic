# frozen_string_literal: true

class TreatmentType < ApplicationRecord
  acts_as_paranoid

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: treatment_types
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_treatment_types_on_deleted_at  (deleted_at)
#
