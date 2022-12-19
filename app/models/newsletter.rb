# frozen_string_literal: true
class Newsletter < ApplicationRecord

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
