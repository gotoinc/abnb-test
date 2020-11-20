# frozen_string_literal: true

class ListingService

  attr_accessor :data,
                :dates,
                :listing

  def initialize(data, user)
    @dates = []
    @data = data
    @listing = Listing.find_or_initialize_by(uid: data.uid, user_id: user&.id)
  end

  def call
    listing.assign_attributes(data.to_h)

    if listing.valid?
      listing.assign_attributes(DataParsingService.new(uid: data.uid).call.to_h)

      if listing.save
        Statistic.upsert_all(
          dates_parser.call(data.uid).map { |item| item.to_h.merge({ listing_id: listing.id }) },
          unique_by: %i[listing_id date]
        )
      end

      listing.update_columns(calculation_service.call.to_h)
    end

    listing
  end

  private

  def dates_parser
    DatesParsingService.new
  end

  def calculation_service
    CalculationService.new(listing)
  end
end
