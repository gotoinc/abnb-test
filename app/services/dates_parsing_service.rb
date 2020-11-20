# frozen_string_literal: true

class DatesParsingService

  BASE_URI = 'https://www.airbnb.com/api/v3/PdpAvailabilityCalendar'.freeze

  ItemResult = Struct.new(:date, :available, :price)

  attr_reader :listing_id

  def call(listing_id)
    @listing_id = listing_id

    response = send_request
    result = JSON.parse(response.body)
    dates = result.dig('data', 'merlin', 'pdpAvailabilityCalendar', 'calendarMonths').map{ |month| month['days'] }.flatten
    dates.map do |date| ItemResult.new(
        Date.parse(date['calendarDate']),
        date['available'],
        date.dig('price', 'localPriceFormatted').to_s.gsub('$', '').to_i
      )
    end
  end

  private

  def send_request
    Faraday.get(data_url, {}, { 'X-Airbnb-GraphQL-Platform': 'web', 'X-Airbnb-API-Key': ENV['ABNB_KEY'] })
  end

  def data_url
    uri = URI.parse(BASE_URI)
    uri.query = Rack::Utils.build_query(params)
    uri.to_s
  end

  def params
    {
      operationName: 'PdpAvailabilityCalendar',
      locale: 'en',
      currency: 'USD',
      extensions: params_extentions,
      variables: params_vars,
    }
  end

  def params_extentions
    { persistedQuery: { version: 1, sha256Hash: ENV['CALENDAR_SHA_256'] } }.to_json
  end

  def params_vars
    { request: { count: 2, listingId: listing_id, month: DateTime.now.month, year: DateTime.now.year } }.to_json
  end
end
