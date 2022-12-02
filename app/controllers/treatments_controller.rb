# frozen_string_literal: true

class TreatmentsController < ApplicationController
  before_action :set_treatment, only: %i[edit update destroy]

  # GET /treatments
  def index
    @treatments = Treatment.paginate(page: params[:page], per_page: 12)
  end

  # GET /treatments/new
  def new
    @treatment = Treatment.new
  end

  # GET /treatments/1/edit
  def edit; end

  # POST /treatments
  def create
    @treatment = Treatment.new(treatment_params)

    if @treatment.save
      redirect_to treatments_url, notice: "#{I18n.t('activerecord.models.treatment.one')} creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /treatments/1
  def update
    if @treatment.update(treatment_params)
      redirect_to treatments_url, notice: "#{I18n.t('activerecord.models.treatment.one')} modificado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /treatments/1
  def destroy
    @treatment.destroy
    redirect_to treatments_url, notice: "#{I18n.t('activerecord.models.treatment.one')} eliminado exitosamente."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_treatment
    @treatment = Treatment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def treatment_params
    params.require(:treatment).permit(:name, :description, :place, :price, :downpayment, :professional_id,
                                      :duration_min, :treatment_type_id, :room)
  end
end
