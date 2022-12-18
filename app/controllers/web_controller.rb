# frozen_string_literal: true

class WebController < ApplicationController
  layout 'web'

  def main
    @treatments = Treatment.all
  end

  def treatments
    @treatments = Treatment.all
  end

  def frequently_asked_questions
    @faqs = Faq.where(show: true)
  end

  def terms_and_conditions
    @terms_and_cons = TermsAndCon.first_or_create
  end
end
