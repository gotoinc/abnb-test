# frozen_string_literal: true
#
# == Schema Information
#
# Table name: listings
#
#  id         :bigint           not null, primary key
#  location   :string
#  name       :string
#  uid        :integer
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_listings_on_user_id  (user_id)
#
class Listing < ApplicationRecord

  has_many :statistics, dependent: :destroy, inverse_of: :listing

  validates :uid, :url, presence: true
  validates_with Validators::ListingUrlValidator
end
