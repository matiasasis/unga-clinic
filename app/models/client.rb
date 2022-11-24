class Client < ApplicationRecord
  # self.per_page 20
  validates :age, numericality: { greater_than_or_equal_to: 50 }


  def to_s
    "#{name} (#{age})"
  end


end
