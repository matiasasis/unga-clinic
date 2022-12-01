# frozen_string_literal: true

class Setting < ApplicationRecord
    acts_as_paranoid
    
    def to_s
        name
    end
end
