# frozen_string_literal: true

class Professional < ApplicationRecord
  acts_as_paranoid

  def to_s
    "#{first_name} #{last_name}"
  end
end
