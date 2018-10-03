class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params.require(:event).permit(:title, :content, :requirement))
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
  end

  def destroy
  end
end
