# frozen_string_literal: true

require 'selenium-webdriver'

class Browser

  INITIAL_OPTIONS = %w[no-sandbox disable-dev-shm-usage disable-popup-blocking headless disable-gpu --enable-features=NetworkService,NetworkServiceInProcess --disable-features=VizDisplayCompositor].freeze

  def initialize
    Selenium::WebDriver::Wait.new(timeout: 20, interval: 3)
  end

  def call
    driver
  end

  private

  def driver
    @driver ||= Selenium::WebDriver.for :chrome, options: config
  end

  def config
    Selenium::WebDriver::Chrome::Options.new(args: INITIAL_OPTIONS, log_level: :error)
  end
end
