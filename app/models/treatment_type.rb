# frozen_string_literal: true

class TreatmentType < ApplicationRecord
  acts_as_paranoid

  def to_s
    name
  end
end
