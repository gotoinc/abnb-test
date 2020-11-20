# frozen_string_literal: true
#
# == Schema Information
#
# Table name: listings
#
#  id                 :bigint           not null, primary key
#  average_daily_rate :decimal(, )
#  location           :string
#  name               :string
#  occupancy_rate     :decimal(, )
#  uid                :integer
#  url                :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_listings_on_user_id  (user_id)
#
class Listing < ApplicationRecord

  has_many :statistics, dependent: :destroy, inverse_of: :listing

  validates :uid, :url, presence: true
  validates_with Validators::ListingUrlValidator

  scope :filtered_by_user, -> (user) { where(user_id: user&.id) }
  scope :latest, -> { order(created_at: :desc) }
end
