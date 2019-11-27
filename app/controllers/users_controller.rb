class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :show, :edit, :destroy]
  before_action :authenticate_client, only:[:index]
  def index
    @q = User.ransack(params[:q])
    @agents = @q.result(distinct: true).where(user_type: 'agent')
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Usuario registrado exitosamente'
      redirect_to @user
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Información actualizada exitosamente'
      redirect_to @user
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:destroy] = 'Usuario eliminado exitosamente'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :sex, :email, :user_type, :region_id, :password, :password_confirmation)
  end

  def authenticate_client
    redirect_to current_user unless current_user.client?
  end
end