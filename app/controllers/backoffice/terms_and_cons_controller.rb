# frozen_string_literal: true

class TermsAndConsController < Backoffice::BaseController
  before_action :set_terms_and_con, only: %i[edit update]

  # GET /terms_and_cons
  def index
    @terms_and_cons = TermsAndCon.first_or_create
  end

  # GET /terms_and_cons/1/edit
  def edit; end

  # PATCH/PUT /terms_and_cons/1
  def update
    if @terms_and_con.update(terms_and_con_params)
      redirect_to terms_and_cons_url,
                  notice: "#{I18n.t('activerecord.models.terms_and_con.one')} modificado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_terms_and_con
    @terms_and_con = TermsAndCon.first_or_create
  end

  # Only allow a list of trusted parameters through.
  def terms_and_con_params
    params.require(:terms_and_con).permit(:text)
  end
end
