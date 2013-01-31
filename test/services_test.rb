require "test_helper"
module Craig

  dom = Helper.dom("services.html")

  describe "Craig" do
    it "parses :services" do
      listings = Page.new(:services, nil, dom).listings
      listing = listings[4]

      assert { listing.title == "_____________________________________________________Austin Auto Sound" }
      assert { listing.location == "________________________________________" }
      assert { listing.has_image? == true }
      deny { listing.respond_to? :price }
      deny { listing.respond_to? :bedrooms }
      deny { listing.respond_to? :square_feet }
      assert { listing.id == 3552034013 }
      assert { listing.has_map? == false }
      assert { listing.url == "http://austin.craigslist.org/aos/3552034013.html" }
      assert { listing.posted_at.strftime("%a %b %-d") == "Tue Jan 22" }
      deny { listing.respond_to? :seller }
    end
  end

end
