# frozen_string_literal: true

class TreatmentTypesController < Backoffice::BaseController
  before_action :set_treatment_type, only: %i[edit update destroy]

  # GET /treatment_types
  def index
    @treatment_types = TreatmentType.paginate(page: params[:page], per_page: 12)
  end

  # GET /treatment_types/new
  def new
    @treatment_type = TreatmentType.new
  end

  # GET /treatment_types/1/edit
  def edit; end

  # POST /treatment_types
  def create
    @treatment_type = TreatmentType.new(treatment_type_params)

    if @treatment_type.save
      redirect_to treatment_types_url,
                  notice: "#{I18n.t('activerecord.models.treatment_type.one')} creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /treatment_types/1
  def update
    if @treatment_type.update(treatment_type_params)
      redirect_to treatment_types_url,
                  notice: "#{I18n.t('activerecord.models.treatment_type.one')} modificado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /treatment_types/1
  def destroy
    @treatment_type.destroy
    redirect_to treatment_types_url,
                notice: "#{I18n.t('activerecord.models.treatment_type.one')} eliminado exitosamente."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_treatment_type
    @treatment_type = TreatmentType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def treatment_type_params
    params.require(:treatment_type).permit(:name)
  end
end
