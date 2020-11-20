# frozen_string_literal: true
#
# == Schema Information
#
# Table name: statistics
#
#  id         :bigint           not null, primary key
#  available  :boolean          default(FALSE), not null
#  date       :datetime
#  price      :decimal(15, 2)
#  listing_id :bigint           not null
#
# Indexes
#
#  index_statistics_on_listing_id           (listing_id)
#  index_statistics_on_listing_id_and_date  (listing_id,date) UNIQUE
#
class Statistic < ApplicationRecord
  DAYS_COUNTER = 30.freeze

  belongs_to :listing, inverse_of: :statistics

  scope :limit_by_date, -> { where(date: DateTime.now.to_date ... DateTime.now.to_date + DAYS_COUNTER.days) }
  scope :booked, -> { where(statistics: { available: false }) }
  scope :unbooked, -> { where(statistics: { available: true }) }
end
