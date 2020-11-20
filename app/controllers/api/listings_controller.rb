# frozen_string_literal: true

module Api
  class ListingsController < ApplicationController

    protect_from_forgery unless: -> { request.format.json? }

    def index
      listings = Listing.all

      render json: listings
    end

    def create
      data = AbnbIdParsingService.new.call(url: url)
      listing =  ListingService.new(data, current_user).call

      render json: listing.decorate.as_json(methods: %i[occupancy_rate average_daily_rate])
    end

    private

    def url
      params.fetch(:url)
    end
  end
end