# frozen_string_literal: true

class Faq < ApplicationRecord
  acts_as_paranoid

  scope :show, -> { where(show: true) }

  def to_s
    title
  end
end

# == Schema Information
#
# Table name: faqs
#
#  id         :bigint           not null, primary key
#  answer     :string
#  deleted_at :datetime
#  show       :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_faqs_on_deleted_at  (deleted_at)
#
