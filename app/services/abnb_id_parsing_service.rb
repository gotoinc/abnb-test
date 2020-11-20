# frozen_string_literal: true

class AbnbIdParsingService

  SELECTOR_ABNB_ID = '#site-content form > input[name=hosting_id]'.freeze

  Result = Struct.new(:uid, :url)

  attr_reader :browser

  def call(url:)
    browser.get(url)
    uid
    browser.quit
    Result.new(uid, url)
  end

  private

  def browser
    @browser ||= Browser.new.call
  end

  def uid
    @uid ||= browser.find_element(:css, SELECTOR_ABNB_ID)&.attribute('value') rescue nil
  end
end
