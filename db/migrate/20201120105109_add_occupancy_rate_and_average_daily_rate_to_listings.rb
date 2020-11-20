class AddOccupancyRateAndAverageDailyRateToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :occupancy_rate, :decimal
    add_column :listings, :average_daily_rate, :decimal
  end
end
