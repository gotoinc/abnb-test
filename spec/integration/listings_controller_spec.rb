require 'swagger_helper'

RSpec.describe 'Dashboard API' do
  path '/listings' do
    get 'Listings list' do
      tags 'Dashboard'
      consumes 'application/json'

      response '200', 'Listings collection' do
        run_test!
      end
    end

    post 'Creation listing' do
      tags 'Dashboard'
      consumes 'application/json'
      parameter name: 'url', in: :query, type: :string

      response '200', 'Listing' do
        let(:url) { 'https://www.airbnb.com/rooms/44203472' }

        run_test!
      end
    end
  end
end