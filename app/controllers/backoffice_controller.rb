# frozen_string_literal: true

class BackofficeController < ApplicationController
  before_action :authenticate_user!
end
