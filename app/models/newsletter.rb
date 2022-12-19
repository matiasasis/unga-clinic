# frozen_string_literal: true

class Newsletter < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true

  def to_s
    email
  end
end

# == Schema Information
#
# Table name: newsletters
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_newsletters_on_email  (email) UNIQUE
#
