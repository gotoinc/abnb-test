# frozen_string_literal: true

class DataParsingService

  BASE_URI = 'https://www.airbnb.com/api/v3/PdpPlatformSections'.freeze

  Result = Struct.new(:name, :location)

  attr_reader :uid

  def initialize(uid:)
    @uid = uid
  end

  def call
    Result.new(
      response.dig('data', 'merlin', 'pdpSections', 'metadata', 'sharingConfig', 'title'),
      response.dig('data', 'merlin', 'pdpSections', 'metadata', 'sharingConfig', 'location')
    )
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
      operationName: 'PdpPlatformSections',
      locale: 'en',
      currency: 'USD',
      extensions: params_extentions,
      variables: params_vars
    }
  end

  def params_extentions
    { persistedQuery: { version: 1, sha256Hash: ENV['SECTIONS_SHA_256'] } }.to_json
  end

  def params_vars
    { request: { id: uid, layouts: %w[SIDEBAR SINGLE_COLUMN] } }.to_json
  end

  def response
    @response ||= JSON.parse(send_request.body)
  end
end
