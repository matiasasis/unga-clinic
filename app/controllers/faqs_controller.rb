# frozen_string_literal: true

class FaqsController < ApplicationController
  before_action :set_faq, only: %i[show edit update destroy]

  # GET /faqs
  def index
    @faqs = Faq.paginate(page: params[:page], per_page: 12)
  end

  # GET /faqs/new
  def new
    @faq = Faq.new
  end

  # GET /faqs/1/edit
  def edit; end

  # POST /faqs
  def create
    @faq = Faq.new(faq_params)

    if @faq.save
      redirect_to faqs_url, notice: "#{I18n.t('activerecord.models.faq.one')} creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /faqs/1
  def update
    if @faq.update(faq_params)
      redirect_to faqs_url, notice: "#{I18n.t('activerecord.models.faq.one')} modificado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /faqs/1
  def destroy
    @faq.destroy
    redirect_to faqs_url, notice: "#{I18n.t('activerecord.models.faq.one')} eliminado exitosamente."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faq
    @faq = Faq.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def faq_params
    params.require(:faq).permit(:title, :answer, :show)
  end
end
