# frozen_string_literal: true

class Client < ApplicationRecord
  validates :age, numericality: { greater_than_or_equal_to: 50 }

  def to_s
    "#{name} (#{age})"
  end
end
