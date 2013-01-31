require "open-uri"
require "nokogiri"
require "awesome_print"
require "turn"
require "minitest/autorun"
require "wrong/adapters/minitest"
require "wrong/message/string_comparison"
require "wrong"
require "pry"
include Wrong


#module Node
  #module Title
    #def title
      #dom.css("a").text.strip
    #end
  #end

  #module Url
    #def url
      #dom.at_css("a")[:href]
    #end
  #end

  #module Location
    #def location
      #node = dom.at_css(".itempn")
      #node.text.strip[1..-2].strip
    #end
  #end

  #module Price
    #def price
      #dom.css(".itemph").text[/(?!>\$)\d+/].to_i
    #end
  #end

  #module Bedrooms
    #def bedrooms
      #dom.css(".itemph").text[/\d+(?=br)/].to_i
    #end
  #end

  #module SquareFeet
    #def square_feet
      #dom.css(".itemph").text[/\d+(?=ft)/].to_i
    #end
  #end

  #module Image
    #def image?
      #!!dom.at_css(".itempx").text[/(img|pic)/]
    #end
  #end

  #module Id
    #def id
      #dom.at_css("a")[:href][/\d+(?=\.html)/].to_i
    #end
  #end

  #module Map
    #def map?
      #!!dom.at_css(".itempx").text[/map/]
    #end
  #end
##end

#class Page
  #attr_reader :dom

  #def initialize(dom)
    #@dom = dom
  #end

  #def listings
    #dom.css("#toc_rows .row").map do |node|
      #Listing.new(node)
    #end
  #end
#end

#class Listing
  #attr_reader :dom

  #def initialize(dom)
    #@dom = dom
  #end

  #include Title
  #include Location
  #include Url
  #include Id
#end

##class HousingPage < Page
##end

#class HousingPage < Page

  #class Listing < ::Listing
    #include Price
    #include Bedrooms
    #include SquareFeet
    #include Image
    #include Map
  #end
#end

#class PersonalsPage < Page

  ##class Listing < ::Listing
    ##include Age
    ##include Seeking
  ##end
#end

class Page
  attr_reader :dom

  def initialize(dom)
    @dom = dom
  end

  def listings
    dom.css("#toc_rows .row").map do |node|
      Listing.new(node)
    end
  end
end

class Listing
  attr_reader :dom

  def initialize(dom)
    @dom = dom
  end

  def title
    dom.at_css("a").text.strip
  end

  def url
    dom.at_css("a")[:href]
  end

  def location
    node = dom.at_css(".itempn")
    return nil unless node
    text = node.text.strip[1..-2]
    text.strip if text
  end

  def price
    #node = dom.at_css(".itemph, .itempp")
    #
    text = dom.elements
             .reverse
             .map(&:text)
             .join("")[/(\$)(\d+)/, 2]
    return nil unless text
    text.to_i
    #return nil unless node
    #node.text[/(?!>\$)\d+/].to_i
  end

  def bedrooms
    node = dom.at_css(".itemph")
    return nil unless node
    node.text[/\d+(?=br)/].to_i
  end

  def square_feet
    node = dom.at_css(".itemph")
    return nil unless node
    node.text[/\d+(?=ft)/].to_i
  end

  def image?
    !!dom.at_css(".itempx").text[/(img|pic)/]
  end

  def id
    dom.at_css("a")[:href][/\d+(?=\.html)/].to_i
  end

  def map?
    !!dom.at_css(".itempx").text[/map/]
  end

  def posted_at
    current = dom
    while current = current.previous_element 
      return Date.parse(current) if current.name == "h4"
    end
  end

  def age
    dom.at_css("a").text[//]
  end

  def to_s
    "<#Listing>"
  end

end

housing = Nokogiri::HTML(open("housing.html"))
personals = Nokogiri::HTML(open("./personals.html"))
jobs = Nokogiri::HTML(open("./jobs.html"))
community_events = Nokogiri::HTML(open("./community_events.html"))
gigs = Nokogiri::HTML(open("./gigs.html"))
for_sale = Nokogiri::HTML(open("./for_sale.html"))

describe Page do
  it "parsers :housing" do
    listings = Page.new(housing).listings
    listing = listings[4]

    assert { listing.title == "SXSW 1 Bedroom for Rent - Great Location!" }
    assert { listing.location == "78704" }
    assert { listing.image? == true }
    assert { listing.price == 125 }
    assert { listing.bedrooms == 1 }
    assert { listing.square_feet == 750 }
    assert { listing.id == 3559890156 }
    assert { listing.map? == true }
    assert { listing.url == "http://austin.craigslist.org/vac/3559890156.html" }
    assert { listing.posted_at.strftime("%a %b %-d") == "Sun Jan 20" }
  end

  it "parsers :personals" do

    listings = Page.new(personals).listings
    listing = listings[4]

    assert { listing.title == "Mondays are wack (smoke me out:) - w4m - 18" }
    assert { listing.location == "Round Rock" }
    assert { listing.image? == false }
    assert { listing.price == nil }
    assert { listing.bedrooms == nil }
    assert { listing.square_feet == nil }
    assert { listing.id == 3561677599 }
    assert { listing.map? == false }
    assert { listing.url == "http://austin.craigslist.org/stp/3561677599.html" }
    assert { listing.posted_at.strftime("%a %b %-d") == "Mon Jul 8" }
  end

  it "parsers :jobs" do
    listings = Page.new(jobs).listings
    listing = listings[67]
    assert { listing.title == "PART TIME BOOKKEEPER" }
    assert { listing.location == ""}
    assert { listing.image? == false }
    assert { listing.price == nil }
    assert { listing.bedrooms == nil }
    assert { listing.square_feet == nil }
    assert { listing.id ==  3540776096 }
    assert { listing.map? == false }
    assert { listing.url == "http://austin.craigslist.org/acc/3540776096.html"}
    assert { listing.posted_at.strftime("%a %b %-d") == "Sat Jan 12" }
  end

  it "parsers the :community => :events" do
    listings = Page.new(community_events).listings
    listing = listings.first
    assert { listing.title == "AUSTIN EVENT CALENDAR" }
    assert { listing.location == "Austin"}
    assert { listing.image? == true }
    assert { listing.price == nil }
    assert { listing.bedrooms == nil }
    assert { listing.square_feet == nil }
    assert { listing.id ==  3560115596 }
    assert { listing.map? == false }
    assert { listing.url == "http://austin.craigslist.org/eve/3560115596.html" }
    #assert { listing.posted_at == nil }
    # TODO add date range
  end

  it "parsers :gigs" do
    listings = Page.new(gigs).listings
    listing = listings[90]
    assert { listing.title == "Looking for Videographer w/ HD camera to film 30 min LIVE Acoustic set" }
    assert { listing.location == "forest"}
    assert { listing.image? == false }
    assert { listing.price == nil }
    assert { listing.bedrooms == nil }
    assert { listing.square_feet == nil }
    assert { listing.id == 3462449099 }
    assert { listing.map? == false }
    assert { listing.url == "http://austin.craigslist.org/cwg/3462449099.html" }
  end

  it "parsers :for_sale" do
    listings = Page.new(for_sale).listings
    listing = listings[98]
    assert { listing.title == "Nokia 2330" }
    assert { listing.location == "Wells Branch"}
    assert { listing.image? == true }
    assert { listing.price == 25 }
    assert { listing.bedrooms == nil }
    assert { listing.square_feet == nil }
    assert { listing.id == 3562353152 }
    assert { listing.map? == false }
    assert { listing.url == "http://austin.craigslist.org/mob/3562353152.html" }
  end
end

