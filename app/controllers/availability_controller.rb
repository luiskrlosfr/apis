class AvailabilityController < ApplicationController
  def index 
    @availabilities = Availability.all.where(user_id: current_user.id)
  end

  def new
    @availability = Availability.new
  end

  def edit
    @availability = Availability.find(params[:id])
  end

  def create
    @availability = Availability.new(availability_params)
    if @availability.save
      flash[:success] = 'Horario Laboral registrado exitosamente'
      redirect_to availability_index_path
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :new
    end
  end

  def update
    @availability = Availability.find(params[:id])
    if @availability.update(availability_params)
      flash[:success] = 'Información actualizada exitosamente'
      redirect_to current_user
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :edit
    end
  end

  def show
    @availability = Availability.find(params[:id])
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy
    flash[:destroy] = 'Horario Laboral eliminado exitosamente'
    redirect_to current_user
  end

  private

  def availability_params
    params.require(:availability).permit(:simple_time_id, :user_id, :day_id )
  end
end
