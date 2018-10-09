class RegistrationsController < ApplicationController
  def create
    @registration = current_user.registrations.build(registration_params)
    set_event

    respond_to do |format|
      if @registration.save
        format.html { redirect_to event_path(@event), notice: "参加登録しました" }
        format.js { render :index }
      end
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    set_event
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event), notice: "参加登録をキャンセルしました" }
      format.js { render :index }
    end
  end

  private
    def registration_params
      params.require(:registration).permit(:event_id, :start_datetime, :end_datetime, :on_requirement)
    end

    def set_event
      @event = @registration.event
    end
end
