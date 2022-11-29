# frozen_string_literal: true

class ProfessionalsController < ApplicationController
  before_action :set_professional, only: %i[show edit update destroy]

  # GET /professionals
  def index
    @professionals = Professional.paginate(page: params[:page], per_page: 12)
  end

  # GET /professionals/1
  def show; end

  # GET /professionals/new
  def new
    @professional = Professional.new
  end

  # GET /professionals/1/edit
  def edit; end

  # POST /professionals
  def create
    @professional = Professional.new(professional_params)

    if @professional.save
      redirect_to professionals_url, notice: "#{I18n.t('activerecord.models.professional.one')} creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /professionals/1
  def update
    if @professional.update(professional_params)
      redirect_to professionals_url,
                  notice: "#{I18n.t('activerecord.models.professional.one')} modificado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /professionals/1
  def destroy
    @professional.destroy
    redirect_to professionals_url, notice: "#{I18n.t('activerecord.models.professional.one')} eliminado exitosamente.",
                                   status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_professional
    @professional = Professional.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def professional_params
    params.require(:professional).permit(:first_name, :last_name, :email, :phone)
  end
end
