module ApplicationHelper
  def viewtime_start(timedate)
    timedate.strftime("%Y年%m月%d日 %H:%M")
  end

  def viewtime_end(timedate)
    timedate.strftime("%m月%d日 %H:%M")
  end
end
