# frozen_string_literal: true

class ListingDecorator < Draper::Decorator
  delegate_all

  def occupancy_rate
    (statistics.limit_by_date.booked.count.to_f / 30).to_f.round(2)
  end

  def average_daily_rate
    (statistics.limit_by_date.unbooked.sum(:price).to_f / 30).round(2)
  end
end
