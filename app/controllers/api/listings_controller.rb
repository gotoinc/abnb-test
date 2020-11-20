# frozen_string_literal: true

module Api
  class ListingsController < ApplicationController

    before_action only: %i[create] do
      blank_listing = Listing.new(url: url)
      blank_listing.valid?
      render json: { error: blank_listing.errors.messages[:url].first } if blank_listing.errors[:url].any?
    end

    def index
      listings = Listing.filtered_by_user(current_user).latest

      render json: listings
    end

    def create
      data = AbnbIdParsingService.new.call(url: url)
      listing = ListingService.new(data, current_user).call

      render json: listing
    end

    private

    def url
      params.fetch(:url)
    end
  end
end