class TimeSetting < ApplicationRecord
  def self.set(day)
    set_date = Reserve.where(date: day)
    if set_date.empty?
      set = TimeSetting.find_by(week: day.wday.to_i)

      return nil unless set.workday

      set_end = set.start
      while set_end < set.end
        Reserve.create!(date: day, start: set_end, end: set_end += set.interval * 60)
      end
      set_date = Reserve.where(date: day)
    end
    set_date
  end
end
