# frozen_string_literal: true

module Api
  class UsersController < ApplicationController

    def show
      render json: current_user.as_json
    end
  end
end