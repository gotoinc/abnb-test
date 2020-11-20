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
require 'rails_helper'

RSpec.describe Statistic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
