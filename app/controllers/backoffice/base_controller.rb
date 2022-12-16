# frozen_string_literal: true

class Backoffice::BaseController < ApplicationController
  before_action :authenticate_user!
end
