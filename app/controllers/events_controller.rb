class EventsController < ApplicationController

  before_action :set_event_id, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.manager_id = current_user.id

    if @event.save
      redirect_to events_path, notice: "イベントを登録しました！"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "登録内容を変更しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "イベントを削除しました！"
  end

  private
    def event_params
      params.require(:event).permit(:title, :content, :requirement)
    end

    def set_event_id
      @event = Event.find(params[:id])
    end
end
