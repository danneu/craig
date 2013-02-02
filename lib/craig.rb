require "date"
require "open-uri"
require "nokogiri"
require "craig/version"
require "craig/cities"
require "craig/categories"
require "craig/page"
require "craig/node"
require "craig/listing"
require "craig/craigslist"

module Craig

  # Craig's sole entrypoint for grabbing listings based on city and categories.
  #
  #   Craig.query(:austin, :jobs)
  #   Craig.query(:austin, :jobs => :web_info_design)
  #
  # @param [Symbol, String] city
  # @param [Symbol, String, Hash] categories
  # @return [Array<Listing>] the page's listings
  def self.query(city, categories)
    Craigslist.new(city, categories).listings
  end

end
