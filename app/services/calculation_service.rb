# frozen_string_literal: true

class CalculationService

  CalculationResult = Struct.new(:occupancy_rate, :average_daily_rate)

  attr_reader :listing

  def initialize(listing)
    @listing = listing
  end

  def call
    CalculationResult.new(occupancy_rate, average_daily_rate)
  end

  private

  def occupancy_rate
    (listing.statistics.limit_by_date.booked.count.to_f / 30).to_f.round(2)
  end

  def average_daily_rate
    (listing.statistics.limit_by_date.unbooked.sum(:price).to_f / 30).round(2)
  end
end