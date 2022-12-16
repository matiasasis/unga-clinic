# frozen_string_literal: true

class WebController < ApplicationController
  layout 'web'

  def main; end

  def frequently_asked_questions
    @faqs = Faq.all
  end
end