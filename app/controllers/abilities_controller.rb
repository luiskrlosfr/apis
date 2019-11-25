class AbilitiesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :destroy]

  def index; end

  def new
    @ability = Ability.new
  end

  def edit
    @ability = Ability.find(params[:id])
  end

  def create
    @ability = Ability.new(ability_params)
    if @ability.save
      flash[:success] = 'Servicio registrado exitosamente'
      redirect_to current_user
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :new
    end
    @ability.errors.messages
  end

  def update
    @ability = Ability.find(params[:id])
    if @ability.update(ability_params)
      flash[:success] = 'Información actualizada exitosamente'
      redirect_to current_user
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :edit
    end
  end

  def show
    @ability = Ability.find(params[:id])
  end

  def destroy
    @ability = Ability.find(params[:id])
    @ability.destroy
    flash[:destroy] = 'Servicio eliminado exitosamente'
    redirect_to current_user
  end

  private

  def ability_params
    params.require(:ability).permit(:level, :user_id, :trait_id )
  end
end
