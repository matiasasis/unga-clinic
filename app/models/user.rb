# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birthday               :date
#  deleted_at             :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at            (deleted_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
