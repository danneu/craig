require "nokogiri"

module Craig

class Dom
  def self.get(filename)
    pwd = File.expand_path(File.dirname(__FILE__))
    Nokogiri::HTML(File.open(File.join(pwd, "sample_html", filename)))
  end
end

housing          = Dom.get("housing.html")
personals        = Dom.get("personals.html")
jobs             = Dom.get("jobs.html")
#community_events = Dom.get("community_events.html")
gigs             = Dom.get("gigs.html")
for_sale         = Dom.get("for_sale.html")

describe Page do
  page = Page.new(:personals, :strictly_platonic, "")
  it "resolves the Listing" do
    page = Page.new(:category, :subcategory, "")
    assert { page.send(:listing_const).to_s == "Craig::Listing::Base" }
  end
end

describe "Craig" do
  it "parses :housing => :vacation_rentals" do
    listings = Page.new(:housing, nil, housing).listings
    listing = listings[4]

    assert { listing.title == "SXSW 1 Bedroom for Rent - Great Location!" }
    assert { listing.location == "78704" }
    assert { listing.has_image? == true }
    assert { listing.price == 125 }
    assert { listing.bedrooms == 1 }
    assert { listing.square_feet == 750 }
    assert { listing.id == 3559890156 }
    assert { listing.has_map? == true }
    assert { listing.url == "http://austin.craigslist.org/vac/3559890156.html" }
    assert { listing.posted_at.strftime("%a %b %-d") == "Sun Jan 20" }
  end

  it "parses :personals" do
    listings = Page.new(:personals, :strictly_personal, personals).listings
    listing = listings[4]
    assert { listing.title == "Mondays are wack (smoke me out:) - w4m - 18" }
    assert { listing.location == "Round Rock" }
    assert { listing.has_image? == false }
    deny { listing.respond_to? :price }
    deny { listing.respond_to? :bedrooms }
    deny { listing.respond_to? :square_feet }
    assert { listing.id == 3561677599 }
    assert { listing.has_map? == false }
    assert { listing.url == "http://austin.craigslist.org/stp/3561677599.html" }
    assert { listing.posted_at.strftime("%a %b %-d") == "Mon Jul 8" }
  end

  it "parses :jobs" do
    listings = Page.new(:jobs, :accounting_finance, jobs).listings
    listing = listings[67]
    assert { listing.title == "PART TIME BOOKKEEPER" }
    assert { listing.location == ""}
    assert { listing.has_image? == false }
    deny { listing.respond_to? :price }
    deny { listing.respond_to? :bedrooms }
    deny { listing.respond_to? :square_feet }
    assert { listing.id ==  3540776096 }
    assert { listing.has_map? == false }
    assert { listing.url == "http://austin.craigslist.org/acc/3540776096.html"}
    assert { listing.posted_at.strftime("%a %b %-d") == "Sat Jan 12" }
  end

  #it "parses :community => :events" do
    #listings = Page.new(:community, :events, community_events).listings
    #listing = listings.first
    #assert { listing.title == "AUSTIN EVENT CALENDAR" }
    #assert { listing.location == "Austin"}
    #assert { listing.image? == true }
    #deny { listing.respond_to? :price }
    #deny { listing.respond_to? :bedrooms }
    #deny { listing.respond_to? :square_feet }
    #assert { listing.id ==  3560115596 }
    #assert { listing.map? == false }
    #assert { listing.url == "http://austin.craigslist.org/eve/3560115596.html" }
    ##assert { listing.posted_at == nil }
    ## TODO add date range
  #end

  it "parses :gigs" do
    listings = Page.new(:gigs, :crew, gigs).listings
    listing = listings[90]
    assert { listing.title == "Looking for Videographer w/ HD camera to film 30 min LIVE Acoustic set" }
    assert { listing.location == "forest"}
    assert { listing.has_image? == false }
    deny { listing.respond_to? :price }
    deny { listing.respond_to? :bedrooms }
    deny { listing.respond_to? :square_feet }
    assert { listing.id == 3462449099 }
    assert { listing.has_map? == false }
    assert { listing.url == "http://austin.craigslist.org/cwg/3462449099.html" }
  end

  it "parses :for_sale" do
    listings = Page.new(:for_sale, :cars_trucks, for_sale).listings
    listing = listings[98]
    assert { listing.title == "Nokia 2330" }
    assert { listing.location == "Wells Branch"}
    assert { listing.has_image? == true }
    assert { listing.price == 25 }
    deny { listing.respond_to? :bedrooms }
    deny { listing.respond_to? :square_feet }
    assert { listing.id == 3562353152 }
    assert { listing.has_map? == false }
    assert { listing.url == "http://austin.craigslist.org/mob/3562353152.html" }
  end

end
end
