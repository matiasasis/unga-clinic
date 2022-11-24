class Client < ApplicationRecord

  validates :age, numericality: { greater_than: 10 }

  
  def to_s
    "#{name} (#{age})"
  end


end
