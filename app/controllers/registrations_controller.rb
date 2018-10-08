class RegistrationsController < ApplicationController
  def create
    # @registration = current_user.registrations.build(params.permit(:event_id))
    @registration = current_user.registrations.build(registrations_params)
    @event = @registration.event

    respond_to do |format|
      if @registration.save
        format.html { redirect_to event_path(@event), notice: '参加登録しました' }
      end
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def registrations_params
    params.require(:registration).permit(:event_id, :desire_day, :desire_time, :on_requirement)
  end
end
