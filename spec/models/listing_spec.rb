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
require 'rails_helper'

RSpec.describe Listing, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
