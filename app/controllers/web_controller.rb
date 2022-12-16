# frozen_string_literal: true

class WebController < ApplicationController
  layout 'web'

  def main; end

  def frequently_questions
    @faqs = Faq.paginate(page: params[:page], per_page: 12)
  end
end