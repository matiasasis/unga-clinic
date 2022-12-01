# frozen_string_literal: true

class SettingsController < BackofficeController
  before_action :set_setting, only: %i[ show edit update destroy ]

  # GET /settings
  def index
    @settings = Setting.paginate(page: params[:page], per_page: 12)
  end

  # GET /settings/new
  def new
    @setting = Setting.new
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings
  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      redirect_to settings_url, notice: "#{I18n.t('activerecord.models.setting.one')} creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /settings/1
  def update
    if @setting.update(setting_params)
      redirect_to settings_url, notice: "#{I18n.t('activerecord.models.setting.one')} modificado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /settings/1
  def destroy
    @setting.destroy
    redirect_to settings_url, notice: "#{I18n.t('activerecord.models.setting.one')} eliminado exitosamente."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def setting_params
      params.require(:setting).permit(:terms_and_cons)
    end
end
