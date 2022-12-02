# frozen_string_literal: true

class Professional < ApplicationRecord
  acts_as_paranoid

  has_many :treatments

  def to_s
    "#{first_name} #{last_name}"
  end
end

# == Schema Information
#
# Table name: professionals
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  email      :string
#  first_name :string
#  last_name  :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_professionals_on_deleted_at  (deleted_at)
#
