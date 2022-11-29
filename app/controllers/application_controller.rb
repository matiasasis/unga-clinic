# frozen_string_literal: true

class ApplicationController < ActionController::Base

  # Default URL after sign out
  def after_sign_out_path_for(_user)
    '/auth/sign_in'
  end

  # Default url when sign in
  def after_sign_in_path_for(_user)
    '/users'
  end
end
