# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  before_action :authenticate_user!

  # GET /users
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  # GET /users/1
  # def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "#{I18n.t("activerecord.models.user.one")} creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params.merge(password: user_params[:password].presence))
      redirect_to @user, notice: "#{I18n.t("activerecord.models.user.one")} modificado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: "#{I18n.t("activerecord.models.user.one")} eliminado exitosamente."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :birthday, :password)
  end
end
