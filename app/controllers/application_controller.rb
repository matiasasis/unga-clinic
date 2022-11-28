# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_user)
    '/auth/sign_in'
  end

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(_user)
    # debugger
    '/users'
  end
end
