class Event < ActiveRecord::Base

  validates_format_of :organizer_email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #tested
  validate :event_date_cannot_be_in_the_past, # tested
           :month_date_cannot_be_outside_range, 
           :day_date_cannot_be_outside_range
  
  validates :date, :title, :organizer_name, presence: true #tested
  validates :title, uniqueness: true #tested

  def event_date_cannot_be_in_the_past 
    errors.add(:date, "can't be in the past") if
      (!date.blank? and date < Date.today)
  end

  def month_date_cannot_be_outside_range
    errors.add(:date, "month is outside 1-12") if
      !date.blank? and !(1..12).include?(self.date.month)
  end

  def day_date_cannot_be_outside_range
    errors.add(:date, "day is outside 1-31") if
      !date.blank? and !(1..31).include?(self.date.day)
  end

end
