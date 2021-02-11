class HomeController < ApplicationController
  CUSTOMER_REVIEW_IDS = [1, 2, 3].freeze

  def index
    @customer_reviews = ContentfulClient.fetch(CUSTOMER_REVIEW_IDS)
  end

  def pricing; end
end
