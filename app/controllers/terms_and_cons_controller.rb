# frozen_string_literal: true

class TermsAndConsController < ApplicationController
  before_action :set_terms_and_con, only: %i[show edit update destroy]

  # GET /terms_and_cons
  def index
    @terms_and_cons = TermsAndCon.paginate(page: params[:page], per_page: 12)
  end

  # GET /terms_and_cons/1
  def show; end

  # GET /terms_and_cons/new
  def new
    @terms_and_con = TermsAndCon.new
  end

  # GET /terms_and_cons/1/edit
  def edit; end

  # POST /terms_and_cons
  def create
    @terms_and_con = TermsAndCon.new(terms_and_con_params)

    if @terms_and_con.save
      redirect_to terms_and_cons_url, notice: "#{I18n.t('activerecord.models.terms_and_con.one')} creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /terms_and_cons/1
  def update
    if @terms_and_con.update(terms_and_con_params)
      redirect_to terms_and_cons_url,
                  notice: "#{I18n.t('activerecord.models.terms_and_con.one')} modificado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /terms_and_cons/1
  def destroy
    @terms_and_con.destroy
    redirect_to terms_and_cons_url, notice: "#{I18n.t('activerecord.models.terms_and_con.one')} eliminado exitosamente."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_terms_and_con
    @terms_and_con = TermsAndCon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def terms_and_con_params
    params.require(:terms_and_con).permit(:text)
  end
end
