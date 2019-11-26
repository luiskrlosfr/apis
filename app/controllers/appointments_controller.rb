class AppointmentsController < ApplicationController
  def index 
    @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new
    @availability = Availability.where(user_id: params[:agent_id]).map{|a| [a.day.name + ' - ' + a.simple_time.hour, a.id]}
    @agent = User.find(params[:agent_id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = 'Cita registrada exitosamente'
      redirect_to appointments_path
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :new
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      flash[:success] = 'Información actualizada exitosamente'
      redirect_to appointments_path
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :edit
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:destroy] = 'Cita eliminada exitosamente'
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:client_id, :agent_id, :address, :availability_id, :schedule )
  end
end
