# frozen_string_literal: true

class WebController < ApplicationController
  layout 'web'

  def main
    @treatments = Treatment.show
  end

  def treatments
    @treatments = Treatment.show
  end

  def treatment
    @treatment = Treatment.friendly.find(params[:treatment_slug])
    @related_treatments = Treatment.related
  end

  def frequently_asked_questions
    @faqs = Faq.show
  end

  def terms_and_conditions
    @terms_and_cons = TermsAndCon.first_or_create
  end

  def send_contact_data
    @contact = Contact.new(
      name: params[:name],
      email: params[:email],
      phone: params[:phone],
      message: params[:message]
    )

    if @contact.save
      redirect_to root_path, notice: '¡Se ha envíado correctamente la información!'
    else
      redirect_to root_path, notice: 'Hubo un error al enviar la información, intenta más tarde'
    end
  end

  def create_newsletter
    if Newsletter.where(email: params[:email]).exists?
      redirect_to root_path, notice: '¡Te has suscrito exitosamente!'
      return
    end

    @newsletter = Newsletter.new(email: params[:email])

    if @newsletter.save
      redirect_to root_path, notice: '¡Te has suscrito exitosamente!'
    else
      redirect_to root_path, notice: 'Hubo un error al subscribirte, intenta más tarde'
    end
  end
end
