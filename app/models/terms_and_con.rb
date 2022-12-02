# frozen_string_literal: true

class TermsAndCon < ApplicationRecord
  acts_as_paranoid

  def to_s
    'Términos y Condiciones'
  end
end

# == Schema Information
#
# Table name: terms_and_cons
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_terms_and_cons_on_deleted_at  (deleted_at)
#
