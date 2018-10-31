class EventsController < ApplicationController
  before_action :set_eventdata, only: [:index, :search]
  before_action :set_event_id, only: [:show, :test1, :edit, :update, :destroy]
  before_action :set_timerange, only: [:test1]

  def index
  end

  def search
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
    @registration = @event.registrations.build
    @registrations = @event.registrations
  end


  def test1
    set_startgroup = Time.zone.parse('2018-10-09T14:00:00+09:00')
    set_endgroup = Time.zone.parse('2018-10-09T17:00:00+09:00')

    # @registrations_data = Registration.where(event_id: @event.id).where(start_datetime: set_startgroup..set_endgroup).order("start_datetime ASC")
    # Registrationからevent_idと開始時間範囲内に該当するデータ取得
    @registrations_data = Registration.where(event_id: 4).where(start_datetime: Time.zone.parse('2018-10-09T14:00:00+09:00')..Time.zone.parse('2018-10-09T17:00:00+09:00')).order("start_datetime ASC")

    # 取得データ内のうち、開始時間と登録idだけの変数に加工
    # 時間、登録idのみの配列作成化
    temp_group = @registrations_data.pluck(:start_datetime, :id)

    # ハッシュ作成、デフォルトで開始時間をキー、値をid、配列とする
    # {キー（時間）[登録ID,登録ID]}
    @temporary_group = Hash.new { |h, k| h[k] = [] }
    # eachで格納
    temp_group.each do |k, v|
      @temporary_group[k] << v
    end

    # j=登録idが1人を探す
    @temporary_group.each do |i,j|
      #1人なら、後ろへ合流先を探す
      if j.length == 1
        group_serach(i,j)
      end
    end
  end

  def group_serach(i,j)
    @single_data = @registrations_data.find(j[0])
    @single_data.end_datetime
    test_h.find {|v,k| v > @single_data.end_datetime && v < @single_data.start_datetime}
  end

  def group_usiro
    @usiro_kettei = @registrations_data.find(30)
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
      params.require(:event).permit(:title, :content, :requirement, :label_list)
    end

    def set_eventdata
      @search = Event.ransack(params[:q])
      @events = @search.result(distinct: true)
    end

    def set_event_id2
      @event = Event.find(params[:id])
    end

    def set_event_id
      @event2 = Event.where(id: params[:id])
      @event = Event.find(params[:id])
    end

    def set_timerange
      # 時間が送信された場合のみ取得
      if params[:timerange_start].present?
        a = params[:timerange_start]
        b = params[:timerange_end]
        @time_start = Time.zone.local(
          a["datetime1(1i)"],
          a["datetime1(2i)"],
          a["datetime1(3i)"],
          a["datetime1(4i)"],
          a["datetime1(5i)"]
        )
        @time_end = Time.zone.local(
          b["datetime2(1i)"],
          b["datetime2(2i)"],
          b["datetime2(3i)"],
          b["datetime2(4i)"],
          b["datetime2(5i)"]
        )
      end
    end
end
