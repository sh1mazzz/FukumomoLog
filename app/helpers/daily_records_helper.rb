module DailyRecordsHelper
  def activity_hours_options
    options = []
    hour = 0.0

    while hour <= 24.0
      options << hour
      hour += 0.5
    end

    options
  end
end
