class Client < ApplicationRecord

  def to_s
    "#{name} (#{age})"
  end
end
