# frozen_string_literal: true

class Faq < ApplicationRecord
  acts_as_paranoid

  def to_s
    name
  end
end